package org.ws.java.order.service;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.ws.java.order.constants.ChildOrderEnum;
import org.ws.java.order.constants.OrderEnum;
import org.ws.java.order.model.dto.ChildOrderHandleDTO;
import org.ws.java.order.model.po.ChildOrderPO;

import javax.transaction.TransactionManager;
import java.util.Date;
import java.util.List;
import java.util.concurrent.*;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

@Getter
@Setter
@Slf4j
public class ChildOrderHandleService {

    private static OrderService orderService;

    private static PlatformTransactionManager platformTransactionManager;


    private static DelayQueue<ChildOrderHandleDTO> childOrderHandleDTOS = new DelayQueue<>();

    private static Executor executor = Executors.newSingleThreadExecutor();

    private static ScheduledExecutorService executor1 = Executors.newScheduledThreadPool(1);

    private static CountDownLatch countDownLatch = new CountDownLatch(2);

    private static Long expirationTime = 60*1000*10l;
    static {
        executor.execute(()->{
            try {
                Long startTime = System.currentTimeMillis();
                countDownLatch.await();
                Long endTime = System.currentTimeMillis();
                log.info("线程等待"+(endTime - startTime)+"毫秒");
            }catch (Exception e){
                e.printStackTrace();
            }
            try {
                while (true){
                    ChildOrderHandleDTO childOrderHandleDTO = childOrderHandleDTOS.take();
                    if(childOrderHandleDTO != null){
                        ChildOrderPO childOrderPO = orderService.selectChildOrderById(childOrderHandleDTO.getChildOrderId());
                        log.info("系统监测到超时订单，订单编号"+childOrderPO.getChildOrderNo());
                        if(childOrderPO.getChildOrderStatus().toString().equals(ChildOrderEnum.CHILDORDERPROCEED.getCode())){
                            DefaultTransactionDefinition transactionDefinition = new DefaultTransactionDefinition();
                            transactionDefinition.setIsolationLevel(TransactionDefinition.ISOLATION_READ_COMMITTED);
                            transactionDefinition.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
                            TransactionStatus transactionStatus = platformTransactionManager.getTransaction(transactionDefinition);
                            boolean k = false;
                            try {
                                orderService.updateChildOrderStatusById(childOrderPO.getId(),Integer.valueOf(ChildOrderEnum.CHILDORDEROVERTIME.getCode()));
                                orderService.updateChildOrOrderByChildFailedRemake(childOrderPO.getId(),"订单超时");
                                orderService.updateAddtractNum(childOrderPO.getParentOrderId());
                                k = true;
                            }catch (Exception e){
                                e.printStackTrace();
                            }finally {
                                if(k){
                                    platformTransactionManager.commit(transactionStatus);
                                    log.info("订单编号"+childOrderPO.getChildOrderNo()+"过期成功");
                                }else {
                                    platformTransactionManager.rollback(transactionStatus);
                                    log.info("订单编号"+childOrderPO.getChildOrderNo()+"过期成功");
                                }
                            }



                        }else {
                            log.info("订单编号"+childOrderPO.getChildOrderNo()+"以进入其他状态不自动关闭");
                        }
                    }

                }
            }catch (Exception e){
                e.printStackTrace();
                log.info("订单处理失效");
            }

        });

        executor1.scheduleAtFixedRate(()->{
            log.info("线程开始处理未正常过期订单");
            try {
                try {
                    List<ChildOrderPO> childOrderPOS = orderService.selectOverdueChildOrder(new Date(System.currentTimeMillis() - expirationTime),Integer.valueOf(ChildOrderEnum.CHILDORDERPROCEED.getCode()));
                    if(childOrderPOS != null && childOrderPOS.size() != 0){
                        log.info("确认存在未正常过期订单，数量为"+childOrderPOS.size());
                        DefaultTransactionDefinition defaultTransactionDefinition = new DefaultTransactionDefinition();
                        defaultTransactionDefinition.setIsolationLevel(TransactionDefinition.ISOLATION_READ_COMMITTED);
                        defaultTransactionDefinition.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
                        TransactionStatus transactionStatus = platformTransactionManager.getTransaction(defaultTransactionDefinition);
                        boolean k = false;
                        try {
                            for(int i = 0; i < childOrderPOS.size(); i++){
                                orderService.updateChildOrderStatusById(childOrderPOS.get(i).getId(),Integer.valueOf(ChildOrderEnum.CHILDORDEROVERTIME.getCode()));
                                orderService.updateChildOrOrderByChildFailedRemake(childOrderPOS.get(i).getId(),"订单超时");
                                orderService.updateAddtractNum(childOrderPOS.get(i).getParentOrderId());
                            }
                            k = true;
                            log.info("处理完成");
                        }catch (Exception e1){
                            e1.printStackTrace();
                            log.info("处理失败");
                        }finally {
                            if(k){
                                platformTransactionManager.commit(transactionStatus);
                            }else {
                                platformTransactionManager.rollback(transactionStatus);
                            }

                        }

                    }

                }catch (Exception e){
                    e.printStackTrace();
                }
            }catch (Exception e){
                e.printStackTrace();
            }

        },100,600,TimeUnit.SECONDS);

    }

    public static void setChildOrderHandle(Long parentOrderId,Long childOrderId){
        ChildOrderHandleDTO childOrderHandleDTO = new ChildOrderHandleDTO();
        childOrderHandleDTO.setCreateDate(new Date());
        childOrderHandleDTO.setExpirationTime(60*1000l*10);
        childOrderHandleDTO.setChildOrderId(childOrderId);
        childOrderHandleDTO.setOrderId(parentOrderId);
        childOrderHandleDTOS.add(childOrderHandleDTO);
    }

    public static void setOrderService(OrderService orderService) {
        ChildOrderHandleService.orderService = orderService;
        countDownLatch.countDown();
    }

    public static void setPlatformTransactionManager(PlatformTransactionManager platformTransactionManager) {
        ChildOrderHandleService.platformTransactionManager = platformTransactionManager;
        countDownLatch.countDown();
    }

}
