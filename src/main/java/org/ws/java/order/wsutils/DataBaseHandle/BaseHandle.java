package org.ws.java.order.wsutils.DataBaseHandle;

import org.apache.ibatis.builder.StaticSqlSource;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.executor.parameter.ParameterHandler;
import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.jdbc.ConnectionLogger;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.SqlCommandType;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.transaction.Transaction;
import org.ws.java.order.model.vo.PageVO;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public abstract class BaseHandle {
    protected HashMap<String, String> statementMap = new HashMap();

    public BaseHandle(){

    }

    protected Connection getConnection(Transaction transaction, Log log)throws SQLException{
        Connection connection = transaction.getConnection();
        return log.isDebugEnabled()? ConnectionLogger.newInstance(connection,log,0):connection;
    }

    protected Object executorSelect(Invocation invocation,MappedStatement mappedStatement) throws Exception{
        Object objects[] = invocation.getArgs();
        return invocation.getMethod().invoke(invocation.getTarget(),mappedStatement,objects[1],objects[2],objects[3]);
    }

    protected synchronized void initStatementMap(Configuration configuration){
        if(this.statementMap.isEmpty()){
            Collection collection = configuration.getMappedStatementNames();
            Iterator iterable = collection.iterator();
            String element = null;
            while (iterable.hasNext()){
                element = (String) iterable.next();
                this.statementMap.put(element,element);
            }
        }
    }




    public List handlePaging(Invocation invocation, Object parameter, PageVO pageVO) throws Exception{
        MappedStatement mappedStatement = (MappedStatement)invocation.getArgs()[0];
        Configuration configuration = mappedStatement.getConfiguration();
        if(this.statementMap.isEmpty()){
            this.initStatementMap(configuration);
        }
        BoundSql boundSql = mappedStatement.getBoundSql(parameter);
        try {
            Field field = null;
            for(Class clazz = boundSql.getClass();clazz != Object.class;clazz = clazz.getSuperclass()){
                field = clazz.getDeclaredField("metaParameters");
            }
            if(field != null){
                field.setAccessible(true);
                MetaObject metaObject = (MetaObject) field.get(boundSql);
                if(metaObject != null){
                    field.set(boundSql,metaObject);
                }
                field.setAccessible(false);

            }
        }catch (Exception e){
            e.printStackTrace();
        }


        StaticSqlSource staticSqlSource = new StaticSqlSource(configuration,this.getPagingSql(boundSql.getSql(),pageVO));
        MappedStatement.Builder builder = new MappedStatement.Builder(configuration,"id_result",staticSqlSource, SqlCommandType.SELECT);
        builder.resultMaps(mappedStatement.getResultMaps()).resultSetType(mappedStatement.getResultSetType()).statementType(mappedStatement.getStatementType());
        MappedStatement newMappedStatement = builder.build();
        List data = (List)this.executorSelect(invocation,newMappedStatement);
        String countId = mappedStatement.getId()+"_count";
        int totalSize = 0;
        if(this.statementMap.containsKey(countId)){
            List result = (List)this.executorSelect(invocation,mappedStatement.getConfiguration().getMappedStatement(countId));
            if(result != null&&result.size()>0){
                totalSize = Integer.parseInt(String.valueOf(result.get(0)));
            }
            pageVO.setTotalRows(totalSize);
        }else {
            Executor executor = (Executor)invocation.getTarget();
            Connection connection = this.getConnection(executor.getTransaction(),mappedStatement.getStatementLog());
            String countSql = this.getCountSql(boundSql.getSql());
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;
            try {
                ParameterHandler parameterHandler = configuration.newParameterHandler(mappedStatement,parameter,boundSql);
                preparedStatement = connection.prepareStatement(countSql);
                parameterHandler.setParameters(preparedStatement);
                resultSet = preparedStatement.executeQuery();
                if(resultSet.next()){
                    totalSize = resultSet.getInt(1);
                }
                pageVO.setTotalRows(totalSize);
            }catch (Exception e){
                e.printStackTrace();
            }finally {
                if(preparedStatement != null){
                    preparedStatement.close();
                    preparedStatement = null;
                }
                if(resultSet != null){
                    resultSet.close();
                    resultSet = null;
                }
            }
        }
        return data;
    }

    public abstract String getPagingSql(String sql,PageVO pageVO);

    public String getCountSql(String sql){
        StringBuffer stringBuffer = new StringBuffer("select count(1) as num  from(");
        stringBuffer.append(sql);
        stringBuffer.append(") mydata");
        return stringBuffer.toString();
    }

}
