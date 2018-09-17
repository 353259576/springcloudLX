package org.ws.java.order.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateSettings;
import org.springframework.boot.autoconfigure.orm.jpa.JpaProperties;
import org.springframework.boot.orm.jpa.EntityManagerFactoryBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.persistence.EntityManager;
import javax.sql.DataSource;
import java.util.Map;

//import org.springframework.boot.autoconfigure.orm.jpa.HibernateSettings;

@Configuration
//@AutoConfigureBefore(DataSourceConfig.class)
@EnableTransactionManagement
@EnableJpaRepositories
        (
        entityManagerFactoryRef = "entityManagerFactory",
        transactionManagerRef = "transactionManager",
        basePackages = {"org.ws.java.order.dao.jpa"}
        )
@EntityScan(basePackages = {"org.ws.java.order.model.po"})
public class JpaConfig {
    private static final Logger log = LoggerFactory.getLogger(JpaConfig.class);

    @Autowired
    @Qualifier("proxyPrimaryDataSource")
    private DataSource dataSource = DataSourceConfig.dataSource;

    @Autowired
    private JpaProperties jpaProperties;

    public JpaConfig(){

    }



    /*@Primary
    @Bean(
            name = {"entityManager"}
    )
    public EntityManager entityManager(EntityManagerFactoryBuilder builder) {
        return this.entityManagerFactory(builder).getObject().createEntityManager();
    }

    @Bean(
            name = {"transactionManager"}
    )
    PlatformTransactionManager transactionManager(EntityManagerFactoryBuilder builder) {
        return new JpaTransactionManager(this.entityManagerFactory(builder).getObject());
    }

    @Primary
    @Bean(
            name = {"entityManagerFactory"}
    )
    public LocalContainerEntityManagerFactoryBean entityManagerFactory(EntityManagerFactoryBuilder builder) {
        return builder.dataSource(this.dataSource).properties(this.getVendorProperties(this.dataSource)).packages(new String[]{"org.ws.java.lx.dao.jpa"}).persistenceUnit("primaryPersistenceUnit").build();
    }

    private Map<String, String> getVendorProperties(DataSource dataSource) {
        return this.jpaProperties.getHibernateProperties(dataSource);
    }*/



    @Primary
    @Bean(name = "entityManager")
    public EntityManager entityManager(EntityManagerFactoryBuilder entityManagerFactoryBuilder){
        return entityManagerFactoryBean(entityManagerFactoryBuilder).getObject().createEntityManager();
    }


    /**
     * 设置实体类的位置
     * @param entityManagerFactoryBuilder
     * @return
     */
    @Primary
    @Bean(name = "entityManagerFactory")
    public LocalContainerEntityManagerFactoryBean entityManagerFactoryBean(EntityManagerFactoryBuilder entityManagerFactoryBuilder){
        return entityManagerFactoryBuilder.dataSource(dataSource).packages("org.ws.java.order.model.po").persistenceUnit("primaryPersistenceUnit").properties(getVendorProperties()).build();
    }

    public Map<String,Object> getVendorProperties(){
        //return this.jpaProperties.getHibernateProperties(dataSource);
        return this.jpaProperties.getHibernateProperties(new HibernateSettings());
    }


    @Bean(name = "transactionManager")
    public PlatformTransactionManager transactionManager(EntityManagerFactoryBuilder entityManagerFactoryBuilder){
        return new JpaTransactionManager(entityManagerFactoryBean(entityManagerFactoryBuilder).getObject());
    }

}
