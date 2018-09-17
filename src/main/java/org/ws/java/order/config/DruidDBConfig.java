package org.ws.java.order.config;

import com.alibaba.druid.pool.DruidDataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.Configuration;
import org.ws.java.order.constants.DataBaseConstant;

import javax.sql.DataSource;
import java.sql.SQLException;

/**
 * @author wuweifeng wrote on 2017/10/23.
 * 数据库连接属性配置
 */
@ServletComponentScan
@Configuration
public class DruidDBConfig {
    private static Logger logger = LoggerFactory.getLogger(DruidDBConfig.class);



    private static String dbUrl1 = DataBaseConstant.DataBaseName1;//&rewriteBatchedStatements=true



    private static String username1 = DataBaseConstant.LOGINNAME1;

    private static String password1 = DataBaseConstant.PASSWORD1;

    private static String username2 = DataBaseConstant.LOGINNAME2;


    private static String password2 = DataBaseConstant.PASSWORD2;


    private static String dbUrl2 = DataBaseConstant.DataBaseName2;//&rewriteBatchedStatements=true

    private static String driverClassName = "com.mysql.cj.jdbc.Driver";

    //@Value("5")
    private static int initialSize = 5;

    //@Value("5")
    private static int minIdle = 5;

    //@Value("20")
    private static int maxActive = 20;

    //@Value("60000")
    private static int maxWait = 60000;

    /**
     * 配置间隔多久才进行一次检测，检测需要关闭的空闲连接，单位是毫秒
     */
    //@Value("60000")
    private static int timeBetweenEvictionRunsMillis = 60000;
    /**
     * 配置一个连接在池中最小生存的时间，单位是毫秒
     */
    //@Value("300000")
    private static int minEvictableIdleTimeMillis = 300000;

    //@Value("SELECT 1 FROM DUAL")
    private static String validationQuery = "SELECT 1 FROM DUAL";

    //@Value("true")
    private static boolean testWhileIdle = true;

    //@Value("false")
    private static boolean testOnBorrow = false;

    //@Value("false")
    private static boolean testOnReturn = false;

    /**
     * 打开PSCache，并且指定每个连接上PSCache的大小
     */
    //@Value("true")
    private static boolean poolPreparedStatements = true;

    //@Value("20")
    private static int maxPoolPreparedStatementPerConnectionSize = 20;
    /**
     * 配置监控统计拦截的filters，去掉后监控界面sql无法统计，'wall'用于防火墙
     */
    //@Value("stat,wall,log4j")
    private static String filters = "stat,log4j";//wall
    /**
     * 通过connectProperties属性来打开mergeSql功能；慢SQL记录
     */
    //@Value("druid.stat.mergeSql=true;druid.stat.slowSqlMillis=500")
    private static String connectionProperties = "druid.stat.mergeSql=true;druid.stat.slowSqlMillis=500";



    private static DataSource dataSource1 = null;
    private static DataSource dataSource2 = null;

    static {
        //DruidDBConfig druidDBConfig = new DruidDBConfig();
        dataSource1 = getDruidDataSource(username1, password1, dbUrl1);
        dataSource2 = getDruidDataSource(username2, password2, dbUrl2);
    }





   /* static {
        PropertySourcesPlaceholderConfigurer configurer = new PropertySourcesPlaceholderConfigurer();
        YamlPropertiesFactoryBean yaml = new YamlPropertiesFactoryBean();
        yaml.setResources(new FileSystemResource("application-dev.yml"));//File引入
        configurer.setProperties(yaml.getObject());
    }*/






    //@Bean(name = "primaryDataSource")
    //@Qualifier("primaryDataSource")
    public static DataSource dataSource() {
        if(dataSource1 != null){
            return dataSource1;
        }else {
            return getDruidDataSource(username1, password1, dbUrl1);
        }
    }

    //@Bean(name = "secondaryDataSource")
    //@Qualifier("secondaryDataSource")
    //@Primary
    public static DataSource secondaryDataSource() {
        if(dataSource2!=null){
            return dataSource2;
        }else {
            return getDruidDataSource(username2, password2, dbUrl2);
        }
    }

    private static DruidDataSource getDruidDataSource(String username, String password, String url) {
        DruidDataSource datasource = new DruidDataSource();

        datasource.setUrl(url);
        datasource.setUsername(username);
        datasource.setPassword(password);
        datasource.setDriverClassName(driverClassName);

        //configuration
        datasource.setInitialSize(initialSize);
        datasource.setMinIdle(minIdle);
        datasource.setMaxActive(maxActive);
        datasource.setMaxWait(maxWait);
        datasource.setTimeBetweenEvictionRunsMillis(timeBetweenEvictionRunsMillis);
        datasource.setMinEvictableIdleTimeMillis(minEvictableIdleTimeMillis);
        datasource.setValidationQuery(validationQuery);
        datasource.setTestWhileIdle(testWhileIdle);
        datasource.setTestOnBorrow(testOnBorrow);
        datasource.setTestOnReturn(testOnReturn);
        datasource.setPoolPreparedStatements(poolPreparedStatements);
        datasource.setMaxPoolPreparedStatementPerConnectionSize(maxPoolPreparedStatementPerConnectionSize);
        try {
            datasource.setFilters(filters);
        } catch (SQLException e) {
            logger.error("druid configuration initialization filter : {0}", e);
        }
        datasource.setConnectionProperties(connectionProperties);

        return datasource;
    }
}
