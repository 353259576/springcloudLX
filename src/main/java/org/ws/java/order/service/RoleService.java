package org.ws.java.order.service;

import org.springframework.data.repository.query.Param;
import org.ws.java.order.dao.jpa.RoleMenuBindDAO;
import org.ws.java.order.dao.jpa.RoleUserBindDAO;
import org.ws.java.order.model.dto.UserRoleDTO;
import org.ws.java.order.model.po.RoleCompanyBindPO;
import org.ws.java.order.model.po.RoleMenuBindPO;
import org.ws.java.order.model.po.RolePO;
import org.ws.java.order.model.po.RoleUserBindPO;
import org.ws.java.order.model.vo.PageInfo;
import org.ws.java.order.model.vo.PageVO;
import org.ws.java.order.wsutils.DataBaseHandle.MySearchList;

import java.util.List;

public interface RoleService {


    public Long insertRole(RolePO rolePO) throws RuntimeException;

    public Long insertRoleUserBind(RoleUserBindPO roleUserBindPO) throws RuntimeException;

    public Long insertRoleMenuBind(RoleMenuBindPO roleMenuBindPO) throws RuntimeException;

    public Long insertRoleCompanyBind(RoleCompanyBindPO roleCompanyBindPO) throws RuntimeException;

    public PageInfo<RolePO> selectRole(PageVO pageVO, MySearchList mySearchList) throws RuntimeException;

    public List<Long> selectRoleIdByUserId(Long userId) throws RuntimeException;

    public List<RolePO> selectRoleByRoleByRoleIds(List<Long> ids) throws RuntimeException;


    public List<RolePO> selectAdminRoleByRoleByRoleIds(List<Long> ids) throws RuntimeException;


    public List<RolePO> selectGeneralRoleByRoleByRoleIds(List<Long> ids) throws RuntimeException;



    public RolePO selectRoleByRoleId(Long roleId) throws RuntimeException;

    public void deleteRoleMenuBindPOByroleId(Long roleId) throws RuntimeException;

    public void changeRoleLocation(Long id, Long parentId, String path);

    public void changeRoleType(Long id, Integer type);

    public void changeRoleName(Long id,String name);

    public void changeRoleStatus(Long id,Integer status);


    public List<RolePO> acqurieParentRole(List<RolePO> rolePOS) throws RuntimeException;

    public List<RoleMenuBindPO> selectRoleMenuBindByRoleIds(List<Long> roleIds) throws RuntimeException;

    public List<RoleMenuBindPO> selectRoleMenuBindByRoleId(Long roleId) throws RuntimeException;

    public List<RoleCompanyBindPO> selectRoleCompanyByRoleId(Long roleId) throws RuntimeException;

    public List<RoleUserBindPO> selectRoleUserBindByRoleId(Long roleId) throws RuntimeException;

    public void deleteRoleUserBind(Long roleId,Long userId) throws RuntimeException;

    public void deleteRoleCompanyBind(Long roleId,Long companyId) throws RuntimeException;

    public void deleteRoleCompanyBindPOByRoleId(Long roleId) throws RuntimeException;


}
