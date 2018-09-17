package org.ws.java.order.aop;


import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.weaver.tools.PointcutParameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.ws.java.order.annotation.MyLog;
import org.ws.java.order.constants.SystemConstants;
import org.ws.java.order.model.po.MyLogPO;
import org.ws.java.order.model.po.UserPO;
import org.ws.java.order.service.LogService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Component
@Aspect
@Slf4j
public class MyLogAOP {

    @Autowired
    private LogService logService;

    @Around("@annotation(myLog)")
    public Object createLog(ProceedingJoinPoint proceedingJoinPoint, MyLog myLog) throws Throwable{
        Object object = proceedingJoinPoint.proceed();
        HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
        HttpSession session = request.getSession();
        UserPO userPO = (UserPO)session.getAttribute(SystemConstants.USER);
        MyLogPO myLogPO = new MyLogPO();
        if(userPO != null){
            myLogPO.setCreateUser(userPO.getId());
        }
        myLogPO.setName(myLog.name());
        myLogPO.setCreateDate(new Date());
        Object objects[] = proceedingJoinPoint.getArgs();
        List<Object> objectList = new ArrayList<>();
        for (Object o:objects) {
            if(o instanceof HttpServletRequest||o instanceof HttpServletResponse|| o instanceof HttpSession){
                continue;
            }
            objectList.add(o);
        }
        myLogPO.setParameter(JSON.toJSONString(objectList));
        myLogPO.setReturnMsg(JSON.toJSONString(object));
        myLogPO.setIp(getIp2(request));
        logService.insertLog(myLogPO);
        return object;

    }

    public static String getIp2(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if(StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)){
            //多次反向代理后会有多个ip值，第一个ip才是真实ip
            int index = ip.indexOf(",");
            if(index != -1){
                return ip.substring(0,index);
            }else{
                return ip;
            }
        }
        ip = request.getHeader("X-Real-IP");
        if(StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)){
            return ip;
        }
        return request.getRemoteAddr();
    }


}
