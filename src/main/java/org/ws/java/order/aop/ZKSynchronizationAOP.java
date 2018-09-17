package org.ws.java.order.aop;

import lombok.extern.slf4j.Slf4j;
import org.apache.zookeeper.*;
import org.apache.zookeeper.data.Stat;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.ws.java.order.annotation.ZKSynchranization;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

@Component
@Aspect
@Slf4j
public class ZKSynchronizationAOP {
    //private static ZooKeeper zooKeeper;
    static {
        try {
            //ooKeeper zooKeeper = connectionZookeeper("wslx");
            //zooKeeper.close();
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    @Around("@annotation(zkSynchranization)")
    public Object ZKTranscation(ProceedingJoinPoint proceedingJoinPoint, ZKSynchranization zkSynchranization) throws Throwable{
        ZooKeeper zooKeeper = connectionZookeeper("wslx");
        try {
            Object object = null;
            String mothodName = proceedingJoinPoint.getSignature().getName();
            String name = proceedingJoinPoint.getSignature().getDeclaringTypeName();
            String str = name+"."+mothodName;
            str = str.replaceAll("[.]","");
            object  = writeData(zooKeeper,str,proceedingJoinPoint);
            //zooKeeper.close();
            return object;
        }finally {
            log.info("zookeeper关闭");
            zooKeeper.close();
        }

    }

    public static ZooKeeper connectionZookeeper(String name){
        CountDownLatch countDownLatch = new CountDownLatch(1);
        try {
            ZooKeeper zooKeeper = new ZooKeeper("localhost:2181", 1500, new Watcher() {
                @Override
                public void process(WatchedEvent watchedEvent) {
                    if(watchedEvent.getState().equals(Event.KeeperState.SyncConnected)&&watchedEvent.getType().equals(Event.EventType.None)){
                        countDownLatch.countDown();
                        log.info("连接成功"+name);
                    }
                }
            });
            countDownLatch.await(15, TimeUnit.SECONDS);
            if(countDownLatch.getCount()==1){
                return connectionZookeeper(name);
            }
            return zooKeeper;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public static Object writeData(ZooKeeper zooKeeper,String name,ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
        try {
            Object object = null;
            CountDownLatch countDownLatch = new CountDownLatch(1);
            Stat stat = zooKeeper.exists("/"+name, new Watcher() {
                @Override
                public void process(WatchedEvent watchedEvent) {
                    if(watchedEvent.getType().equals(Event.EventType.NodeDeleted)){
                        try {
                            countDownLatch.countDown();
                        }catch (Exception e){
                            e.printStackTrace();
                        }
                    }else if(watchedEvent.getType().equals(Event.EventType.NodeCreated)){
                        try {
                            log.info("节点创建");
                            zooKeeper.exists("/"+name, true);
                        }catch (Throwable throwable){
                            throwable.printStackTrace();
                        }
                    }
                    else {
                        try {
                            zooKeeper.exists("/"+name, true);
                        }catch (Throwable throwable){
                            throwable.printStackTrace();
                        }
                    }
                }
            });
            if(stat != null){
                countDownLatch.await();

            }
            zooKeeper.create("/"+name,name.getBytes(), ZooDefs.Ids.READ_ACL_UNSAFE, CreateMode.EPHEMERAL);
            object = proceedingJoinPoint.proceed();
            zooKeeper.delete("/"+name,-1);
            return object;
        }catch (KeeperException e){
            //e.printStackTrace();
            return writeData(zooKeeper,name,proceedingJoinPoint);
        }catch (InterruptedException e){
            //e.printStackTrace();
            return writeData(zooKeeper,name,proceedingJoinPoint);
        }

    }
}
