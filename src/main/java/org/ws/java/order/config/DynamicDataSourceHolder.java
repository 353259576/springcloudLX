package org.ws.java.order.config;

public class DynamicDataSourceHolder {
    public static final ThreadLocal<String> THREAD_LOCAL = new ThreadLocal<String>();

    public static String getDataSource(){
        return THREAD_LOCAL.get();
    }

    public static void setDataSource(String dataSource){
        THREAD_LOCAL.set(dataSource);
    }

    public static void clearDataSource(){
        THREAD_LOCAL.remove();
    }
}
