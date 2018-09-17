package org.ws.java.order.dao.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.ws.java.order.model.po.RoleMenuBindPO;

import java.util.List;

public interface RoleMenuBindDAO extends JpaRepository<RoleMenuBindPO,Long>,JpaSpecificationExecutor<RoleMenuBindPO>{

    @Query("select R from RoleMenuBindPO R where R.roleId = :roleId")
    public List<RoleMenuBindPO> selectRoleMenuBindByRoleId(@Param("roleId") Long roleId);

    @Query("select R from RoleMenuBindPO R where R.roleId in (:roleIds)")
    public List<RoleMenuBindPO> selectRoleMenuBindByRoleIds(@Param("roleIds") List<Long> roleIds);


    @Modifying
    @Query("delete from RoleMenuBindPO R where R.id = :id")
    public void deleteRoleMenuBindPOById(@Param("id") Long id);


    @Modifying
    @Query("delete from RoleMenuBindPO R where R.roleId = :roleId")
    public void deleteRoleMenuBindPOByroleId(@Param("roleId") Long roleId);

}
