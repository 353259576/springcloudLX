package org.ws.java.order.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.ws.java.order.annotation.DataBase;
import org.ws.java.order.config.DynamicDataSource;
import org.ws.java.order.dao.jpa.DictDAO;
import org.ws.java.order.model.po.DictPO;
import org.ws.java.order.service.DictService;

import java.util.List;

@Service
public class DictServiceImpl implements DictService {

    @Autowired
    private DictDAO dictDAO;

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<DictPO> selectDictByType(String type) throws RuntimeException {
        if(StringUtils.isEmpty(type)){
            return null;
        }
        return dictDAO.selectDictByType(type);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public DictPO selectDictByCodeAndType(String code, String type) throws RuntimeException {
        if(StringUtils.isEmpty(code)||StringUtils.isEmpty(type)){
            return null;
        }
        List<DictPO> dictPOS = dictDAO.selectDictByCodeAndType(code,type);
        if(dictPOS == null || dictPOS.size() == 0){
            return null;
        }
        return dictPOS.get(0);
    }
}
