package org.ws.java.order.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

public class DynamicDataSource extends AbstractRoutingDataSource {
    private static final Logger log = LoggerFactory.getLogger(DynamicDataSource.class);
    public static final String MASTER = "master";
    public static final String SLAVE = "slave";

    public DynamicDataSource(){

    }

    @Override
    protected Object determineCurrentLookupKey() {
        String dataSource = this.getDataSource();
        log.info("使用的数据库是："+dataSource);
        return dataSource;
    }

    private String getDataSource(){
        String dataSource = DynamicDataSourceHolder.getDataSource();
        if(dataSource==null){
            return MASTER;
        }
        if(dataSource.equals(MASTER)){
            return MASTER;
        }else if(dataSource.equals(SLAVE)){
            return SLAVE;
        }else {
            return MASTER;
        }
    }
}
