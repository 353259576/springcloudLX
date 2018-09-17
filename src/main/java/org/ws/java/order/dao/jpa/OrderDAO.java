package org.ws.java.order.dao.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.ws.java.order.model.po.OrderPO;

import java.util.Date;
import java.util.List;

public interface OrderDAO extends JpaRepository<OrderPO,Long>, JpaSpecificationExecutor<OrderPO> {


    @Modifying
    @Query("update OrderPO O set O.orderNum = O.orderNum - 1 where O.id = :id")
    public void updateSubtractNum(@Param("id") Long id);

    @Modifying
    @Query("update OrderPO O set O.orderNum = O.orderNum + 1 where O.id = :id")
    public void updateAddtractNum(@Param("id") Long id);

    @Modifying
    @Query("update OrderPO O set O.orderRealNum = O.orderRealNum + 1, O.orderRealPrice = O.orderRealPrice + O.orderPrice where O.id = :id")
    public void updateOrderRealPriceById(@Param("id") Long id);

    @Query("select O from OrderPO O where O.orderPromulgator = :promulgatorName and O.orderEffectiveDate = :effectiveDate and O.orderStatus = :status")
    public List<OrderPO> selectOrderByOrderPromulgatorAndOrderEffectiveDateAndStatus(@Param("promulgatorName") String promulgatorName, @Param("effectiveDate") Date effectiveDate ,@Param("status") Integer status);




}
