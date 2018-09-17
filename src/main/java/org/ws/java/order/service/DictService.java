package org.ws.java.order.service;

import org.ws.java.order.model.po.DictPO;

import java.util.List;

public interface DictService {

    public List<DictPO> selectDictByType(String type) throws RuntimeException;

    public DictPO selectDictByCodeAndType(String code,String type) throws RuntimeException;
}
