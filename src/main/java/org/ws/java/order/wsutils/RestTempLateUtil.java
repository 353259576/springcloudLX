package org.ws.java.order.wsutils;

import com.alibaba.fastjson.JSON;
import org.apache.commons.lang.StringUtils;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.*;

@Component
public class RestTempLateUtil {

    @Resource
    private RestTemplate restTemplate;

    public <T> T postForObject(String url, Map map,Class<T> tClass){
        MultiValueMap<String,Object> multiValueMap = new LinkedMultiValueMap();
        String str = null;

        Set<Map.Entry> set = map.entrySet();
        Iterator<Map.Entry> iterator1 = set.iterator();
        multiValueMap = getStringObjectMultiValueMap(multiValueMap, iterator1);


        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        HttpEntity<MultiValueMap> httpEntity = new HttpEntity<>(multiValueMap,httpHeaders);
        return WsBeanUtis.mapToObject(restTemplate.exchange(url, HttpMethod.POST, httpEntity, new ParameterizedTypeReference<T>() {}).getBody(),tClass);
        //return (T)restTemplate.postForObject(url,httpEntity,tClass);


    }

    public <T> T postForObject(String url, Object object,Class<T> tClass){
        MultiValueMap<String,Object> multiValueMap = new LinkedMultiValueMap();
        multiValueMap = objectToMap(multiValueMap,object);
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        HttpEntity<MultiValueMap<String,Object>> httpEntity = new HttpEntity<>(multiValueMap,httpHeaders);
        return WsBeanUtis.mapToObject(restTemplate.exchange(url, HttpMethod.POST, httpEntity, new ParameterizedTypeReference<T>() {}).getBody(),tClass);
        //return (T)restTemplate.postForObject(url,httpEntity,tClass);
    }

    public <T> T postForObjectJ(String url, Object object,Class<T> tClass){
        /*MultiValueMap<String,Object> multiValueMap = new LinkedMultiValueMap();
        multiValueMap = objectToMap(multiValueMap,object);*/
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON_UTF8);
        HttpEntity<Object> httpEntity = new HttpEntity<>(object,httpHeaders);
        return WsBeanUtis.mapToObject(restTemplate.exchange(url, HttpMethod.POST, httpEntity, new ParameterizedTypeReference<T>() {}).getBody(),tClass);
        //return (T)restTemplate.postForObject(url,httpEntity,tClass);
    }

    public <T> T postForObject(String url,Class<T> tClass,Object... objects){
        MultiValueMap<String,Object> multiValueMap = new LinkedMultiValueMap();
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        HttpEntity<MultiValueMap> httpEntity = new HttpEntity<>(multiValueMap,httpHeaders);
        return WsBeanUtis.mapToObject(restTemplate.exchange(url, HttpMethod.POST, httpEntity, new ParameterizedTypeReference<T>() {},objects).getBody(),tClass);
        //return (T)restTemplate.postForObject(url,httpEntity,tClass,objects);


    }

    public <T> List<T> postForList(String url, Map map,Class<T> tClass){
        MultiValueMap<String,Object> multiValueMap = new LinkedMultiValueMap();
        String str = null;

        Set<Map.Entry> set = map.entrySet();
        Iterator<Map.Entry> iterator1 = set.iterator();
        multiValueMap = getStringObjectMultiValueMap(multiValueMap, iterator1);


        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        HttpEntity<MultiValueMap> httpEntity = new HttpEntity<>(multiValueMap,httpHeaders);
        return WsBeanUtis.mapToObjectList(restTemplate.exchange(url, HttpMethod.POST, httpEntity, new ParameterizedTypeReference<List<T>>() {}).getBody(),tClass);
        //return (T)restTemplate.postForObject(url,httpEntity,tClass);


    }

    public <T> List<T> postForList(String url, Object object,Class<T> tClass){
        MultiValueMap<String,Object> multiValueMap = new LinkedMultiValueMap();
        multiValueMap = objectToMap(multiValueMap,object);
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        HttpEntity<MultiValueMap<String,Object>> httpEntity = new HttpEntity<>(multiValueMap,httpHeaders);
        return WsBeanUtis.mapToObjectList(restTemplate.exchange(url, HttpMethod.POST, httpEntity, new ParameterizedTypeReference<List<T>>() {}).getBody(),tClass);
        //return (T)restTemplate.postForObject(url,httpEntity,tClass);


    }

    public <T> List<T> postForListJ(String url, Object object,Class<T> tClass){
        /*MultiValueMap<String,Object> multiValueMap = new LinkedMultiValueMap();
        multiValueMap = objectToMap(multiValueMap,object);*/
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON_UTF8);
        HttpEntity<String> httpEntity = new HttpEntity<>(JSON.toJSONString(object),httpHeaders);
        return WsBeanUtis.mapToObjectList(restTemplate.exchange(url, HttpMethod.POST, httpEntity, new ParameterizedTypeReference<List<T>>() {}).getBody(),tClass);
        //return (T)restTemplate.postForObject(url,httpEntity,tClass);


    }

    public <T> List<T> postForListJ(String url, Object object,Class<T> tClass,Object... objects){
        /*MultiValueMap<String,Object> multiValueMap = new LinkedMultiValueMap();
        multiValueMap = objectToMap(multiValueMap,object);*/
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON_UTF8);
        HttpEntity<String> httpEntity = new HttpEntity<>(JSON.toJSONString(object),httpHeaders);
        return WsBeanUtis.mapToObjectList(restTemplate.exchange(url, HttpMethod.POST, httpEntity, new ParameterizedTypeReference<List<T>>() {},objects).getBody(),tClass);
        //return (T)restTemplate.postForObject(url,httpEntity,tClass);


    }






    public <T> List<T> postForList(String url,Class<T> tClass,Object... objects){
        MultiValueMap<String,Object> multiValueMap = new LinkedMultiValueMap();
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        HttpEntity<MultiValueMap> httpEntity = new HttpEntity<>(multiValueMap,httpHeaders);
        return WsBeanUtis.mapToObjectList(restTemplate.exchange(url, HttpMethod.POST, httpEntity, new ParameterizedTypeReference<List<T>>() {},objects).getBody(),tClass);
        //return (T)restTemplate.postForObject(url,httpEntity,tClass);


    }

    private MultiValueMap<String, Object> getStringObjectMultiValueMap(MultiValueMap<String, Object> multiValueMap, Iterator<Map.Entry> iterator1) {
        while (iterator1.hasNext()){
            Map.Entry entry =  iterator1.next();
            Object object = entry.getValue();
            String name = (String) entry.getKey();
            if(object.getClass().isArray()){
                Object o[] = (Object[])object;
                for(int i = 0; i < o.length; i++){
                    multiValueMap.add(name,WsStringUtils.anyToString(o[i]));
                }
            } else if(object instanceof Collection){
                Collection collection = (Collection)object;
                Iterator iterator = collection.iterator();
                while (iterator.hasNext()){
                    multiValueMap.add(name,WsStringUtils.anyToString(iterator.next()));
                }
            }else {
                String value = WsStringUtils.anyToString(object);
                if(value==null){
                    multiValueMap.add(name,object);
                }else {
                    multiValueMap.add(name,value);
                }

            }
        }
        return multiValueMap;
    }


    public static MultiValueMap objectToMap(MultiValueMap multiValueMap,Object object){
        Class Clazz = object.getClass();
        Field fields[] = Clazz.getDeclaredFields();
        List<String> list = new ArrayList<>();
        for(Field field:fields){
            list.add(field.getName());
        }
        fields = Clazz.getFields();
        for(Field field:fields){
            list.add(field.getName());
        }
        for(String string:list){
            try {
                Method method = Clazz.getMethod("get"+string.substring(0,1).toUpperCase()+string.substring(1,string.length()));
                Object object1 = method.invoke(object);
                if(object1 != null){
                    if(object1.getClass().isPrimitive()){
                        multiValueMap.add(string,WsStringUtils.anyToString(object1));
                    }else if(object1 instanceof Number){
                        multiValueMap.add(string,WsStringUtils.anyToString(object1));
                    }else if(object1 instanceof Boolean){
                        multiValueMap.add(string,WsStringUtils.anyToString(object1));
                    }else if(object1 instanceof String){
                        multiValueMap.add(string,WsStringUtils.anyToString(object1));
                    }else if(object1 instanceof Date){
                        multiValueMap.add(string,WsStringUtils.anyToString(object1));
                    }else if(object1 instanceof Character) {
                        multiValueMap.add(string, WsStringUtils.anyToString(object1));
                    }

                }

            }catch (Exception e){
                //e.printStackTrace();
            }

        }
        return multiValueMap;
    }
}
