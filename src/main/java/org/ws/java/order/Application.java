package org.ws.java.order;

import lombok.extern.slf4j.Slf4j;
import org.apache.catalina.Context;
import org.apache.catalina.connector.Connector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.embedded.EmbeddedWebServerFactoryCustomizerAutoConfiguration;
import org.springframework.boot.web.embedded.tomcat.TomcatContextCustomizer;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cloud.client.circuitbreaker.EnableCircuitBreaker;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.cloud.netflix.hystrix.dashboard.EnableHystrixDashboard;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScans;
import org.springframework.context.annotation.FilterType;
import org.springframework.data.redis.cache.RedisCacheConfiguration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisKeyValueTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.client.RestTemplate;
import org.ws.java.order.annotation.ExcludeFromComponetScan;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.nio.charset.Charset;
import java.time.Duration;
import java.util.*;


@SpringBootApplication//spring boot启动
@EnableDiscoveryClient//向eureka注册
@EnableFeignClients//使用Feign
@EnableHystrixDashboard//使用Hystrix断路器仪表盘
@EnableCircuitBreaker//使用Hystrix断路器
@EnableCaching//使用缓存
@EnableZuulProxy//启用zuul
@EnableSwagger2
@ComponentScan(excludeFilters = {@ComponentScan.Filter(type = FilterType.ANNOTATION, value=ExcludeFromComponetScan.class)})
@ServletComponentScan
@Slf4j
@EnableScheduling
public class Application {
    /*@Autowired
    //@Qualifier("tomcatServletWebServerFactory")
    TomcatServletWebServerFactory tomcatServletWebServerFactory;*/

    public static void main(String[] args) {
        log.info("程序启动");
        long startTime = System.currentTimeMillis();
        SpringApplication.run(Application.class,args);
        long endTime = System.currentTimeMillis();
        log.info("启动时间为"+((endTime-startTime)/1000)+"秒");
    }

    @Bean
    @LoadBalanced
    public RestTemplate restTemplate(){
        return new RestTemplate();
    }

    @Bean
    public CacheManager cacheManager(RedisConnectionFactory redisConnectionFactory){
        RedisCacheConfiguration redisCacheConfiguration = RedisCacheConfiguration.defaultCacheConfig();
        redisCacheConfiguration = redisCacheConfiguration.entryTtl(Duration.ofSeconds(10));
        redisCacheConfiguration = redisCacheConfiguration.disableCachingNullValues();
        Set<String> cacheNames = new HashSet<>();
        cacheNames.add("ws-redis-cache1");
        cacheNames.add("ws-redis-cache2");
        Map<String,RedisCacheConfiguration> configMap = new HashMap<>();
        configMap.put("ws-redis-cache1",redisCacheConfiguration);
        configMap.put("ws-redis-cache2",redisCacheConfiguration.entryTtl(Duration.ofSeconds(10)));
        RedisCacheManager.RedisCacheManagerBuilder redisCacheManagerBuilder = RedisCacheManager.builder(redisConnectionFactory);
        redisCacheManagerBuilder.initialCacheNames(cacheNames);
        redisCacheManagerBuilder.withInitialCacheConfigurations(configMap);
        redisCacheConfiguration = redisCacheConfiguration.entryTtl(Duration.ofSeconds(600));
        redisCacheManagerBuilder.cacheDefaults(redisCacheConfiguration);
        RedisCacheManager redisCacheManager = redisCacheManagerBuilder.build();
        return redisCacheManager;
    }

    /*@Bean
    public TomcatServletWebServerFactory tomcatServletWebServerFactory(){
        TomcatServletWebServerFactory tomcatServletWebServerFactory = new TomcatServletWebServerFactory();
        Connector connector = new Connector();
        connector.setPort(9033);
        connector.setUseBodyEncodingForURI(true);
        connector.setURIEncoding("UTF-8");
        connector.setAsyncTimeout(10l);
        tomcatServletWebServerFactory.addAdditionalTomcatConnectors(connector);
        tomcatServletWebServerFactory.addContextCustomizers(new TomcatContextCustomizer() {
            @Override
            public void customize(Context context) {
                context.setSessionTimeout(10);
            }
        });
        Session session = new Session();
        session.setTimeout(Duration.ofSeconds(1l));
        tomcatServletWebServerFactory.setSession(session);
        tomcatServletWebServerFactory.setUriEncoding(Charset.forName("UTF-8"));
        tomcatServletWebServerFactory.setPort(9033);
        return tomcatServletWebServerFactory;
    }*/

}
