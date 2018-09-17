package org.ws.java.order.service;

import org.ws.java.order.model.po.MsgPO;
import org.ws.java.order.model.po.RolePO;
import org.ws.java.order.model.po.UserPO;
import org.ws.java.order.model.vo.PageInfo;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

public interface MsgService {

    public void msgHandle(Long index, HttpServletResponse response) throws RuntimeException;

    public void msgSend(Long userIds[],Object msg)throws RuntimeException;

    public void msgSend(RolePO rolePO, UserPO userPO, Object msg) throws RuntimeException;

    public Long insertMsg(MsgPO msgPO) throws RuntimeException;

    public PageInfo<MsgPO> selectMsgByUser(Map map) throws RuntimeException;
}
