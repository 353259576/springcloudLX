package org.ws.java.order.aop;


import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.ws.java.order.annotation.DataBase;
import org.ws.java.order.config.DynamicDataSource;
import org.ws.java.order.config.DynamicDataSourceHolder;

@Component
@Aspect
public class DataBaseChoose {
    private Logger log = LoggerFactory.getLogger(this.getClass());



    @Around("@annotation(dataBase)")
    //@Around("pointCut()")
    public Object checkAuth(ProceedingJoinPoint proceedingJoinPoint,DataBase dataBase) throws Throwable{
        //获取方法名称
       /* String methodName = proceedingJoinPoint.getSignature().getName();
        log.info("方法名称为："+methodName);
        Class<?> annotation = proceedingJoinPoint.getTarget().getClass();
        Class<?> par[] = ((MethodSignature)proceedingJoinPoint.getSignature()).getParameterTypes();
        Method thisMethod = annotation.getMethod(methodName,par);
        DataBase dataBase = thisMethod.<DataBase>getAnnotation(DataBase.class);*/
        if(dataBase==null){
            //log.info("使用默认数据库");
            DynamicDataSourceHolder.setDataSource(DynamicDataSource.MASTER);
        }else {
            if(dataBase.dataBaseName().equals(DynamicDataSource.SLAVE)){
                //log.info("使用从者数据库");
                DynamicDataSourceHolder.setDataSource(DynamicDataSource.SLAVE);
            }else {
                //log.info("使用主要数据库");
                DynamicDataSourceHolder.setDataSource(DynamicDataSource.MASTER);
            }
        }
        Object object = proceedingJoinPoint.proceed();
        DynamicDataSourceHolder.clearDataSource();
        return object;
    }
}

