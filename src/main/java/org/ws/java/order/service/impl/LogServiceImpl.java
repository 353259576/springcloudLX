package org.ws.java.order.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.ws.java.order.annotation.DataBase;
import org.ws.java.order.config.DynamicDataSource;
import org.ws.java.order.dao.jpa.MyLogDAO;
import org.ws.java.order.model.po.MyLogPO;
import org.ws.java.order.service.LogService;

import java.util.Date;

@Service
public class LogServiceImpl implements LogService {
    @Autowired
    private MyLogDAO myLogDAO;

    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    public Long insertLog(MyLogPO myLogPO) throws RuntimeException {
        myLogPO.setCreateDate(new Date());
        myLogDAO.save(myLogPO);
        return myLogPO.getId();
    }
}
