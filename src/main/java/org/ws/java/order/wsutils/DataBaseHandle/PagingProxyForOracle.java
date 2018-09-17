package org.ws.java.order.wsutils.DataBaseHandle;

import org.apache.ibatis.scripting.xmltags.SqlNode;
import org.apache.ibatis.scripting.xmltags.TextSqlNode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.ws.java.order.model.vo.PageVO;

import java.util.ArrayList;
import java.util.List;

public class PagingProxyForOracle extends BasePagingProxy {

    public PagingProxyForOracle() {
    }

    public String getPagingSql(String sql, PageVO page) {
        StringBuffer sb = new StringBuffer(sql.length() + 100);
        sb.append("SELECT * FROM (SELECT t.*, rownum r FROM (");
        sb.append(sql);
        sb.append(") t WHERE rownum<").append(page.getPage() * page.getRows() + 1).append(") WHERE r>=").append((page.getPage() - 1) * page.getRows() + 1);
        return sb.toString();
    }


    public List<SqlNode> getPagingSql(List<SqlNode> sqlNodes, PageVO page) {
        List<SqlNode> sqlNodeList = new ArrayList<>();
        sqlNodeList.add(new TextSqlNode("SELECT * FROM (SELECT t.*, rownum r FROM ("));
        for(int i = 0; i < sqlNodes.size(); i++){
            sqlNodeList.add(sqlNodes.get(i));
        }
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append(") t WHERE rownum<").append(page.getPage() * page.getRows() + 1).append(") WHERE r>=").append((page.getPage() - 1) * page.getRows() + 1);
        sqlNodeList.add(new TextSqlNode(stringBuffer.toString()));
        return sqlNodeList;
    }
}
