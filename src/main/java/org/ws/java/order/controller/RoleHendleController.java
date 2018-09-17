package org.ws.java.order.controller;


import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.ws.java.order.constants.AllStatusConstants;
import org.ws.java.order.constants.RoleEnum;
import org.ws.java.order.model.dto.UserRoleDTO;
import org.ws.java.order.model.po.*;
import org.ws.java.order.model.vo.MenuVO;
import org.ws.java.order.service.MenuService;
import org.ws.java.order.service.RoleService;
import org.ws.java.order.service.UserRoleService;

import java.util.*;

@Controller
public class RoleHendleController {
    @Autowired
    private RoleService roleService;

    @Autowired
    private MenuService menuService;

    public UserRoleDTO createUserRoleDTO(UserPO userPO){
        UserRoleDTO userRoleDTO = UserRoleDTO.createUserRoleDTO();
        List<Long> longs = roleService.selectRoleIdByUserId(userPO.getId());
        if(longs != null && longs.size() != 0) {
            List<RolePO> rolePOList = roleService.selectRoleByRoleByRoleIds(longs);
            if (rolePOList != null && rolePOList.size() != 0) {
                rolePOList = userRoleDTO.addRoles(rolePOList);
                List<Long> adminRoleIds = new ArrayList<>();
                List<Long> generalRoleIds = new ArrayList<>();
                HashSet<MenuPO> userMenus = new HashSet<>();
                HashSet<MenuPO> adminMenus = new HashSet<>();
                HashSet<MenuPO> generalMenus = new HashSet<>();
                HashMap<Long,HashSet<Long>> generalCompanyPOMap = new HashMap<>();
                for (int i = 0; i < rolePOList.size(); i++) {
                    if (rolePOList.get(i).getType().toString().equals(RoleEnum.ROLETYPEADMIN.getCode())) {
                        adminRoleIds.add(rolePOList.get(i).getId());
                    } else {
                        generalRoleIds.add(rolePOList.get(i).getId());
                    }
                }
                if (adminRoleIds.size() != 0 || generalRoleIds.size() != 0) {
                    if (adminRoleIds.size() != 0) {
                        List<RoleMenuBindPO> menuBindPOS = roleService.selectRoleMenuBindByRoleIds(adminRoleIds);
                        List<Long> longs1 = new ArrayList<>();
                        for (RoleMenuBindPO rm:menuBindPOS) {
                            longs1.add(rm.getMenuId());
                        }
                        if(!(longs1 == null || longs1.isEmpty())){
                            List<MenuPO> menuPOS = menuService.selectMenuByIds(longs1);
                            userMenus.addAll(menuPOS);
                            adminMenus.addAll(menuPOS);
                        }

                    }
                    if (generalRoleIds.size() != 0) {
                        List<RoleMenuBindPO> menuBindPOS = roleService.selectRoleMenuBindByRoleIds(generalRoleIds);
                        List<Long> longs1 = new ArrayList<>();

                        for (RoleMenuBindPO rm:menuBindPOS) {
                            List<RoleCompanyBindPO> roleCompanyBindPOS = roleService.selectRoleCompanyByRoleId(rm.getRoleId());
                            if(roleCompanyBindPOS != null){
                                for (RoleCompanyBindPO rc:roleCompanyBindPOS) {
                                    if(generalCompanyPOMap.get(rc.getCompanyId()) == null){
                                        HashSet<Long> longs2 = new HashSet<>();
                                        List<RoleMenuBindPO> menuBindPOS1 = roleService.selectRoleMenuBindByRoleId(rc.getRoleId());
                                        if(menuBindPOS1 != null && menuBindPOS1.size() != 0){
                                            for (RoleMenuBindPO rm1:menuBindPOS1) {
                                                longs2.add(rm1.getMenuId());
                                            }
                                        }
                                        generalCompanyPOMap.put(rc.getCompanyId(),longs2);
                                    }else {
                                        HashSet<Long> longs2 = generalCompanyPOMap.get(rc.getCompanyId());
                                        List<RoleMenuBindPO> menuBindPOS1 = roleService.selectRoleMenuBindByRoleId(rc.getRoleId());
                                        if(menuBindPOS1 != null && menuBindPOS1.size() != 0){
                                            for (RoleMenuBindPO rm1:menuBindPOS1) {
                                                longs2.add(rm1.getMenuId());
                                            }
                                        }
                                        generalCompanyPOMap.put(rc.getCompanyId(),longs2);

                                    }
                                }
                            }
                            longs1.add(rm.getMenuId());
                        }
                        List<MenuPO> menuPOS = menuService.selectMenuByIds(longs1);
                        userMenus.addAll(menuPOS);
                        generalMenus.addAll(menuPOS);
                    }
                }
                userRoleDTO.setUserMenuPOS(userMenus);
                userRoleDTO.setAdminMenuPOS(adminMenus);
                userRoleDTO.setGeneralMenuPOS(generalMenus);
                HashMap<String,MenuPO> userMenuPOMap = new HashMap<>();
                HashMap<String,MenuPO> adminMenuPOMap = new HashMap<>();;
                HashMap<String,MenuPO> generalMenuPOMap = new HashMap<>();

                for (MenuPO m:userMenus) {
                    if(StringUtils.isNotEmpty(m.getPath()))
                    userMenuPOMap.put(m.getPath(),m);
                }
                for (MenuPO m:adminMenus) {
                    if(StringUtils.isNotEmpty(m.getPath()))
                    adminMenuPOMap.put(m.getPath(),m);
                }
                for (MenuPO m:generalMenus) {
                    if(StringUtils.isNotEmpty(m.getPath()))
                    generalMenuPOMap.put(m.getPath(),m);

                }
                userRoleDTO.setUserMenuPOMap(userMenuPOMap);
                userRoleDTO.setAdminMenuPOMap(adminMenuPOMap);
                userRoleDTO.setGeneralMenuPOMap(generalMenuPOMap);
                userRoleDTO.setGeneralCompanyPOMap(generalCompanyPOMap);
                userRoleDTO.setUserId(userPO.getId());
                UserRoleService.setUserRole(userPO.getId(),userRoleDTO);
            }

        }
        return userRoleDTO;
    }


    public List<MenuVO> createMenuVOList(UserPO userPO){
        UserRoleDTO userRoleDTO = UserRoleService.getUserRole(userPO.getId());
        return this.createMenuVOS(userRoleDTO.getUserMenuPOS());
        /*List<MenuVO> allMenuVOS = new ArrayList<>();
        Iterator<MenuPO> menuPOIterator = userRoleDTO.getUserMenuPOS().iterator();
        MenuPO menuPO = null;
        MenuVO menuVO = null;
        while (menuPOIterator.hasNext()){
            menuVO = new MenuVO();
            menuPO = menuPOIterator.next();
            BeanUtils.copyProperties(menuPO,menuVO);
            allMenuVOS.add(menuVO);
        }
        List<MenuVO> menuVOS = new ArrayList<>();
        List<MenuVO> childMenuVOS = null;
        List<MenuVO> childMenuVOS1 = null;
        for (MenuVO menuVO1 : allMenuVOS) {
            if(menuVO1.getParentId().equals(0l)){
                childMenuVOS = new ArrayList<>();
                for (MenuVO m2:allMenuVOS) {
                    if(m2.getParentId().equals(menuVO1.getId())){
                        childMenuVOS.add(m2);

                        childMenuVOS1 = new ArrayList<>();
                        for (MenuVO m3:allMenuVOS) {
                            if(m3.getParentId().equals(m2.getId())){
                                childMenuVOS1.add(m3);
                            }
                        }
                        childMenuVOS1.sort(MenuVO::compareTo);
                        m2.setMenuVOS(childMenuVOS1);
                    }
                }
                childMenuVOS.sort(MenuVO::compareTo);
                menuVO1.setMenuVOS(childMenuVOS);
                menuVOS.add(menuVO1);
            }

        }
        menuVOS.sort(MenuVO::compareTo);
        return menuVOS;*/
    }


    public List<MenuVO> createMenuVOS(Collection<MenuPO> menuPOS){
        List<MenuVO> allMenuVOS = new ArrayList<>();
        Iterator<MenuPO> menuPOIterator = menuPOS.iterator();
        MenuPO menuPO = null;
        MenuVO menuVO = null;
        while (menuPOIterator.hasNext()){
            menuVO = new MenuVO();
            menuPO = menuPOIterator.next();
            BeanUtils.copyProperties(menuPO,menuVO);
            menuVO.setIdString(menuPO.getId().toString());
            allMenuVOS.add(menuVO);
        }
        List<MenuVO> menuVOS = new ArrayList<>();
        List<MenuVO> childMenuVOS = null;
        List<MenuVO> childMenuVOS1 = null;
        for (MenuVO menuVO1 : allMenuVOS) {
            if(menuVO1.getParentId().equals(0l)){
                childMenuVOS = new ArrayList<>();
                for (MenuVO m2:allMenuVOS) {
                    if(m2.getParentId().equals(menuVO1.getId())){
                        childMenuVOS.add(m2);

                        childMenuVOS1 = new ArrayList<>();
                        for (MenuVO m3:allMenuVOS) {
                            if(m3.getParentId().equals(m2.getId())){
                                childMenuVOS1.add(m3);
                            }
                        }
                        childMenuVOS1.sort(MenuVO::compareTo);
                        m2.setMenuVOS(childMenuVOS1);
                    }
                }
                childMenuVOS.sort(MenuVO::compareTo);
                menuVO1.setMenuVOS(childMenuVOS);
                menuVOS.add(menuVO1);
            }

        }
        menuVOS.sort(MenuVO::compareTo);
        return menuVOS;
    }


}
