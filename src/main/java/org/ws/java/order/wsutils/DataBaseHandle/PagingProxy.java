package org.ws.java.order.wsutils.DataBaseHandle;

import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.scripting.xmltags.SqlNode;
import org.ws.java.order.model.vo.PageVO;

import java.util.List;

public interface PagingProxy {
    List handlePaging(Invocation var1, Object var2, PageVO var3) throws Exception;

    String getPagingSql(String var1, PageVO var2);

    String getCountingSql(String var1);

    public List<SqlNode> getPagingSql(List<SqlNode> sqlNodes, PageVO pageVO);
}
