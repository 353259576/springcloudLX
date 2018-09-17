package org.ws.java.order.wsutils.DataBaseHandle;

import org.apache.ibatis.binding.BindingException;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.*;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
public class PagingIntercepter implements Interceptor {

    private String dbType;
    public PagingProxy pagingProxy;


    public PagingIntercepter() {
    }

    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        if (this.dbType == null) {
            return invocation.proceed();
        } else {
            PageVO page = null;
            Object parameter = null;
            if (invocation.getArgs().length >= 2) {
                parameter = invocation.getArgs()[1];
                page = this.seekPage(parameter);
            }

            return page == null ? invocation.proceed() : this.pagingProxy.handlePaging(invocation, parameter, page);
        }
    }

    @Override
    public Object plugin(Object target) {
        return Plugin.wrap(target, this);
    }

    @Override
    public void setProperties(Properties properties) {
        this.dbType = ((String)properties.get("dbType")).toUpperCase();
        if (this.dbType != null) {
            if (this.dbType.equals("ORACLE")) {
                this.pagingProxy = new PagingProxyForOracle();
            } else if (this.dbType.equals("MYSQL")) {
                this.pagingProxy = new PagingProxyForMySQL();
            }
        }

    }

    private PageVO seekPage(Object parameter) {
        PageVO page = null;
        if (parameter instanceof Map) {
            try {
                Object pageObj = ((Map)parameter).get("page");
                if (pageObj != null && pageObj instanceof PageVO) {
                    page = (PageVO)pageObj;
                }
            } catch (BindingException var4) {
                return null;
            }
        }

        return page;
    }
}
