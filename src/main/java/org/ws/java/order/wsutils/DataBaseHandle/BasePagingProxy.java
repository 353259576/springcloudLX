package org.ws.java.order.wsutils.DataBaseHandle;

import org.apache.ibatis.builder.StaticSqlSource;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.executor.parameter.ParameterHandler;
import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.jdbc.ConnectionLogger;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.MappedStatement.Builder;
import org.apache.ibatis.mapping.SqlSource;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.scripting.xmltags.DynamicSqlSource;
import org.apache.ibatis.scripting.xmltags.MixedSqlNode;
import org.apache.ibatis.scripting.xmltags.SqlNode;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.transaction.Transaction;
import org.ws.java.order.model.vo.PageVO;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public abstract class BasePagingProxy implements PagingProxy {
    protected HashMap<String, String> statementMap = new HashMap();

    public BasePagingProxy() {
    }

    protected synchronized void initStatementMap(Configuration configuration) {
        if (this.statementMap.isEmpty()) {
            Collection<String> statements = configuration.getMappedStatementNames();
            Iterator iter = statements.iterator();

            while(iter.hasNext()) {
                String element = (String)iter.next();
                this.statementMap.put(element, element);
            }

        }
    }

    protected Object exeQuery(Invocation invocation, MappedStatement query_statement) throws Exception {
        Object[] args = invocation.getArgs();
        return invocation.getMethod().invoke(invocation.getTarget(), query_statement, args[1], args[2], args[3]);
    }

    protected Connection getConnection(Transaction transaction, Log statementLog) throws SQLException {
        Connection connection = transaction.getConnection();
        return statementLog.isDebugEnabled() ? ConnectionLogger.newInstance(connection, statementLog, 0) : connection;
    }

    public List handlePaging(Invocation invocation, Object parameter, PageVO page) throws Exception {
        MappedStatement mappedStatement = (MappedStatement)invocation.getArgs()[0];
        Configuration configuration = mappedStatement.getConfiguration();
        if (this.statementMap.isEmpty()) {
            this.initStatementMap(configuration);
        }

        BoundSql boundSql = mappedStatement.getBoundSql(parameter);
        SqlSource sqlSource = null;
        SqlSource sqlSource1 = mappedStatement.getSqlSource();

        if(sqlSource1 instanceof DynamicSqlSource){
            DynamicSqlSource dynamicSqlSource = new DynamicSqlSource(configuration,null);
            MixedSqlNode mixedSqlNode = null;
            SqlNode sqlNode = null;

            try {
                Field field = null;
                for(Class clazz = sqlSource1.getClass();clazz != Object.class;clazz = clazz.getSuperclass()){
                    field = clazz.getDeclaredField("rootSqlNode");
                }
                if(field != null){
                    field.setAccessible(true);
                    sqlNode = (SqlNode) field.get(sqlSource1);
                    if(sqlNode != null){

                        Field field1 = null;
                        for(Class clazz = sqlNode.getClass();clazz != Object.class;clazz = clazz.getSuperclass()){
                            field1 = clazz.getDeclaredField("contents");
                        }
                        if(field1 != null){
                            field1.setAccessible(true);
                            List<SqlNode> sqlNodes = (List<SqlNode>) field1.get(sqlNode);
                            if(sqlNodes != null){
                                sqlNodes = this.getPagingSql(sqlNodes,page);
                                //field1.set(sqlNode,sqlNodes);
                                mixedSqlNode = new MixedSqlNode(sqlNodes);
                            }
                        }
                        field1.setAccessible(false);
                        if(mixedSqlNode != null) {
                            field.set(dynamicSqlSource, mixedSqlNode);
                        }
                    }
                    field.setAccessible(false);

                }
            }catch (Exception e) {
                e.printStackTrace();
            }
            sqlSource = dynamicSqlSource;
        }else {
            sqlSource = new StaticSqlSource(configuration, this.getPagingSql(boundSql.getSql(), page), boundSql.getParameterMappings());
        }

        Builder builder = new Builder(configuration, mappedStatement.getId(), sqlSource, mappedStatement.getSqlCommandType());

        builder.resource(mappedStatement.getResource());
        builder.fetchSize(mappedStatement.getFetchSize());
        builder.keyGenerator(mappedStatement.getKeyGenerator());
        if(mappedStatement.getKeyProperties() != null){
            for(String keyProperty:mappedStatement.getKeyProperties()){
                builder.keyProperty(keyProperty);
            }
        }
        builder.timeout(mappedStatement.getTimeout());
        builder.parameterMap(mappedStatement.getParameterMap());
        builder.cache(mappedStatement.getCache());
        builder.resultMaps(mappedStatement.getResultMaps());

        builder.resultSetType(mappedStatement.getResultSetType());

        builder.statementType(mappedStatement.getStatementType());
        MappedStatement query_statement = builder.build();



        List data = (List)this.exeQuery(invocation, query_statement);
        int totalSize = 0;
        String count_id = mappedStatement.getId() + "_count";
        if (this.statementMap.containsKey(count_id)) {
            List result = (List)this.exeQuery(invocation, mappedStatement.getConfiguration().getMappedStatement(count_id));
            if (result.size() > 0) {
                totalSize = Integer.parseInt(result.get(0).toString());
            }
        } else {
            Executor exe = (Executor)invocation.getTarget();
            Connection connection = this.getConnection(exe.getTransaction(), mappedStatement.getStatementLog());
            String countSql = this.getCountingSql(boundSql.getSql());
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                ParameterHandler handler = configuration.newParameterHandler(mappedStatement, parameter, boundSql);
                stmt = connection.prepareStatement(countSql);
                handler.setParameters(stmt);
                rs = stmt.executeQuery();
                if (rs.next()) {
                    totalSize = rs.getInt(1);
                }

                page.setTotalRows(totalSize);
            } catch (SQLException var22) {
                throw var22;
            } finally {
                if (rs != null) {
                    rs.close();
                    rs = null;
                }

                if (stmt != null) {
                    stmt.close();
                    stmt = null;
                }

            }
        }

        return data;
    }

    public String getCountingSql(String sql) {
        StringBuilder return_sql = new StringBuilder("SELECT COUNT(1) AS cnt FROM (");
        return return_sql.append(sql).append(") mm ").toString();
    }
}
