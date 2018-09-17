package org.ws.java.order.dao.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.ws.java.order.model.po.OrderPromulgatorPO;

import java.util.Date;
import java.util.List;

public interface OrderPromulgatorDAO extends JpaRepository<OrderPromulgatorPO,Long>, JpaSpecificationExecutor<OrderPromulgatorPO> {

    @Query("select OM from OrderPromulgatorPO OM where OM.orderPromulgatorName = :name and OM.orderCreateDate = :createDate")
    public List<OrderPromulgatorPO> selectrOrderPromulgatorByNameAndOrderCreateDate(@Param("name") String name, @Param("createDate")Date createDate);

    @Query("select OM from OrderPromulgatorPO OM where OM.orderPromulgatorName = :name and OM.orderCreateDate = :createDate and OM.orderPromulgatorStatus = :status")
    public List<OrderPromulgatorPO> selectrOrderPromulgatorByNameAndOrderCreateDateAndStatus(@Param("name") String name, @Param("createDate")Date createDate,@Param("status") Integer status);

    @Modifying
    @Query("update OrderPromulgatorPO OP set OP.orderPromulgatorStatus = :status where OP.id = :id")
    public void updateOrOrderPromulgatorStatus(@Param("id") Long id,@Param("status") Integer status);
}
