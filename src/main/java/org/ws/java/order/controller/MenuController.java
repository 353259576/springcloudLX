package org.ws.java.order.controller;

import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.ws.java.order.controller.search.menucontroller.InsertMenuSearch;
import org.ws.java.order.controller.search.menucontroller.UpdateMenuSearch;
import org.ws.java.order.controller.search.rolecontroller.SelectAllMenuSearch;
import org.ws.java.order.model.po.MenuPO;
import org.ws.java.order.model.po.RoleMenuBindPO;
import org.ws.java.order.model.vo.AjaxVO;
import org.ws.java.order.model.vo.MenuVO;
import org.ws.java.order.service.MenuService;

import java.util.List;

@RestController
@RequestMapping(value = "/order/menu/")
public class MenuController {
    @Autowired
    private MenuService menuService;

    @Autowired
    private RoleHendleController roleHendleController;


    @RequestMapping(value = "insertMenu")
    @ApiOperation(value = "添加菜单",httpMethod = "POST")
    public AjaxVO insertMenu(@RequestBody InsertMenuSearch insertMenuSearch){

        if(insertMenuSearch.getName() == null){
            return AjaxVO.returnFailMsg("菜单名称为空");
        }

        if(insertMenuSearch.getPath() == null){
            return AjaxVO.returnFailMsg("菜单地址为空");
        }


        MenuPO menuPO = new MenuPO();
        BeanUtils.copyProperties(insertMenuSearch,menuPO);
        if(insertMenuSearch.getParentId() != null){
            MenuPO parentMenu = menuService.selectMenuById(menuPO.getParentId());
            if(parentMenu == null){
                return AjaxVO.returnFailMsg("父节点不存在");
            }
            menuPO.setType(parentMenu.getType()+1);
            if(menuPO.getType() > 3){
                return AjaxVO.returnFailMsg("该节点不允许创建子节点");
            }
        }else {
            menuPO.setType(1);
        }
        menuPO.setStatus(1l);
        menuService.insertMenu(menuPO);
        return AjaxVO.returnSuccMsg("添加成功");

    }



    @RequestMapping(value = "updateMenu")
    @ApiOperation(value = "修改菜单",httpMethod = "POST")
    public AjaxVO updateMenu(@RequestBody UpdateMenuSearch updateMenuSearch){
        if(StringUtils.isEmpty(updateMenuSearch.getName())){
            return AjaxVO.returnFailMsg("名称为空");
        }
        if(StringUtils.isEmpty(updateMenuSearch.getPath())){
            return AjaxVO.returnFailMsg("地址为空");
        }
        if(updateMenuSearch.getId() == null){
            return AjaxVO.returnFailMsg("菜单ID为空");
        }
        if(updateMenuSearch.getOrderNo() == null){
            return AjaxVO.returnFailMsg("排序号为空");
        }
        MenuPO menuPO = menuService.selectMenuById(updateMenuSearch.getId());
        if(menuPO == null){
            return AjaxVO.returnFailMsg("菜单不存在");
        }
        BeanUtils.copyProperties(updateMenuSearch,menuPO);
        if(menuPO.getStatus() == null){
            menuPO.setStatus(1l);
        }
        menuService.insertMenu(menuPO);
        return AjaxVO.returnSuccMsg("修改成功");
    }


    @RequestMapping(value = "selectAllMenu")
    @ApiOperation(value = "查询所有菜单",httpMethod = "POST")
    public AjaxVO selectAllMenu(){
        List<MenuPO> list = menuService.selectAllMenu();
        List<MenuVO> menuVOList = roleHendleController.createMenuVOS(list);
        AjaxVO ajaxVO = AjaxVO.newAjax();
        ajaxVO.putDataList(menuVOList);
        return ajaxVO;
    }
}
