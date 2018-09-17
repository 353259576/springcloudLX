package org.ws.java.order.interceptor;

import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.apache.catalina.SessionEvent;
import org.apache.catalina.SessionListener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

//@WebListener
@Slf4j
public class MysessionListen implements HttpSessionListener {
    public final static Map<String,HttpSession> map = new ConcurrentHashMap();
    public final static ThreadLocal<String> stringThreadLocal = new ThreadLocal<>();
    @Override
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
        log.info("会话创建："+httpSessionEvent.getSession().getId());
        stringThreadLocal.set(httpSessionEvent.getSession().getId());
        map.put(httpSessionEvent.getSession().getId(),httpSessionEvent.getSession());
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
        log.info(JSON.toJSONString(map));
        map.remove(httpSessionEvent.getSession().getId());
        stringThreadLocal.remove();
    }

    public static HttpSession getSession(){
        String id = stringThreadLocal.get();
        return map.get(id);
    }

    public static void setSessionValue(String key,Object value){
        HttpSession httpSession = map.get(stringThreadLocal.get());
        httpSession.setAttribute(key,value);
    }
}
