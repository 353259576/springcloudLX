package org.ws.java.order.controller;

import io.netty.util.internal.ConcurrentSet;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.ws.java.order.annotation.Authority;
import org.ws.java.order.constants.AllStatusConstants;
import org.ws.java.order.constants.MsgEnum;
import org.ws.java.order.constants.SystemConstants;
import org.ws.java.order.controller.search.msgcontroller.IndexSearch;
import org.ws.java.order.controller.search.msgcontroller.SendMsgSearch;
import org.ws.java.order.model.dto.UserRoleDTO;
import org.ws.java.order.model.po.*;
import org.ws.java.order.model.vo.AjaxVO;
import org.ws.java.order.model.vo.MsgVO;
import org.ws.java.order.model.vo.PageInfo;
import org.ws.java.order.service.*;
import org.ws.java.order.service.impl.MsgServiceImpl;
import org.ws.java.order.utils.PageConvertUtil;
import org.ws.java.order.wsutils.DataBaseHandle.MySearchList;
import org.ws.java.order.wsutils.WsStringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.servlet.http.HttpSession;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.nio.channels.WritableByteChannel;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping("/order/msg")
@Slf4j
public class MsgController extends BaseController{
    @Autowired
    private MsgService msgService;

    @Autowired
    private CompanyService companyService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private UserService userService;

    @Autowired
    private DictService dictService;


    @RequestMapping(value = "selectMsgByUser")
    @ApiOperation(value = "查询消息",httpMethod = "POST")
    @Authority
    public AjaxVO selectMsgByUser(MySearchList mySearchList){
        PageInfo<MsgPO> msgPOPageInfo = msgService.selectMsgByUser(mySearchList.createMybaitsMap());
        PageInfo<MsgVO> msgVOPageInfo = PageConvertUtil.convertPage(msgPOPageInfo,MsgVO.class);
        UserPO userPO = null;
        DictPO dictPO = null;
        for(MsgVO msgVO:msgVOPageInfo.getDataList()){
            if(msgVO.getMsgCreateDate() != null){
                msgVO.setMsgCreateDateLabel(WsStringUtils.dateToString(msgVO.getMsgCreateDate(),WsStringUtils.LONGTIMESTRING));
            }
            if(msgVO.getMsgCreateUser() != null){
                userPO = userService.selectUserById(msgVO.getMsgCreateUser());
                msgVO.setMsgCreateUserLabel(userPO.getUserName());
            }
            if(msgVO.getMsgSendUser() != null){
                userPO = userService.selectUserById(msgVO.getMsgSendUser());
                msgVO.setMsgSendUserLabel(userPO.getUserName());
            }
            if(msgVO.getMsgStatus() != null){
                dictPO = dictService.selectDictByCodeAndType(msgVO.getMsgStatus().toString(), AllStatusConstants.MSGSTATUS);
                if(dictPO != null){
                    msgVO.setMsgStatusLabel(dictPO.getLabel());
                }
            }
            if(msgVO.getMsgType() != null){
                dictPO = dictService.selectDictByCodeAndType(msgVO.getMsgStatus().toString(), AllStatusConstants.MSGTYPE);
                if(dictPO != null){
                    msgVO.setMsgTypeLabel(dictPO.getLabel());
                }
            }

        }
        AjaxVO ajaxVO = AjaxVO.newAjax();
        ajaxVO.putDataList(msgVOPageInfo);
        return ajaxVO;
    }







    @RequestMapping("index")
    @ApiOperation(value = "请求消息",httpMethod = "POST")
    @Authority
    public void index(@RequestBody IndexSearch indexSearch){
        Long index = indexSearch.index;
        HttpServletResponse response = this.getHttpServletResponse();
        //HttpServletRequest request = this.getHttpServletRequest();
        msgService.msgHandle(index,response);
    }

    @RequestMapping("sendMsg")
    @ApiOperation(value = "传入消息",httpMethod = "POST")
    @Authority
    public AjaxVO sendMsg(@RequestBody SendMsgSearch sendMsgSearch) {
        HttpSession session = this.getHttpSession();
        UserPO userPO = (UserPO)session.getAttribute(SystemConstants.USER);
        UserRoleDTO userRoleDTO = UserRoleService.getUserRole(userPO.getId());
        if(StringUtils.isEmpty(sendMsgSearch.msg)){
            return AjaxVO.returnFailMsg("消息为空");
        }
        if(sendMsgSearch.roleId == null){
            if(userRoleDTO.getAdminMenuPOS().size()==0){
                return AjaxVO.returnFailMsg("非管理员不得发送通知消息");
            }
            MsgPO msgPO = new MsgPO();
            msgPO.setMsgCreateUser(userPO.getId());
            msgPO.setMsgName(sendMsgSearch.msg);
            msgPO.setMsgCreateDate(new Date());
            msgPO.setMsgStatus(Integer.valueOf(MsgEnum.MSGEXIST.getCode()));
            msgPO.setMsgRead(Integer.valueOf(MsgEnum.MSGUNREAD.getCode()));
            msgService.insertMsg(msgPO);
            msgService.msgSend(null,sendMsgSearch.msg);
        } else{
            RolePO rolePO = roleService.selectRoleByRoleId(sendMsgSearch.roleId);
            if(rolePO == null){
                return AjaxVO.returnFailMsg("群组不存在");
            }
            msgService.msgSend(rolePO,userPO,sendMsgSearch.msg);

        }
        return AjaxVO.returnSuccMsg("发送成功");
    }



}
