package org.ws.java.order.service.impl;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.ws.java.order.annotation.DataBase;
import org.ws.java.order.config.DynamicDataSource;
import org.ws.java.order.config.DynamicDataSourceHolder;
import org.ws.java.order.constants.RoleEnum;
import org.ws.java.order.dao.jpa.RoleCompanyBindDAO;
import org.ws.java.order.dao.jpa.RoleDAO;
import org.ws.java.order.dao.jpa.RoleMenuBindDAO;
import org.ws.java.order.dao.jpa.RoleUserBindDAO;
import org.ws.java.order.model.dto.UserRoleDTO;
import org.ws.java.order.model.po.RoleCompanyBindPO;
import org.ws.java.order.model.po.RoleMenuBindPO;
import org.ws.java.order.model.po.RolePO;
import org.ws.java.order.model.po.RoleUserBindPO;
import org.ws.java.order.model.vo.PageInfo;
import org.ws.java.order.model.vo.PageVO;
import org.ws.java.order.service.RoleService;
import org.ws.java.order.utils.PageConvertUtil;
import org.ws.java.order.wsutils.DataBaseHandle.MySearchList;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleDAO roleDAO;

    @Autowired
    private RoleUserBindDAO roleUserBindDAO;

    @Autowired
    private RoleMenuBindDAO roleMenuBindDAO;

    @Autowired
    private RoleCompanyBindDAO roleCompanyBindDAO;


    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    public Long insertRole(RolePO rolePO) throws RuntimeException {
        rolePO.setCreatedt(new Date());
        roleDAO.save(rolePO);
        return rolePO.getId();
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    public Long insertRoleUserBind(RoleUserBindPO roleUserBindPO) throws RuntimeException {
        roleUserBindPO.setCreatedt(new Date());
        roleUserBindDAO.save(roleUserBindPO);
        return roleUserBindPO.getId();
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    public Long insertRoleMenuBind(RoleMenuBindPO roleMenuBindPO) throws RuntimeException {
        roleMenuBindPO.setCreatedt(new Date());
        roleMenuBindDAO.save(roleMenuBindPO);
        return roleMenuBindPO.getId();
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    public Long insertRoleCompanyBind(RoleCompanyBindPO roleCompanyBindPO) throws RuntimeException {
        roleCompanyBindPO.setCreatedt(new Date());
        roleCompanyBindDAO.save(roleCompanyBindPO);
        return roleCompanyBindPO.getId();
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public PageInfo<RolePO> selectRole(PageVO pageVO, MySearchList mySearchList) throws RuntimeException {
        PageInfo<RolePO> rolePOPageInfo = PageConvertUtil.createPageInfo(roleDAO,mySearchList,RolePO.class);
        return rolePOPageInfo;
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<Long> selectRoleIdByUserId(Long userId) throws RuntimeException {
        List<RoleUserBindPO> roleUserBindPOS = roleUserBindDAO.selectRoleUserBindByUserId(userId);
        HashSet<Long> hashSet = new HashSet();
        for (RoleUserBindPO roleUserBindPO:roleUserBindPOS){
            hashSet.add(roleUserBindPO.getRoleId());
        }
        List<Long> list = new ArrayList<>(hashSet);
        list.sort(Long::compareTo);
        return list;
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<RolePO> selectRoleByRoleByRoleIds(List<Long> ids) throws RuntimeException {
        return roleDAO.selectRoleByIds(ids, Integer.valueOf(RoleEnum.ROLESTATUSUNLOCK.getCode()));
    }


    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<RolePO> selectAdminRoleByRoleByRoleIds(List<Long> ids) throws RuntimeException {
        return roleDAO.selectRoleByIdsAndType(ids,Integer.valueOf(RoleEnum.ROLETYPEADMIN.getCode()),Integer.valueOf(RoleEnum.ROLESTATUSUNLOCK.getCode()));
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<RolePO> selectGeneralRoleByRoleByRoleIds(List<Long> ids) throws RuntimeException {
        return roleDAO.selectRoleByIdsAndType(ids,Integer.valueOf(RoleEnum.ROLETYPEGENERAL.getCode()),Integer.valueOf(RoleEnum.ROLESTATUSUNLOCK.getCode()));
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public RolePO selectRoleByRoleId(Long roleId) throws RuntimeException {
        return roleDAO.selectRoleByRoleId(roleId);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class)
    public void deleteRoleMenuBindPOByroleId(Long roleId) throws RuntimeException {
        roleMenuBindDAO.deleteRoleMenuBindPOByroleId(roleId);
    }


    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class)
    public void changeRoleLocation(Long id, Long parentId, String path) {
        roleDAO.changeRoleLocation(id, parentId, path);
        List<RolePO> list = roleDAO.selectRoleByParentRoleId(id);
        if(list != null && list.size() != 0){
            //RolePO rolePO1 = roleDAO.selectRoleByRoleId(id);
            for (RolePO rolePO : list) {
                String newPath = path + "-" + id;
                changeRoleLocation(rolePO.getId(),rolePO.getParentId(),newPath);
            }
        }
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class)
    public void changeRoleType(Long id, Integer type) {
        roleDAO.changeRoleType(id, type);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class)
    public void changeRoleName(Long id, String name) {
        roleDAO.changeRoleName(id, name);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class)
    public void changeRoleStatus(Long id, Integer status) {
        roleDAO.changeRoleStatus(id, status);
    }


    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<RolePO> acqurieParentRole(List<RolePO> rolePOS) throws RuntimeException {
        List<RolePO> list = new ArrayList<>();
        ws:for(int i = 0; i < rolePOS.size(); i++){
            RolePO rolePO = roleDAO.selectRoleByRoleId(rolePOS.get(i).getId());
            if(StringUtils.isNotEmpty(rolePO.getPath())&&rolePO.getParentId() != 0){
                String strs[] = rolePO.getPath().split("-");
                for(int k = 0; k < strs.length; k++) {
                    for (int j = 0; j < rolePOS.size(); j++) {
                        if (Long.valueOf(strs[k]).equals(rolePOS.get(j).getId())) {
                            continue ws;
                        }
                    }
                }
                list.add(rolePO);
            }else {
                list.add(rolePO);
            }
        }
        return list;
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<RoleMenuBindPO> selectRoleMenuBindByRoleIds(List<Long> roleIds) throws RuntimeException {
        return roleMenuBindDAO.selectRoleMenuBindByRoleIds(roleIds);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<RoleMenuBindPO> selectRoleMenuBindByRoleId(Long roleId) throws RuntimeException {
        return roleMenuBindDAO.selectRoleMenuBindByRoleId(roleId);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<RoleCompanyBindPO> selectRoleCompanyByRoleId(Long roleId) throws RuntimeException {
        return roleCompanyBindDAO.selectRoleCompanyByRoleId(roleId);
    }


    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<RoleUserBindPO> selectRoleUserBindByRoleId(Long roleId) throws RuntimeException {
        return roleUserBindDAO.selectRoleUserBindByRoleId(roleId);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class)
    public void deleteRoleUserBind(Long roleId,Long userId) throws RuntimeException {
        roleUserBindDAO.deleteRoleUserBindPOByRoleIdAndUserId(roleId,userId);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class)    
    public void deleteRoleCompanyBind(Long roleId,Long companyId) throws RuntimeException {
        roleCompanyBindDAO.deleteRoleCompanyBindPOByRoleIdAndCompanyId(roleId,companyId);
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public void deleteRoleCompanyBindPOByRoleId(Long roleId) throws RuntimeException {
        roleCompanyBindDAO.deleteRoleCompanyBindPOByRoleId(roleId);
    }
}
