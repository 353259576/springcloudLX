package org.ws.java.order.service;

import lombok.extern.slf4j.Slf4j;
import org.ws.java.order.controller.RoleHendleController;
import org.ws.java.order.model.dto.UserRoleDTO;
import org.ws.java.order.model.po.UserPO;

import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

@Slf4j
public class UserRoleService {
    public static final Map<Long,UserRoleDTO> userRole = new ConcurrentHashMap<>();
    public static final DelayQueue<UserRoleDTO> userRoleDTOS = new DelayQueue<UserRoleDTO>();
    public static final ExecutorService executorService = Executors.newSingleThreadExecutor();
    public static final ExecutorService changeExecutorService = Executors.newSingleThreadExecutor();
    public static volatile RoleHendleController roleHendleController;
    public static final Lock lock = new ReentrantLock();
    public static final Condition condition = lock.newCondition();
    public static final AtomicInteger k = new AtomicInteger(0);


    static {
        executorService.execute(()->{
            UserRoleDTO userRoleDTO = null;
            Long userId = null;
            while (true){
                try {
                    userRoleDTO = userRoleDTOS.take();
                    if(userRoleDTO != null){
                        userId = userRoleDTO.getUserId();
                        if(userRole.remove(userId,userRoleDTO)){
                            log.info("用户ID"+userId+"于"+userRoleDTO.getCreateDate()+"创建的权限清除");
                        }else {
                            log.info("权限不存在");
                        }
                    }
                }catch (Exception e){
                    e.printStackTrace();
                }finally {
                    userRoleDTO = null;
                    userId = null;
                }

            }
        });
        changeExecutorService.execute(()->{
            while (roleHendleController == null){

            }
            lock.lock();
            try {
                Long statTime = null;
                Long endTime = null;
                while (true){
                    try {
                        condition.await();
                        statTime = System.currentTimeMillis();
                        log.info("开始进行权限修改");
                        Set<Map.Entry<Long,UserRoleDTO>> set = userRole.entrySet();
                        Iterator<Map.Entry<Long,UserRoleDTO>> iterator = set.iterator();
                        UserRoleDTO newUserRoleDTO = null;
                        UserRoleDTO userRoleDTO = null;
                        UserPO userPO = new UserPO();
                        Long userId = null;
                        Map.Entry<Long,UserRoleDTO> entry = null;
                        while (iterator.hasNext()){
                            entry = iterator.next();
                            userId = entry.getKey();
                            userRoleDTO = entry.getValue();
                            userPO.setId(userId);
                            newUserRoleDTO = roleHendleController.createUserRoleDTO(userPO);
                            userRoleDTO.userRoleServiceCopy(newUserRoleDTO);
                            newUserRoleDTO = null;
                            userRoleDTO = null;
                            entry = null;
                        }
                        set = null;
                        iterator = null;
                        userPO = null;

                    }catch (Exception e){
                        e.printStackTrace();
                    }finally {
                        endTime = System.currentTimeMillis();
                        log.info("权限修改完成,一共"+userRole.size()+"个用户，耗时："+(endTime - statTime)+"毫秒");
                        statTime = null;
                        endTime = null;
                    }

                }
            }finally {
                lock.unlock();
            }

        });

        Thread thread = new Thread(()->{
            while (true){
                lock.lock();

                try {
                    if(k.intValue() > 0){
                        condition.signalAll();
                        k.set(0);
                    }
                }catch (Exception e){
                    e.printStackTrace();
                }
                finally {
                    lock.unlock();
                }
            }
        });
        thread.start();
    }

    public static UserRoleDTO getUserRole(Long userId){
        UserRoleDTO userRoleDTO = userRole.get(userId);
        if(userRoleDTO == null) {
            return userRoleDTO;
        }
        userRoleDTO.setUpdateDate(new Date());
        return userRoleDTO;
    }

    public static void startChangeRole(){
        k.getAndIncrement();
    }

    public static void setUserRole(Long userId,UserRoleDTO userRoleDTO){
        userRoleDTO.setCreateDate(new Date());
        userRoleDTO.setUpdateDate(new Date());
        userRoleDTO.setUserId(userId);
        UserRoleDTO oldUserRoleDTO = userRole.get(userId);
        if(oldUserRoleDTO != null){
            userRoleDTOS.remove(oldUserRoleDTO);
        }
        //userRoleDTO.setExpirationTime(60l*1000l*1l);
        userRole.put(userId,userRoleDTO);
        userRoleDTOS.add(userRoleDTO);

    }
}
