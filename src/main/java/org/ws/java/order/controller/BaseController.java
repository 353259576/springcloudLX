package org.ws.java.order.controller;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.ws.java.order.constants.SystemConstants;
import org.ws.java.order.model.po.UserPO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public abstract class BaseController {

    public HttpServletRequest getHttpServletRequest(){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return request;
    }

    public HttpSession getHttpSession(){
        HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
        return request.getSession();
    }

    public HttpServletResponse getHttpServletResponse(){
        HttpServletResponse response = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getResponse();
        return response;
    }

    public UserPO getUser(){
        HttpSession session = this.getHttpSession();
        UserPO userPO = (UserPO)session.getAttribute(SystemConstants.USER);
        if(userPO == null){
            throw new RuntimeException("用户未登录");
        }
        return userPO;
    }
}
