package org.ws.java.order.interceptor;

import lombok.extern.slf4j.Slf4j;
import org.apache.catalina.Session;
import org.apache.catalina.session.StandardSession;
import org.apache.catalina.session.StandardSessionFacade;
import org.springframework.cloud.netflix.zuul.filters.pre.Servlet30WrapperFilter;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Slf4j
public class MySessionInterceptor implements HandlerInterceptor{

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        log.info("会话ID为："+session.getId());
        log.info("会话创建时间为：" + new Date(session.getCreationTime()));
        log.info("会话最后访问时间为："+new Date(session.getLastAccessedTime()));
        log.info("会话过期时间："+session.getMaxInactiveInterval());
        return true;
    }
}
