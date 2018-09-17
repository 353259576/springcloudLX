package org.ws.java.order.dao.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.ws.java.order.model.po.RoleUserBindPO;

import java.util.List;

public interface RoleUserBindDAO extends JpaRepository<RoleUserBindPO,Long>,JpaSpecificationExecutor<RoleUserBindPO> {


    @Query("select R from RoleUserBindPO R where R.roleId = :roleId")
    public List<RoleUserBindPO> selectRoleUserBindByRoleId(@Param("roleId") Long roleId);


    @Query("select R from RoleUserBindPO R where R.userId = :userId")
    public List<RoleUserBindPO> selectRoleUserBindByUserId(@Param("userId") Long userId);


    @Modifying
    @Query("delete from RoleUserBindPO R where R.id = :id")
    public void deleteRoleUserBindPOById(@Param("id") Long id);

    @Modifying
    @Query("delete from RoleUserBindPO R where R.roleId = :roleId and R.userId = :userId")
    public void deleteRoleUserBindPOByRoleIdAndUserId(@Param("roleId") Long roleId, @Param("userId")Long userId);
}
