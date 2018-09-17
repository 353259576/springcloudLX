package org.ws.java.order.interceptor;

import lombok.extern.slf4j.Slf4j;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.ws.java.order.controller.RoleHendleController;
import org.ws.java.order.service.ChildOrderHandleService;
import org.ws.java.order.service.OrderService;
import org.ws.java.order.service.UserRoleService;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
@Slf4j
//@Component
public class ServerListent implements ServletContextListener{
    @Autowired
    private OrderService orderService;

    @Autowired
    private PlatformTransactionManager platformTransactionManager;

    @Autowired
    private RoleHendleController roleHendleController;


    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        ChildOrderHandleService.setOrderService(orderService);
        ChildOrderHandleService.setPlatformTransactionManager(platformTransactionManager);
        UserRoleService.roleHendleController = roleHendleController;
        log.info("服务启动");
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        log.info("服务关闭");
    }
}
