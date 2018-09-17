package org.ws.java.order.wsutils;

import com.alibaba.fastjson.JSON;
import org.ws.java.order.model.po.UserPO;
import org.ws.java.order.wsutils.lx.BaseDemoObject;
import org.ws.java.order.wsutils.lx.DemoObject;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.*;

public class WsFieldUtils {
    public static void main(String[] args) {
        DemoObject demoObject = new DemoObject();
        BaseDemoObject baseDemoObject = (BaseDemoObject) demoObject;
        Field fields[] = getFieldAll(DemoObject.class);
        Method methods[]  = getObjectMethodByName("lx",DemoObject.class);
        System.out.println(JSON.toJSONString(methods));
    }


    public static Field getFieldForObject(String name,Object object){
        Class clazz = object.getClass();
        return getFieldForClass(name,clazz);
    }


    public static Field getFieldForClass(String name,Class clazz){
        Field field = null;
        try {
            for(;!(clazz == Object.class || clazz == null);clazz = clazz.getSuperclass()){
                field = clazz.getDeclaredField(name);
                if(field != null){
                    break;
                }
            }
        }catch (Exception e){
            //e.printStackTrace();
        }
        return field;
    }

    public static boolean setFieldValueForName(Field field,Object object,Object value){
        field.setAccessible(true);
        try {
            field.set(object,value);
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }finally {
            field.setAccessible(false);
        }
        return true;
    }

    public static Object getFieldValueForName(Field field,Object object){
        Object value = null;
        field.setAccessible(true);
        try {
            value = field.get(object);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            field.setAccessible(false);
        }
        return value;
    }

    public static Field[] getFieldAll(Class clazz){
        Set<Field> fieldSet = new HashSet<>();
        try {
            Field fields[];
            fields = clazz.getDeclaredFields();
            for(int i = 0; i < fields.length; i++){
                fieldSet.add(fields[i]);
            }
            fields = clazz.getFields();
            for(int i = 0; i < fields.length; i++){
                fieldSet.add(fields[i]);
            }
            /*for(;!(clazz==Object.class || clazz == null);clazz = clazz.getSuperclass()){
                fields = clazz.getDeclaredFields();
                if(!(fields == null || fields.length == 0)){
                    for(int i = 0; i < fields.length; i++){
                        fieldSet.add(fields[i]);
                    }
                }

            }*/
        }catch (Exception e){
            e.printStackTrace();
        }
        if(fieldSet.isEmpty()){
            return null;
        }else {
            return fieldSet.toArray(new Field[fieldSet.size()]);
        }
    }


    public static Method[] getObjectMethodByName(String methodName,Class clazz){
        Method methods[] = null;
        Set<Method> methodSet = new HashSet<>();
        methods = clazz.getDeclaredMethods();
        for(int i = 0; i < methods.length; i++){
            methodSet.add(methods[i]);
        }
        methods = clazz.getMethods();
        for(int i = 0; i < methods.length; i++){
            methodSet.add(methods[i]);
        }
        List<Method> methodList = new ArrayList<>();
        methodSet.parallelStream().forEach(method -> {
            if(method.getName().equals(methodName)){
                methodList.add(method);
            }
        });
        return methodList.toArray(new Method[methodList.size()]);

    }

}
