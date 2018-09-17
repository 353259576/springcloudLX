package org.ws.java.order.service;

import org.ws.java.order.model.po.MenuPO;
import org.ws.java.order.model.vo.MenuVO;

import java.util.List;

public interface MenuService {

    public List<MenuPO> selectMenuByIds(List<Long> ids) throws RuntimeException;

    public List<MenuPO> selectMenuByIdsRole(List<Long> ids) throws RuntimeException;

    public MenuPO selectMenuById(Long id) throws RuntimeException;

    public List<MenuPO> selectMenuByPath(String path) throws RuntimeException;

    public List<MenuPO> selectAllMenu() throws RuntimeException;

    public Long insertMenu(MenuPO menuPO) throws RuntimeException;
}
