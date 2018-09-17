package org.ws.java.order.dao.mapper;

import org.ws.java.order.model.po.UserPO;

import java.util.List;
import java.util.Map;

public interface UserMapper {

    public List<UserPO> selectUser(Map map);
}
