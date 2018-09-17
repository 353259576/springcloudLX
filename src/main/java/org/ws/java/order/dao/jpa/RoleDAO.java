package org.ws.java.order.dao.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.ws.java.order.model.po.RolePO;

import java.util.List;

public interface RoleDAO extends JpaRepository<RolePO,Long>,JpaSpecificationExecutor<RolePO> {

    @Query("select R from RolePO R where R.id in (:ids) and R.status = :status")
    public List<RolePO> selectRoleByIds(@Param("ids") List<Long> ids,@Param("status")Integer status);


    @Query("select R from RolePO R where R.id in (:ids) and R.type=:type and R.status = :status")
    public List<RolePO> selectRoleByIdsAndType(@Param("ids") List<Long> ids,@Param("type") Integer type,@Param("status")Integer status);


    @Query("select R from RolePO R where R.id=:roleId")
    public RolePO selectRoleByRoleId(@Param("roleId") Long roleId);

    @Query("select R from RolePO R where R.parentId=:roleId")
    public List<RolePO> selectRoleByParentRoleId(@Param("roleId") Long roleId);


    @Modifying
    @Query("update RolePO R set R.parentId = :parentId,R.path = :path where R.id = :id")
    public void changeRoleLocation(@Param("id") Long id,@Param("parentId")Long parentId,@Param("path")String path);

    @Modifying
    @Query("update RolePO R set R.type = :type where R.id = :id")
    public void changeRoleType(@Param("id")Long id,@Param("type") Integer type);

    @Modifying
    @Query("update RolePO R set R.name = :name where R.id = :id")
    public void changeRoleName(@Param("id") Long id,@Param("name")String name);

    @Modifying
    @Query("update RolePO R set R.status = :status where R.id = :id")
    public void changeRoleStatus(@Param("id")Long id,@Param("status")Integer status);

}
