package org.ws.java.order.controller;

import afu.org.checkerframework.checker.units.qual.A;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.ws.java.order.annotation.Authority;
import org.ws.java.order.constants.AllStatusConstants;
import org.ws.java.order.constants.SystemConstants;
import org.ws.java.order.controller.search.userconroller.InsertUserSearch;
import org.ws.java.order.controller.search.userconroller.SelectUserByIdSearch;
import org.ws.java.order.controller.search.userconroller.UpdateUserSearch;
import org.ws.java.order.model.dto.UserRoleDTO;
import org.ws.java.order.model.po.UserPO;
import org.ws.java.order.model.vo.*;
import org.ws.java.order.service.UserRoleService;
import org.ws.java.order.service.UserService;
import org.ws.java.order.utils.PageConvertUtil;
import org.ws.java.order.wsutils.DataBaseHandle.JpaDataHandle;
import org.ws.java.order.wsutils.DataBaseHandle.MySearchList;
import org.ws.java.order.wsutils.Encryption;
import org.ws.java.order.wsutils.WsStringUtils;

import javax.persistence.Column;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("order/user")
@Api(value = "用户操作")
public class UserController extends BaseController {
    @Autowired
    private UserService userService;

    @Autowired
    private RoleHendleController roleHendleController;


    @RequestMapping("selectUserMenu")
    @ApiOperation(value = "获取用户菜单",httpMethod = "POST")
    @Authority(onlyLogin = true)
    public AjaxVO selectUserMenu(){
        HttpSession session = getHttpSession();
        UserPO userPO = (UserPO) session.getAttribute(SystemConstants.USER);
        UserRoleDTO userRoleDTO = UserRoleService.getUserRole(userPO.getId());
        if(userRoleDTO == null){
            return AjaxVO.returnFailMsg("未获得任何权限");
        }
        List<MenuVO> menuPOS = roleHendleController.createMenuVOList(userPO);
        AjaxVO ajaxVO = AjaxVO.newAjax();
        ajaxVO.putDataList(menuPOS);
        return ajaxVO;
    }


    @RequestMapping("updateUser")
    @ApiOperation(value = "修改用户信息",httpMethod = "POST")
    @Authority(onlyAllowAdmin = true)
    public AjaxVO updateUser(@RequestBody UpdateUserSearch updateUserSearch){
        if(updateUserSearch.getId() == null){
            return AjaxVO.returnFailMsg("用户ID为空");
        }
        if(StringUtils.isEmpty(updateUserSearch.getUserName())){
            return AjaxVO.returnFailMsg("用户名称为空");
        }
        if(StringUtils.isEmpty(updateUserSearch.getUserPhone())){
            return AjaxVO.returnFailMsg("用户联系方式为空");
        }
        if(StringUtils.isEmpty(updateUserSearch.getUserBankCard())){
            return AjaxVO.returnFailMsg("用户银行卡号码为空");
        }
        if(updateUserSearch.getUserSex() == null){
            return AjaxVO.returnFailMsg("用户性别为空");
        }
        UserPO userPO = userService.selectUserById(updateUserSearch.getId());
        if(userPO == null){
            return AjaxVO.returnFailMsg("用户不存在");
        }
        BeanUtils.copyProperties(updateUserSearch,userPO);
        if(StringUtils.isNotEmpty(updateUserSearch.getUserPassword())){
            userPO.setUserPassword(Encryption.md5Encoder(userPO.getUserPassword()));
        }
        userService.updateUser(userPO);
        return AjaxVO.returnSuccMsg("修改成功");

    }

    @RequestMapping(value = "insertuser")
    @ApiOperation(value = "用户注册" ,httpMethod = "POST")
    @Authority(onlyAllowAdmin = true)
    public AjaxVO insertUser(@RequestBody InsertUserSearch insertUserSearch){
        UserPO userPO = new UserPO();
        BeanUtils.copyProperties(insertUserSearch,userPO);
        if(userPO == null){
            return AjaxVO.returnFailMsg("传入信息为空");
        }
        if(org.apache.commons.lang.StringUtils.isEmpty(userPO.getUserName())){
            return AjaxVO.returnFailMsg("用户昵称为空");
        }
        if(org.apache.commons.lang.StringUtils.isEmpty(userPO.getUserPhone())){
            return AjaxVO.returnFailMsg("用户电话号码为空");
        }
        if(userPO.getUserSex() == null) {
            return AjaxVO.returnFailMsg("用户性别为空");
        }
        if(org.apache.commons.lang.StringUtils.isEmpty(userPO.getUserPassword())){
            return AjaxVO.returnFailMsg("用户密码为空");
        }
        userPO.setUserPassword(Encryption.md5Encoder(userPO.getUserPassword()));
        userPO.setCreateDate(new Date());
        userService.insertUser(userPO);
        return AjaxVO.returnSuccMsg("用户注册成功");
    }


    @RequestMapping(value = "selectUserById")
    @ApiOperation(value = "通过ID查询用户信息",httpMethod = "POST")
    @Authority(onlyAllowAdmin = true)
    public AjaxVO selectUserById(@RequestBody SelectUserByIdSearch selectUserByIdSearch){
        if(selectUserByIdSearch.userId == null){
            return AjaxVO.returnFailMsg("用户ID为空");
        }
        UserPO userPO = userService.selectUserById(selectUserByIdSearch.userId);
        UserVO userVO = new UserVO();
        BeanUtils.copyProperties(userPO,userVO);
        AjaxVO ajaxVO = AjaxVO.newAjax();
        ajaxVO.putData("user",userVO);
        return ajaxVO;
    }



    @RequestMapping(value = "selectuser")
    @ApiOperation(value = "用户信息查询",httpMethod = "POST")
    @Authority(onlyAllowAdmin = true)
    public AjaxVO selectUser(MySearchList mySearchList , PageVO pageVO){
        mySearchList.add("id", JpaDataHandle.Operator.SORT,"desc");
        PageInfo<UserPO> userPOPageInfo = userService.selectUser(mySearchList,pageVO);
        AjaxVO ajaxVO = new AjaxVO();
        if(userPOPageInfo.getDataList() != null){
            List<UserVO> userVOList = new ArrayList<>(userPOPageInfo.getDataList().size());
            UserVO userVO = null;
            for (UserPO u:userPOPageInfo.getDataList()) {
                userVO = new UserVO();
                BeanUtils.copyProperties(u,userVO);
                if(userVO.getCreateDate() != null){
                    userVO.setCreateDateLabel(WsStringUtils.dateToString(userVO.getCreateDate(),WsStringUtils.LONGTIMESTRING));
                }
                userVO.setKey(userVO.getId().toString());
                userVO.setTitle(userVO.getUserName());
                userVOList.add(userVO);
            }
            PageInfo<UserVO> userVOPageInfo = PageConvertUtil.convertEmptyDataPage(userPOPageInfo,UserVO.class);
            userVOPageInfo.setDataList(userVOList);
            ajaxVO.putDataList(userVOPageInfo);
        }
        return ajaxVO;
    }
}

