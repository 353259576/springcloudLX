package org.ws.java.order.controller;

import com.alibaba.fastjson.JSON;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.ws.java.order.annotation.Authority;
import org.ws.java.order.constants.RoleEnum;
import org.ws.java.order.constants.SystemConstants;
import org.ws.java.order.controller.search.rolecontroller.*;
import org.ws.java.order.model.dto.UserRoleDTO;
import org.ws.java.order.model.po.*;
import org.ws.java.order.model.vo.*;
import org.ws.java.order.service.*;
import org.ws.java.order.utils.PageConvertUtil;
import org.ws.java.order.wsutils.DataBaseHandle.MySearchList;
import org.ws.java.order.wsutils.WsStringUtils;

import javax.servlet.http.HttpSession;
import java.util.*;

@RestController
@RequestMapping(value = "/order/role")
@Slf4j
@ApiOperation("系统权限")
public class RoleController extends BaseController {
    @Autowired
    private RoleService roleService;

    @Autowired
    private MenuService menuService;

    @Autowired
    private RoleHendleController roleHendleController;

    @Autowired
    private DictService dictService;

    @Autowired
    private UserService userService;

    @Autowired
    private CompanyService companyService;

    @Value("${mypath.imagehost}")
    private String imagepath;




    @RequestMapping(value = "selectRole")
    @ApiOperation(value = "查询权限",httpMethod = "POST")
    @Authority(onlyAllowAdmin = true)
    public AjaxVO selectRole(MySearchList mySearchList, PageVO pageVO){
        log.info(JSON.toJSONString(mySearchList));
        PageInfo<RolePO> rolePOPageInfo = roleService.selectRole(pageVO,mySearchList);
        List<RoleVO> roleVOS = new ArrayList<>();
        RoleVO roleVO = null;
        DictPO dictPO = null;
        UserPO userPO = null;
        for (RolePO r : rolePOPageInfo.getDataList()) {
            roleVO = new RoleVO();
            BeanUtils.copyProperties(r,roleVO);
            if(r.getType() != null){
                dictPO = dictService.selectDictByCodeAndType(r.getType().toString(),RoleEnum.ROLETYPE.getCode());
                if(dictPO != null){
                    roleVO.setTypeLabel(dictPO.getLabel());
                }
            }
            if(r.getStatus() != null){
                dictPO = dictService.selectDictByCodeAndType(r.getType().toString(),RoleEnum.ROLESTATUS.getCode());
                if(dictPO != null){
                    roleVO.setStatusLabel(dictPO.getLabel());
                }
            }

            if(r.getCreatedt() != null){
                roleVO.setCreatedtLabel(WsStringUtils.dateToString(r.getCreatedt(),WsStringUtils.LONGTIMESTRING));
            }

            if(r.getUpdatedt() != null){
                roleVO.setUpdateDtLabel(WsStringUtils.dateToString(r.getUpdatedt(),WsStringUtils.LONGTIMESTRING));
            }

            if(r.getCreateby() != null){
                userPO = userService.selectUserById(r.getCreateby());
                if(userPO != null){
                    roleVO.setCreatedtLabel(userPO.getUserRealName());
                }

            }

            if(r.getUpdateby() != null){
                userPO = userService.selectUserById(r.getUpdateby());
                if(userPO != null){
                    roleVO.setUpdateByLabel(userPO.getUserRealName());
                }
            }
            roleVOS.add(roleVO);

        }
        PageInfo<RoleVO> roleVOPageInfo = PageConvertUtil.convertEmptyDataPage(rolePOPageInfo,RoleVO.class);
        roleVOPageInfo.setDataList(roleVOS);
        AjaxVO ajaxVO = AjaxVO.newAjax();
        ajaxVO.putDataList(roleVOPageInfo);
        return ajaxVO;
    }






    @RequestMapping(value = "insertRole")
    @ApiOperation(value = "创建权限",httpMethod = "POST")
    @Transactional(rollbackFor = RuntimeException.class)
    @Authority(onlyAllowAdmin = true)
    public AjaxVO insertRole(@RequestBody InsertRoleSearch insertRoleSearch){
        RolePO rolePO = new RolePO();
        BeanUtils.copyProperties(insertRoleSearch,rolePO);
        if(StringUtils.isEmpty(rolePO.getName())){
            return AjaxVO.returnFailMsg("权限名称为空");
        }
        if(rolePO.getType()==null){
            return AjaxVO.returnFailMsg("权限类型为空");
        }
        rolePO.setPath(null);
        if(!rolePO.getType().toString().equals(RoleEnum.ROLETYPEADMIN.getCode())&&!rolePO.getType().toString().equals(RoleEnum.ROLETYPEGENERAL.getCode())){
            return AjaxVO.returnFailMsg("账户种类错误");
        }
        rolePO.setStatus(Integer.valueOf(RoleEnum.ROLESTATUSUNLOCK.getCode()));
        rolePO.setCreatedt(new Date());
        if(rolePO.getParentId() == null || rolePO.getParentId().equals(0l)){
            rolePO.setParentId(0l);
        }else {
            RolePO rolePO1 = roleService.selectRoleByRoleId(rolePO.getParentId());
            if (rolePO1 == null) {
                return AjaxVO.returnFailMsg("违规操作，父节点不存在");
            }
            rolePO.setStatus(rolePO1.getStatus());
            if (rolePO1.getParentId() == null||rolePO1.getParentId().equals(0l)) {
                rolePO.setPath("" + rolePO1.getId());
            } else {
                if(StringUtils.isEmpty(rolePO1.getPath())){
                    rolePO.setPath("" + rolePO1.getId());
                }else {
                    rolePO.setPath(rolePO1.getPath() + "-" + rolePO1.getId());
                }

            }
        }
        roleService.insertRole(rolePO);
        return AjaxVO.returnSuccMsg("添加成功");
    }

    @RequestMapping(value = "insertRoleMenuBind")
    @ApiOperation(value = "权限与菜单绑定",httpMethod = "POST")
    @Transactional(rollbackFor = RuntimeException.class)
    @Authority(onlyAllowAdmin = true)
    public AjaxVO insertRoleMenuBind(@RequestBody InsertRoleMenuBindSearch insertRoleMenuBindSearch){
        if(insertRoleMenuBindSearch.menuIds == null || insertRoleMenuBindSearch.menuIds.length == 0){
            return AjaxVO.returnFailMsg("菜单ID为空");
        }
        if(insertRoleMenuBindSearch.roleId == null) {
            return AjaxVO.returnFailMsg("权限ID为空");
        }
        roleService.deleteRoleMenuBindPOByroleId(insertRoleMenuBindSearch.roleId);
        RoleMenuBindPO roleMenuBindPO = null;
        HashSet<Long> hashSet = new HashSet();
        for(Long menuId:insertRoleMenuBindSearch.menuIds) {
            hashSet.add(menuId);
        }
        Iterator<Long> iterable = hashSet.iterator();
        while (iterable.hasNext()){
            roleMenuBindPO = new RoleMenuBindPO();
            roleMenuBindPO.setCreatedt(new Date());
            roleMenuBindPO.setRoleId(insertRoleMenuBindSearch.roleId);
            roleMenuBindPO.setMenuId(iterable.next());
            roleService.insertRoleMenuBind(roleMenuBindPO);
        }
        UserRoleService.startChangeRole();
        return AjaxVO.returnSuccMsg("添加成功");
    }

    @RequestMapping(value = "insertRoleUserBind")
    @ApiOperation(value = "权限与用户绑定",httpMethod = "POST")
    @Transactional(rollbackFor = RuntimeException.class)
    @Authority(onlyAllowAdmin = true)
    public synchronized AjaxVO insertRoleUserBind(@RequestBody InsertRoleUserBindSearch insertRoleUserBindSearch){
        if(insertRoleUserBindSearch.userIds == null){
            return AjaxVO.returnFailMsg("用户ID为空");
        }

        if(insertRoleUserBindSearch.getRoleId() == null){
            return AjaxVO.returnFailMsg("用户ID为空");
        }

        List<RoleUserBindPO> roleUserBindPOS = roleService.selectRoleUserBindByRoleId(insertRoleUserBindSearch.roleId);
        List<Long> userIdList = new ArrayList<>();
        boolean k = true;
        for(int i = 0; i < insertRoleUserBindSearch.userIds.length; i++){
            k = true;
            for(int j = 0; j < roleUserBindPOS.size(); j++){
                if(roleUserBindPOS.get(j).getUserId().equals(insertRoleUserBindSearch.userIds[i])){
                    k = false;
                    break;
                }
            }
            if(k)
                userIdList.add(insertRoleUserBindSearch.userIds[i]);
        }


        RoleUserBindPO roleUserBindPO = null;
        for(int i = 0; i < userIdList.size(); i++){
            roleUserBindPO = new RoleUserBindPO();
            roleUserBindPO.setRoleId(insertRoleUserBindSearch.roleId);
            roleUserBindPO.setUserId(userIdList.get(i));
            roleUserBindPO.setCreatedt(new Date());
            roleService.insertRoleUserBind(roleUserBindPO);
        }
        UserRoleService.startChangeRole();
        return AjaxVO.returnSuccMsg("添加成功");
    }


    @RequestMapping(value = "deleteRoleUserBind")
    @Transactional(rollbackFor = RuntimeException.class)
    @ApiOperation(value = "删除用户与权限绑定",httpMethod = "POST")
    @Authority(onlyAllowAdmin = true)
    public AjaxVO deleteRoleUserBind(@RequestBody DeleteRoleUserBindSearch deleteRoleUserBindSearch){
        if(deleteRoleUserBindSearch.roleId == null){
            return AjaxVO.returnFailMsg("权限ID为空");
        }
        if(deleteRoleUserBindSearch.userIds == null){
            return AjaxVO.returnFailMsg("用户ID为空");
        }



        for(int i = 0; i < deleteRoleUserBindSearch.userIds.length; i++){
            roleService.deleteRoleUserBind(deleteRoleUserBindSearch.roleId,deleteRoleUserBindSearch.userIds[i]);
        }
        UserRoleService.startChangeRole();
        return AjaxVO.returnSuccMsg("删除成功");
    }


    @RequestMapping(value = "deleteRoleCompanyBind")
    @Transactional(rollbackFor = RuntimeException.class)
    @ApiOperation(value = "删除公司与权限绑定",httpMethod = "POST")
    @Authority(onlyAllowAdmin = true)
    public AjaxVO deleteRoleCompanyBind(@RequestBody DeleteRoleCompanyBindSearch deleteRoleCompanyBindSearch){
        if(deleteRoleCompanyBindSearch.roleId == null){
            return AjaxVO.returnFailMsg("权限ID为空");
        }
        if(deleteRoleCompanyBindSearch.companyIds == null){
            return AjaxVO.returnFailMsg("商家ID为空");
        }
        for(int i = 0; i < deleteRoleCompanyBindSearch.companyIds.length; i++){
            roleService.deleteRoleCompanyBind(deleteRoleCompanyBindSearch.roleId,deleteRoleCompanyBindSearch.companyIds[i]);
        }
        UserRoleService.startChangeRole();
        return AjaxVO.returnSuccMsg("删除成功");
    }

    @RequestMapping(value = "insertRoleCompanyBind")
    @ApiOperation(value = "权限与公司绑定",httpMethod = "POST")
    @Transactional(rollbackFor = RuntimeException.class)
    @Authority(onlyAllowAdmin = true)
    public synchronized AjaxVO insertRoleCompanyBind(@RequestBody InsertRoleCompanyBindSearch insertRoleCompanyBindSearch){
        if(insertRoleCompanyBindSearch.getCompanyIds() == null){
            return AjaxVO.returnFailMsg("公司ID为空");
        }
        if(insertRoleCompanyBindSearch.getRoleId() == null){
            return AjaxVO.returnFailMsg("权限ID为空");
        }
        List<RoleCompanyBindPO> roleCompanyBindPOS = roleService.selectRoleCompanyByRoleId(insertRoleCompanyBindSearch.roleId);
        List<Long> companyIdList = new ArrayList<>();
        boolean k = true;
        for(int i = 0; i < insertRoleCompanyBindSearch.companyIds.length; i++){
            k = true;
            for(int j = 0; j < roleCompanyBindPOS.size(); j++){
                if(roleCompanyBindPOS.get(j).getCompanyId().equals(insertRoleCompanyBindSearch.companyIds[i])){
                    k = false;
                    break;
                }
            }
            if(k)
            companyIdList.add(insertRoleCompanyBindSearch.companyIds[i]);
        }

        RoleCompanyBindPO roleCompanyBindPO = null;
        for(int i = 0; i < companyIdList.size(); i++){
            roleCompanyBindPO = new RoleCompanyBindPO();
            roleCompanyBindPO.setRoleId(insertRoleCompanyBindSearch.roleId);
            roleCompanyBindPO.setCompanyId(companyIdList.get(i));
            roleCompanyBindPO.setCreatedt(new Date());
            roleService.insertRoleCompanyBind(roleCompanyBindPO);
        }
        UserRoleService.startChangeRole();
        return AjaxVO.returnSuccMsg("添加成功");
    }


    @RequestMapping(value = "changeRoleLocation")
    @ApiOperation(value = "更改权限位置",httpMethod = "POST")
    @Authority(onlyAllowAdmin = true)
    public AjaxVO changeRoleLocation(@RequestBody ChangeRoleLocationSearch changeRoleLocationSearch){
        List<RolePO> list = new ArrayList<>(2);
        if(changeRoleLocationSearch.id == null){
            return AjaxVO.returnFailMsg("权限ID为空");
        }else {
            RolePO rolePO = roleService.selectRoleByRoleId(changeRoleLocationSearch.id);
            if(rolePO == null) {
                return AjaxVO.returnFailMsg("权限不存在");
            }
            list.add(rolePO);
        }
        if(changeRoleLocationSearch.parentId == null){
            return AjaxVO.returnFailMsg("权限根为空");
        }

        String path = "";
        if(changeRoleLocationSearch.parentId != 0){
            RolePO parentRole = roleService.selectRoleByRoleId(changeRoleLocationSearch.parentId);
            if(parentRole == null){
                return AjaxVO.returnFailMsg("需要移动到的权限不存在");
            }
            if(StringUtils.isNotEmpty(parentRole.getPath())){
                path = path + parentRole.getPath()+"-";
            }
            list.add(parentRole);
        }
        list = roleService.acqurieParentRole(list);
        if(list.size() == 1&&list.get(0).getId().equals(changeRoleLocationSearch.id)){
            return AjaxVO.returnFailMsg("违规操作");
        }
        path = path + changeRoleLocationSearch.parentId;
        roleService.changeRoleLocation(changeRoleLocationSearch.id,changeRoleLocationSearch.parentId,path);
        UserRoleService.startChangeRole();
        return AjaxVO.returnSuccMsg("修改成功");
    }

    @RequestMapping(value = "changeRoleType")
    @ApiOperation(value = "改变权限类型",httpMethod = "POST")
    @Authority(onlyAllowAdmin = true)
    public AjaxVO changeRoleType(@RequestBody ChangeRoleTypeSearch changeRoleTypeSearch){
        if(changeRoleTypeSearch.id == null){
            return AjaxVO.returnFailMsg("权限传入为空");
        }
        if(changeRoleTypeSearch.type == null){
            return AjaxVO.returnFailMsg("类型传入为空");
        }
        roleService.changeRoleType(changeRoleTypeSearch.id,changeRoleTypeSearch.type);
        roleService.deleteRoleCompanyBindPOByRoleId(changeRoleTypeSearch.id);
        UserRoleService.startChangeRole();
        return AjaxVO.returnSuccMsg("修改成功");
    }

    @RequestMapping(value = "changeRoleName")
    @ApiOperation(value = "改变权限名称",httpMethod = "POST")
    @Authority(onlyAllowAdmin = true)
    public AjaxVO changeRoleName(@RequestBody ChangeRoleNameSearch changeRoleNameSearch){
        if(changeRoleNameSearch.id == null){
            return AjaxVO.returnFailMsg("权限ID为空");
        }
        if(StringUtils.isEmpty(changeRoleNameSearch.name)){
            return AjaxVO.returnFailMsg("权限名称为空");
        }
        roleService.changeRoleName(changeRoleNameSearch.id,changeRoleNameSearch.name);
        return AjaxVO.returnSuccMsg("修改成功");
    }

    @RequestMapping(value = "changeRoleStatus")
    @ApiOperation(value = "改变权限状态",httpMethod = "POST")
    @Authority(onlyAllowAdmin = true)
    public AjaxVO changeRoleStatus(@RequestBody ChangeRoleStatusSearch changeRoleStatusSearch){
        if(changeRoleStatusSearch.id == null){
            return AjaxVO.returnFailMsg("权限ID为空");
        }
        if(changeRoleStatusSearch.status == null){
            return AjaxVO.returnFailMsg("状态为空");
        }
        roleService.changeRoleStatus(changeRoleStatusSearch.id,changeRoleStatusSearch.status);
        UserRoleService.startChangeRole();
        return AjaxVO.returnSuccMsg("修改成功");
    }


    @RequestMapping(value = "selectAllMenu")
    @ApiOperation(value = "查询所有菜单",httpMethod = "POST")
    @Authority(onlyLogin = true)
    public AjaxVO selectAllMenu(@RequestBody SelectAllMenuSearch selectAllMenuSearch){

        List<MenuPO> list = menuService.selectAllMenu();
        List<MenuVO> menuVOList = roleHendleController.createMenuVOS(list);
        if(selectAllMenuSearch.roleId != null){
            List<RoleMenuBindPO> roleMenuBindPOS = roleService.selectRoleMenuBindByRoleId(selectAllMenuSearch.roleId);
            for (MenuVO m:menuVOList) {
                k:for(RoleMenuBindPO r : roleMenuBindPOS){
                if(r.getMenuId().equals(m.getId())){
                    m.setHave(true);
                    break k;
                }
                }
            }
        }
        AjaxVO ajaxVO = AjaxVO.newAjax();
        ajaxVO.putDataList(menuVOList);
        return ajaxVO;
    }

    @RequestMapping(value = "selectRoleMenuIds")
    @ApiOperation(value = "查询当前权限组拥有的权限ID",httpMethod = "POST")
    @Authority(onlyAllowAdmin = true)
    public AjaxVO selectRoleMenuIds(@RequestBody SelectRoleMenuIdsSearch selectRoleMenuIdsSearch){
        if(selectRoleMenuIdsSearch.roleId == null){
            return AjaxVO.returnFailMsg("权限ID为空");
        }
        List<RoleMenuBindPO> roleMenuBindPOS = roleService.selectRoleMenuBindByRoleId(selectRoleMenuIdsSearch.roleId);
        List<String> list = new ArrayList<>();
        for (RoleMenuBindPO rm:roleMenuBindPOS) {
            list.add(rm.getMenuId().toString());
        }
        AjaxVO ajaxVO = AjaxVO.newAjax();
        ajaxVO.putDataList(list);
        return ajaxVO;
    }

    @RequestMapping(value = "selectRoleBindCompany")
    @ApiOperation(value = "查询权限绑定的商家",httpMethod = "POST")
    @Authority(onlyAllowAdmin = true)
    public AjaxVO selectRoleBindCompany(@RequestBody SelectRoleBindCompanySearch selectRoleBindCompanySearch){
        if(selectRoleBindCompanySearch.roleId == null){
            return AjaxVO.returnFailMsg("权限ID为空");
        }
        RolePO rolePO = roleService.selectRoleByRoleId(selectRoleBindCompanySearch.roleId);
        if(rolePO==null || rolePO.getType().toString().equals(RoleEnum.ROLETYPEADMIN.getCode())){
            return AjaxVO.returnFailMsg("该条权限不能绑定商家");
        }
        List<RoleCompanyBindPO> roleCompanyBindPOS = roleService.selectRoleCompanyByRoleId(rolePO.getId());
        if(roleCompanyBindPOS == null || roleCompanyBindPOS.size() == 0){
            return AjaxVO.returnSuccMsg(null);
        }
        List<Long> companyIds = new ArrayList<>();
        for (RoleCompanyBindPO rcb:roleCompanyBindPOS) {
            companyIds.add(rcb.getCompanyId());
        }
        List<CompanyPO> companyPOS = companyService.selectCompanyByIds(companyIds);
        List<CompanyVO> companyVOS = new ArrayList<>();
        CompanyVO companyVO = null;
        for(int i = 0; i < companyPOS.size(); i++){
            companyVO = new CompanyVO();
            BeanUtils.copyProperties(companyPOS.get(i),companyVO);
            companyVO.setKey(companyVO.getId().toString());
            companyVO.setTitle(companyVO.getName());
            companyVOS.add(companyVO);
        }
        AjaxVO ajaxVO = AjaxVO.newAjax();
        ajaxVO.putDataList(companyVOS);
        return ajaxVO;
    }

    @RequestMapping("selectAllRoleUserBind")
    @ApiOperation(value = "查询权限绑定的用户",httpMethod = "POST")
    @Authority(onlyAllowAdmin = true)
    public AjaxVO selectAllRoleUserBind(@RequestBody SelectAllRoleUserBindSearch selectAllRoleUserBindSearch){
        if(selectAllRoleUserBindSearch.roleId == null){
            return AjaxVO.returnFailMsg("权限ID为空");
        }
        List<RoleUserBindPO> roleUserBindPOS = roleService.selectRoleUserBindByRoleId(selectAllRoleUserBindSearch.roleId);
        if(roleUserBindPOS == null || roleUserBindPOS.isEmpty()){
            return AjaxVO.newAjax();
        }
        List<Long> longList = new ArrayList<>();
        for (RoleUserBindPO r:roleUserBindPOS) {
            longList.add(r.getUserId());
        }
        List<UserPO> userPOS = userService.selectUserByIds(longList.toArray(new Long[longList.size()]));
        List<UserVO> userVOList = new ArrayList<>(userPOS.size());
        UserVO userVO = null;
        for(int i = 0; i < userPOS.size(); i++){
            userVO = new UserVO();
            BeanUtils.copyProperties(userPOS.get(i),userVO);
            userVO.setKey(userVO.getId().toString());
            userVO.setTitle(userVO.getUserName());
            userVOList.add(userVO);
        }
        AjaxVO ajaxVO = new AjaxVO();
        ajaxVO.putDataList(userVOList);
        return ajaxVO;
    }


    @RequestMapping(value = "getUserMenu")
    @ApiOperation(value = "获取用户权限",httpMethod = "POST")
    @Authority(onlyLogin = true)
    public AjaxVO getUserMenu(){
        HttpSession session = this.getHttpSession();
        UserPO userPO = (UserPO)session.getAttribute(SystemConstants.USER);
        UserRoleDTO userRoleDTO = UserRoleService.getUserRole(userPO.getId());
        Set<MenuPO> menuPOSet = userRoleDTO.getUserMenuPOS();
        Iterator<MenuPO> iterator = menuPOSet.iterator();
        MenuPO menuPO = null;
        List<MenuPO> menuPOS = new ArrayList<>();
        while (iterator.hasNext()){
            menuPO = iterator.next();
            if(menuPO.getType().equals(3)){
                menuPOS.add(menuPO);
            }
        }
        AjaxVO ajaxVO = AjaxVO.newAjax();
        ajaxVO.putDataList(menuPOS);
        return ajaxVO;
    }



    @RequestMapping(value = "getUserCompany")
    @ApiOperation(value = "获取能够操作的商家",httpMethod = "POST")
    @Authority(onlyLogin = true)
    public AjaxVO getUserCompany(@RequestBody GetUserCompanySearch getUserCompanySearch){
        HttpSession session = this.getHttpSession();
        UserPO userPO = (UserPO)session.getAttribute(SystemConstants.USER);
        UserRoleDTO userRoleDTO = UserRoleService.getUserRole(userPO.getId());
        MenuPO menuPO = userRoleDTO.getAdminMenu(getUserCompanySearch.path);
        if(menuPO != null){
            MySearchList mySearchList = new MySearchList();
            mySearchList.setPageVO(getUserCompanySearch.getPageVO());
            PageInfo<CompanyPO> companyPOPageInfo = companyService.selectCompany(mySearchList,mySearchList.getPageVO());
            AjaxVO ajaxVO = AjaxVO.newAjax();
            ajaxVO.setMsg("admin");
            ajaxVO.putDataList(companyPOPageInfo);
            return ajaxVO;
        }else {
            menuPO = userRoleDTO.getGeneralMenu(getUserCompanySearch.path);
            if(menuPO != null){
                List<Long> longList = userRoleDTO.getGeneralCompanyId(menuPO.getId());
                List<CompanyPO> companyPOS = companyService.selectCompanyByIds(longList);
                PageInfo<CompanyPO> companyPOPageInfo = new PageInfo<>();
                companyPOPageInfo.setDataList(companyPOS);
                AjaxVO ajaxVO = AjaxVO.newAjax();
                ajaxVO.setMsg("company");
                ajaxVO.putDataList(companyPOPageInfo);
                return ajaxVO;
            }else {
                return AjaxVO.returnFailMsg("没有商家");
            }
        }
    }

}
