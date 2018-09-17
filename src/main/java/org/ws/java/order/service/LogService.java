package org.ws.java.order.service;

import org.ws.java.order.model.po.MyLogPO;

public interface LogService {

    public Long insertLog(MyLogPO myLogPO) throws RuntimeException;
}
