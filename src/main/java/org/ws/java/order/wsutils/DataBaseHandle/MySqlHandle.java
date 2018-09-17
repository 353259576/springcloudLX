package org.ws.java.order.wsutils.DataBaseHandle;

import org.ws.java.order.model.vo.PageVO;

public class MySqlHandle extends BaseHandle {

    @Override
    public String getPagingSql(String sql, PageVO pageVO) {
        StringBuffer stringBuffer = new StringBuffer(sql.length()+100);
        stringBuffer.append(sql);
        stringBuffer.append(" LIMIT ").append((pageVO.getPage() - 1) * pageVO.getRows()).append(", ").append(pageVO.getRows());
        return stringBuffer.toString();
    }
}
