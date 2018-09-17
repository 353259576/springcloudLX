package org.ws.java.order.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.ws.java.order.annotation.Authority;
import org.ws.java.order.annotation.DataBase;
import org.ws.java.order.config.DynamicDataSource;
import org.ws.java.order.dao.jpa.MenuDAO;
import org.ws.java.order.model.po.MenuPO;
import org.ws.java.order.service.MenuService;

import javax.management.RuntimeMBeanException;
import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuDAO menuDAO;

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<MenuPO> selectMenuByIds(List<Long> ids) throws RuntimeException {
        if(ids == null || ids.isEmpty()){
            return null;
        }
        return menuDAO.selectMenuByIds(ids);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<MenuPO> selectMenuByIdsRole(List<Long> ids) throws RuntimeException {
        return menuDAO.selectMenuByIdsRole(ids);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<MenuPO> selectMenuByPath(String path) throws RuntimeException {
        return menuDAO.selectMenuByPath(path);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public MenuPO selectMenuById(Long id) throws RuntimeException {
        return menuDAO.selectMenuById(id);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<MenuPO> selectAllMenu() throws RuntimeException {
        return menuDAO.selectMenuAll();
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class)
    public Long insertMenu(MenuPO menuPO) throws RuntimeException {
        return menuDAO.save(menuPO).getId();
    }
}
