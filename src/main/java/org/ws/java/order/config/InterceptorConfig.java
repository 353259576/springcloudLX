package org.ws.java.order.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.ws.java.order.interceptor.MySessionInterceptor;

import javax.annotation.Resource;

@Configuration
@Component
@Slf4j
public class InterceptorConfig implements WebMvcConfigurer {
    @Autowired
    private MySessionInterceptor mySessionInterceptor;
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        log.info("开始加载拦截器");
        registry.addInterceptor(mySessionInterceptor).addPathPatterns("/**");
    }




    @Bean
    public MySessionInterceptor mySessionInterceptor(){
        return new MySessionInterceptor();
    }
}
