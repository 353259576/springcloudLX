package org.ws.java.order.wsutils.lx;

import java.util.Date;
import java.util.concurrent.DelayQueue;
import java.util.concurrent.TimeUnit;

public class DelayQueueLx {

    public static void main(String[] args) throws Throwable{

        DelayQueue<DataBox> dataBoxes = new DelayQueue<>();
        DataBox dataBox = null;
        for(int i = 0; i < 10; i++){
            dataBox = new DataBox();
            dataBox.setName("第"+i+"个");
            dataBox.setRemake("这是第"+i+"个");
            dataBox.setCreateDate(new Date(new Date().getTime() + 20000));
            dataBoxes.add(dataBox);
            Thread.sleep(1000);
            System.out.println("添加到"+i);
        }
        Thread thread = new Thread(()->{
            while (true){
                try {
                    DataBox dataBox1 = dataBoxes.take();
                    System.out.println(dataBox1.getName());
                    Thread thread1 = Thread.currentThread();
                    System.out.println(thread1.getName());
                }catch (Exception e){
                    e.printStackTrace();
                }

            }
        });
        thread.start();
        System.out.println(thread.getName());
        Thread.sleep(5000);

        for(int i = 0; i < 10; i++){
            dataBox = new DataBox();
            dataBox.setName("第"+i+"个");
            dataBox.setRemake("这是第"+i+"个");
            dataBoxes.add(dataBox);
            Thread.sleep(1000);
            System.out.println("添加到"+i);
        }
    }
}
