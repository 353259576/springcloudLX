package org.ws.java.order.dao.mapper;

import org.ws.java.order.model.po.MsgPO;

import java.util.List;
import java.util.Map;

public interface MsgMapper {

    public List<MsgPO> selectUserMsgByUser(Map map);
}
