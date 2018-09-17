package org.ws.java.order.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.ApiSelectorBuilder;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
public class SwaggerConfig {

    @Bean
    public Docket controllerApi(){
        Docket docket = new Docket(DocumentationType.SWAGGER_2);
        ApiInfoBuilder apiInfoBuilder = new ApiInfoBuilder();
        apiInfoBuilder.title("订单系统接口");
        apiInfoBuilder.description("没什么描述");
        apiInfoBuilder.contact(new Contact("请不要联系","http://www.baidu.com",null));
        apiInfoBuilder.version("2.0");
        apiInfoBuilder.description("测试");
        apiInfoBuilder.termsOfServiceUrl("http://localhost:9040");
        docket.apiInfo(apiInfoBuilder.build());
        ApiSelectorBuilder apiSelectorBuilder = docket.select();
        apiSelectorBuilder.apis(RequestHandlerSelectors.basePackage("org.ws.java.order.controller"));
        apiSelectorBuilder.paths(PathSelectors.any());
        return apiSelectorBuilder.build();


    }




}
