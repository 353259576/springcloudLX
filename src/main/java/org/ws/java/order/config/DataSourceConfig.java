package org.ws.java.order.config;

import com.alibaba.druid.pool.DruidDataSource;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.TransactionAwareDataSourceProxy;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.util.HashMap;
import java.util.Map;


@Configuration
//@AutoConfigureAfter(DruidDBConfig.class)
public class DataSourceConfig {

   @Resource
   DruidDBConfig druidDBConfig;


   private static DataSource dynamicDataSource = null;

   public static DataSource dataSource = null;


   static {
       dynamicDataSource = defultDataSource(masterDataSource(),slaveDataSource());
       dataSource = proxyPrimaryDataSource(dynamicDataSource);
   }

    public DataSourceConfig(){

    }

    @Primary
    @Bean(name = {"masterDS"})
    //@ConfigurationProperties(prefix = "lxdbmaster.datasource")
    public static DruidDataSource masterDataSource(){
        return (DruidDataSource) DruidDBConfig.dataSource();
    }

    @Bean(name = {"slaveDS"})
    //@ConfigurationProperties(prefix = "lxdbslave.datasource")
    public static DruidDataSource slaveDataSource(){
        return (DruidDataSource) DruidDBConfig.secondaryDataSource();
    }

    @Bean(name = "defultDS")
    public static DataSource defultDataSource(@Qualifier("masterDS") DataSource masterDS,@Qualifier("slaveDS")DataSource slaveDS){
       if(dynamicDataSource != null){
           return dynamicDataSource;
       }
        DynamicDataSource dynamicDataSource = new DynamicDataSource();
        Map<Object,Object> map = new HashMap<Object, Object>();
        map.put(DynamicDataSource.MASTER,masterDS);
        map.put(DynamicDataSource.SLAVE,slaveDS);
        dynamicDataSource.setTargetDataSources(map);
        dynamicDataSource.setDefaultTargetDataSource(masterDS);
        return dynamicDataSource;
    }

    @Bean(name = {"proxyPrimaryDataSource"})
    public static DataSource proxyPrimaryDataSource(@Qualifier("defultDS") DataSource routingDS) {
       if(dataSource != null){
           return dataSource;
       }
        TransactionAwareDataSourceProxy proxy = new TransactionAwareDataSourceProxy();
        proxy.setTargetDataSource(routingDS);
        return proxy;
    }


    @Bean
    public JdbcTemplate jdbcTemplate(@Qualifier("proxyPrimaryDataSource") DataSource dataSource){
        return new JdbcTemplate(dataSource,true);
    }

}
