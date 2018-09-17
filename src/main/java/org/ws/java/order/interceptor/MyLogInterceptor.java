package org.ws.java.order.interceptor;

import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import com.netflix.zuul.exception.ZuulException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.netflix.zuul.filters.support.FilterConstants;
import org.springframework.cloud.netflix.zuul.web.ZuulController;
import org.springframework.context.annotation.FilterType;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.ws.java.order.controller.BaseController;
import org.ws.java.order.wsutils.WsUrlConnection;

import javax.servlet.http.HttpServletRequest;

@Slf4j
public class MyLogInterceptor extends ZuulFilter {

    @Override
    public String filterType() {
        return FilterConstants.PRE_TYPE;
    }

    @Override
    public int filterOrder() {
        return 0;
    }

    @Override
    public boolean shouldFilter() {
        return true;
    }

    @Override
    public Object run() throws ZuulException {

        RequestContext ctx = RequestContext.getCurrentContext();
        HttpServletRequest request = ctx.getRequest();
        log.info("当前请求的地址为"+request.getServletPath());
        log.info("请求IP地址为："+WsUrlConnection.getIp(request));
        return null;
    }
}