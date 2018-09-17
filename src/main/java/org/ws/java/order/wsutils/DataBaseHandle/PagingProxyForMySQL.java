package org.ws.java.order.wsutils.DataBaseHandle;

import org.apache.ibatis.scripting.xmltags.SqlNode;
import org.apache.ibatis.scripting.xmltags.TextSqlNode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.ws.java.order.model.vo.PageVO;

import java.util.ArrayList;
import java.util.List;

public class PagingProxyForMySQL extends BasePagingProxy {
    public PagingProxyForMySQL() {
    }

    public String getPagingSql(String sql, PageVO page) {
        StringBuffer sb = new StringBuffer(sql.length() + 100);
        sb.append(sql);
        sb.append(" LIMIT ").append((page.getPage() - 1) * page.getRows()).append(", ").append(page.getRows());
        return sb.toString();
    }

    public List<SqlNode> getPagingSql(List<SqlNode> sqlNodes, PageVO page) {
        List<SqlNode> sqlNodeList = new ArrayList<>();
        for(int i = 0; i < sqlNodes.size(); i++){
            sqlNodeList.add(sqlNodes.get(i));
        }
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append(" LIMIT ").append((page.getPage() - 1) * page.getRows()).append(", ").append(page.getRows());
        sqlNodeList.add(new TextSqlNode(stringBuffer.toString()));
        return sqlNodeList;
    }
}
