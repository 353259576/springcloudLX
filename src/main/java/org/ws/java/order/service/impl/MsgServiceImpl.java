package org.ws.java.order.service.impl;

import com.alibaba.fastjson.JSON;
import io.netty.util.internal.ConcurrentSet;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.ws.java.order.annotation.Authority;
import org.ws.java.order.annotation.DataBase;
import org.ws.java.order.config.DynamicDataSource;
import org.ws.java.order.constants.DataBaseConstant;
import org.ws.java.order.constants.MsgEnum;
import org.ws.java.order.constants.SystemConstants;
import org.ws.java.order.dao.jpa.MsgDAO;
import org.ws.java.order.dao.mapper.MsgMapper;
import org.ws.java.order.model.po.MsgPO;
import org.ws.java.order.model.po.RolePO;
import org.ws.java.order.model.po.RoleUserBindPO;
import org.ws.java.order.model.po.UserPO;
import org.ws.java.order.model.vo.AjaxVO;
import org.ws.java.order.model.vo.PageInfo;
import org.ws.java.order.model.vo.PageVO;
import org.ws.java.order.service.MsgService;
import org.ws.java.order.service.RoleService;

import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.nio.channels.WritableByteChannel;
import java.util.*;
import java.util.concurrent.*;

@Service
@Slf4j
public class MsgServiceImpl implements MsgService {
    public static final Map<Long, ConcurrentSet<HttpServletResponse>> map = new ConcurrentHashMap<>();
    public static final Map<HttpServletResponse, CountDownLatch> map1 = new ConcurrentHashMap<>();
    public static final Map<HttpServletResponse, Long> map2 = new ConcurrentHashMap<>();
    public static final ExecutorService executorService = Executors.newCachedThreadPool();
    @Autowired
    private MsgDAO msgDAO;

    @Autowired
    private MsgMapper msgMapper;

    @Autowired
    private RoleService roleService;

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class)
    public Long insertMsg(MsgPO msgPO) throws RuntimeException {
        msgPO.setMsgCreateDate(new Date());
        return msgDAO.save(msgPO).getId();
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public PageInfo<MsgPO> selectMsgByUser(Map map) throws RuntimeException {
        List<MsgPO> msgPOS = msgMapper.selectUserMsgByUser(map);
        PageVO pageVO = (PageVO) map.get(DataBaseConstant.PAGE);
        PageInfo<MsgPO> msgPOPageInfo = new PageInfo<>();
        msgPOPageInfo.setPageVO(pageVO);
        msgPOPageInfo.setDataList(msgPOS);
        return msgPOPageInfo;
    }

    @Override
    public void msgHandle(Long index,HttpServletResponse response) {

        CountDownLatch countDownLatch = new CountDownLatch(1);
        try {
            if(map.get(index) != null){
                map.get(index).add(response);
            }else {
                ConcurrentSet<HttpServletResponse> set = new ConcurrentSet<>();
                set.add(response);
                map.put(index,set);
            }
            map1.put(response,countDownLatch);
            map2.put(response,index);
            log.info("连接暂停");
            countDownLatch.await(1l, TimeUnit.MINUTES);
            if(countDownLatch.getCount()>0){
                AjaxVO ajaxVO = AjaxVO.returnReconnectMsg(null);
                this.responseSendMsg(response,ajaxVO);
            }
            log.info("连接重启");
        }catch (Exception e){
            e.printStackTrace();
            log.info("连接出错");
        }finally {
            map1.remove(response);
            Long key = map2.get(response);
            if(key != null){
                ConcurrentSet<HttpServletResponse> set = map.get(key);
                if(set != null){
                    set.remove(response);
                }
            }
            map2.remove(response);
        }

    }


    @Override
    public void msgSend(Long userIds[],Object msg) throws RuntimeException {

        if(userIds == null){
            Set<Map.Entry<Long,ConcurrentSet<HttpServletResponse>>> set = map.entrySet();
            Iterator<Map.Entry<Long,ConcurrentSet<HttpServletResponse>>> iterator = set.iterator();

            Map.Entry<Long,ConcurrentSet<HttpServletResponse>> entry = null;
            ConcurrentSet<HttpServletResponse> concurrentSet = null;
            Iterator<HttpServletResponse> responseIterator = null;
            while (iterator.hasNext()){

                entry = iterator.next();
                concurrentSet = entry.getValue();
                responseIterator = concurrentSet.iterator();

                sendMsg(msg, responseIterator);

            }



        }else {
            for(int i = 0; i < userIds.length; i++){
                Long userId = userIds[i];
                executorService.execute(()->{
                    ConcurrentSet<HttpServletResponse> concurrentSet = map.get(userId);

                    if (concurrentSet != null) {
                        Iterator<HttpServletResponse> iterator = concurrentSet.iterator();
                        sendMsg(msg, iterator);

                    }
                });
            }


        }

    }

    @Override
    public void msgSend(RolePO rolePO, UserPO userPO, Object msg) throws RuntimeException {
            if(rolePO == null){
                return;
            }
            MsgPO msgPO = new MsgPO();
            msgPO.setMsgCreateUser(userPO.getId());
            msgPO.setMsgName(JSON.toJSONString(msg));
            msgPO.setMsgCreateDate(new Date());
            msgPO.setMsgSendRole(rolePO.getId());
            msgPO.setMsgStatus(Integer.valueOf(MsgEnum.MSGEXIST.getCode()));
            msgPO.setMsgRead(Integer.valueOf(MsgEnum.MSGUNREAD.getCode()));
            insertMsg(msgPO);
            List<RoleUserBindPO> roleUserBindPOS = roleService.selectRoleUserBindByRoleId(rolePO.getId());
            if(!(roleUserBindPOS == null || roleUserBindPOS.size() == 0)){
                Set<Long> set = new HashSet<>();
                for (RoleUserBindPO r:roleUserBindPOS) {
                    set.add(r.getUserId());
                }
                msgSend(set.toArray(new Long[set.size()]),msg);
            }
    }

    private void sendMsg(Object msg, Iterator<HttpServletResponse> responseIterator) {
        while (responseIterator.hasNext()) {
            HttpServletResponse response = responseIterator.next();
            executorService.execute(()->{
                try {
                    this.responseSendMsg(response, msg);
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    CountDownLatch countDownLatch = map1.get(response);
                    if (countDownLatch != null) {
                        countDownLatch.countDown();
                    }
                }
            });


        }
    }


    private void responseSendMsg(HttpServletResponse response,Object msg){
        OutputStream outputStream = null;
        ByteBuffer byteBuffer = null;
        WritableByteChannel writableByteChannel = null;
        try {
            outputStream = response.getOutputStream();
            writableByteChannel = Channels.newChannel(outputStream);
            byteBuffer = ByteBuffer.wrap(JSON.toJSONString(msg).getBytes("UTF-8"));
            while (byteBuffer.hasRemaining()){
                writableByteChannel.write(byteBuffer);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            try {
                if(writableByteChannel != null){
                    writableByteChannel.close();
                }
            }catch (Exception e){
                e.printStackTrace();
            }finally {
                writableByteChannel = null;
            }

            try {
                if(outputStream != null){
                    outputStream.flush();
                    outputStream.close();
                }
            }catch (Exception e){
                e.printStackTrace();
            }finally {
                outputStream = null;
            }

            try {
                if(byteBuffer != null){
                    byteBuffer.clear();
                }
            }catch (Exception e){
                e.printStackTrace();
            }finally {
                byteBuffer = null;
            }

        }

    }
}