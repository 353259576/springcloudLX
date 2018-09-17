package org.ws.java.order.config;

import com.netflix.zuul.ZuulFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.ws.java.order.interceptor.MyLogInterceptor;

@Configuration
public class ZuulConfig {

    @Bean
    public ZuulFilter MyLogInterceptor(){
        return new MyLogInterceptor();
    }
}
