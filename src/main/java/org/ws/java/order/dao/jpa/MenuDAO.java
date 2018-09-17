package org.ws.java.order.dao.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.ws.java.order.model.po.MenuPO;

import java.util.List;

public interface MenuDAO extends JpaRepository<MenuPO,Long> ,JpaSpecificationExecutor<MenuPO>{

    @Query("select M from MenuPO M where M.id in (:ids) and M.status = 1")
    public List<MenuPO> selectMenuByIds(@Param("ids") List<Long> ids);

    @Query("select M from MenuPO M where M.id in (:ids) and M.status = 1 and M.type = 3")
    public List<MenuPO> selectMenuByIdsRole(@Param("ids") List<Long> ids);

    @Query("select M from MenuPO M where M.id = :id and M.status = 1")
    public MenuPO selectMenuById(@Param("id") Long id);

    @Query("select M from MenuPO M where M.path = :path and M.status = 1")
    public List<MenuPO> selectMenuByPath(@Param("path") String path);

    @Query("select M from MenuPO M where M.status = 1")
    public List<MenuPO> selectMenuAll();


}
