package org.ws.java.order.wsutils;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.BeanUtils;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

public class WsListUtils {

    public static void main(String[] args) {
    }


    public static <T,E> List<T>ListToList(List<E> list,Class<T> tClass){
        try {
            List<T> list1 = new ArrayList<>(list.size());
            for(E o1:list){
                Object o2 = (T)tClass.newInstance();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;

    }


    public static <T,E> T copyObject(E object,Class<T> tClass){
        Class c1 = object.getClass();
        Field fields1[] = c1.getDeclaredFields();
        Field fields2[] = c1.getFields();
        HashSet<Field> fieldHashSet = new HashSet<>();
        for(int i = 0; i < fields1.length; i++){
            fieldHashSet.add(fields1[i]);
        }
        for(int i = 0; i < fields2.length; i++){
            fieldHashSet.add(fields2[i]);
        }
        System.out.println(JSON.toJSONString(fieldHashSet));
        return null;
    }

    public static String objectGetMethodName(Field field){
        String fieldName = field.getName();
        return "get"+fieldName.substring(0,1).toUpperCase()+fieldName.substring(1,fieldName.length());
    }

    public static String objectSetMethodName(Field field){
        String fieldName = field.getName();
        return "set"+fieldName.substring(0,1).toUpperCase()+fieldName.substring(1,fieldName.length());
    }
}
