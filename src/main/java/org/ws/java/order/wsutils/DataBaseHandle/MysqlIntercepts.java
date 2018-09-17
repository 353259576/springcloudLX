package org.ws.java.order.wsutils.DataBaseHandle;


import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.*;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.ws.java.order.model.vo.PageVO;

import java.sql.Connection;
import java.util.Map;
import java.util.Properties;

@Intercepts(
        {
                @Signature(method = "query",type = Executor.class,args = {MappedStatement.class,Object.class, RowBounds.class, ResultHandler.class}),
                @Signature(method = "prepare",type = StatementHandler.class,args = {Connection.class,Integer.class})
        }
        )
public class MysqlIntercepts implements Interceptor {
    String dataBaseType;
    public BaseHandle baseHandle;

    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        Object parameter = invocation.getArgs()[1];
        PageVO pageVO = null;
        pageVO = this.selectPage(parameter);
        return pageVO ==null?invocation.proceed():this.baseHandle.handlePaging(invocation,parameter,pageVO);
    }

    @Override
    public Object plugin(Object o) {
        return Plugin.wrap(o,this);
    }

    @Override
    public void setProperties(Properties properties) {
        baseHandle = new MySqlHandle();
    }


    private PageVO selectPage(Object object){
        try {
            if(object instanceof Map){
                Map map = (Map)object;
                Object pageVO = (PageVO)map.get("page");
                if(pageVO != null&&pageVO instanceof PageVO){
                    return (PageVO) pageVO;
                }else {
                    return null;
                }

            }else {
                return null;
            }
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }

    }
}
