package org.ws.java.order.dao.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.ws.java.order.model.po.RoleCompanyBindPO;

import java.util.List;

public interface RoleCompanyBindDAO extends JpaRepository<RoleCompanyBindPO,Long>,JpaSpecificationExecutor<RoleCompanyBindPO>{

    @Query("select R from RoleCompanyBindPO R where R.roleId = :roleId")
    public List<RoleCompanyBindPO> selectRoleCompanyByRoleId(@Param("roleId") Long roleId);

    @Modifying
    @Query("delete from RoleCompanyBindPO R where R.companyId= :companyId and R.roleId = :roleId")
    public void  deleteRoleCompanyBindPOByRoleIdAndCompanyId(@Param("roleId")Long roleId,@Param("companyId") Long companyId);

    @Modifying
    @Query("delete from RoleCompanyBindPO R where R.roleId = :roleId")
    public void deleteRoleCompanyBindPOByRoleId(@Param("roleId")Long roleId);
}
