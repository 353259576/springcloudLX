package org.ws.java.order.service;

import org.springframework.data.repository.query.Param;
import org.ws.java.order.model.po.CityPO;

import java.math.BigInteger;
import java.util.List;

public interface CityService {

    public Long insterCity(CityPO cityPO) throws RuntimeException;

    public List<CityPO> selectCityByName(String cityName,Integer deep) throws RuntimeException;

    public List<CityPO> selectCityByDeep(Integer deep) throws RuntimeException;

    public List<CityPO> selectCityByPid(Long pid,Integer deep) throws RuntimeException;

    public CityPO selectCityById(Long id) throws RuntimeException;

    public String getCityString(Long id,String cityName) throws RuntimeException;
}
