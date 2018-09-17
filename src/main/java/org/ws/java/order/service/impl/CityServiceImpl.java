package org.ws.java.order.service.impl;

import org.apache.ibatis.scripting.xmltags.DynamicSqlSource;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.ws.java.order.annotation.DataBase;
import org.ws.java.order.config.DynamicDataSource;
import org.ws.java.order.dao.jpa.CityDAO;
import org.ws.java.order.model.po.CityPO;
import org.ws.java.order.model.po.RolePO;
import org.ws.java.order.service.CityService;

import java.math.BigInteger;
import java.util.List;

@Service
public class CityServiceImpl implements CityService {
    @Autowired
    private CityDAO cityDAO;

    @Override
    @Transactional(rollbackFor = Exception.class)
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    public Long insterCity(CityPO cityPO) throws RuntimeException {
        if(cityPO == null){
            return null;
        }
        cityDAO.save(cityPO);
        return cityPO.getId();
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<CityPO> selectCityByName(String cityName, Integer deep) throws RuntimeException {
        return cityDAO.selectCityByName(cityName,deep);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<CityPO> selectCityByDeep(Integer deep) throws RuntimeException {
        return cityDAO.selectCityByDeep(deep);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<CityPO> selectCityByPid(Long pid, Integer deep) throws RuntimeException {
        return cityDAO.selectCityByPid(pid,deep);
    }


    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public CityPO selectCityById(Long id) throws RuntimeException {
        return cityDAO.findById(id).orElse(null);
    }

    @Override
    public String getCityString(Long id,String cityName) throws RuntimeException {
        if(cityName == null){
            cityName = "";
        }
        CityPO cityPO = selectCityById(id);
        if(cityPO != null){
            if(cityPO.getParentId() == 0){
                cityName = cityPO.getName()+cityName;
                System.out.println(cityName);
            }else {
                cityName = "/" + cityPO.getName() + cityName;
                cityName = getCityString(cityPO.getParentId(),cityName);
                System.out.println(cityName);
            }
        }
        return cityName;
    }
}
