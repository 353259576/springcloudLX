package org.ws.java.order.wsutils.lx;

import com.alibaba.fastjson.JSON;
import org.ws.java.order.controller.search.indexcontroller.CeShiSearch;
import org.ws.java.order.model.po.MenuPO;
import org.ws.java.order.model.vo.MenuVO;
import redis.clients.jedis.Jedis;

import java.lang.reflect.Field;
import java.util.Map;

public class RedisLx {
    public static void main(String[] args) {
        /*Jedis jedis = new Jedis("localhost",6379);
        System.out.println("连接成功");
        System.out.println(jedis.ping());*/
        try {
            /*Field field = CeShiSearch.class.getDeclaredField("companys");
            System.out.println(field.getType().getTypeName());
            String fieldName = field.getGenericType().getTypeName();
            int begin = fieldName.indexOf("<") + 1;
            int end = fieldName.lastIndexOf(">");
            String fieldGeneric = fieldName.substring(begin,end);
            System.out.println(fieldGeneric);*/
            CeShiSearch valueObject = new CeShiSearch();
            Field field = valueObject.getClass().getDeclaredField("companys");
            field.setAccessible(true);
            String[] strings = (String[])field.get(valueObject);
            System.out.println(String[].class.getTypeName());
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
