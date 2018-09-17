package org.ws.java.order.dao.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.ws.java.order.model.po.ChildOrderPO;

import java.util.Date;
import java.util.List;

public interface ChildOrderDAO extends JpaRepository<ChildOrderPO,Long>, JpaSpecificationExecutor<ChildOrderPO> {

    @Query("select C from ChildOrderPO C where C.parentOrderId = :orderId and C.childOrderStatus = :status and C.userPhone = :userPhone")
    public List<ChildOrderPO> selectChildOrderByCreteUserAndStatusAndOrderId(@Param("orderId") Long orderId, @Param("status") Integer status, @Param("userPhone") String userPhone);


    @Query("select C from ChildOrderPO C where C.parentOrderId = :orderId and C.childOrderStatus = :status")
    public List<ChildOrderPO> selectChildOrderByStatusAndOrderId(@Param("orderId") Long orderId, @Param("status") Integer status);

    @Query("select count(C.id) from ChildOrderPO C where C.parentOrderId = :orderId and C.childOrderStatus = :status")
    public Integer selectChildOrderCountByStatusAndOrderId(@Param("orderId") Long orderId, @Param("status") Integer status);

    @Modifying
    @Query("update ChildOrderPO C set C.childOrderStatus = :status where C.id = :childOrderId")
    public void updateChildOrderStatusById(@Param("childOrderId") Long childOrderId,@Param("status") Integer status);


    @Modifying
    @Query("update ChildOrderPO C set C.childFailedRemake = :msg where C.id = :childOrderId")
    public void updateChildOrOrderByChildFailedRemake(@Param("childOrderId") Long childOrderId,@Param("msg") String msg);


    @Query("select C from ChildOrderPO C where C.childOrderCreateDate < :endTime and C.childOrderStatus = :status")
    public List<ChildOrderPO> selectOverdueChildOrder(@Param("endTime") Date endTime,@Param("status") Integer status);


    @Modifying
    @Query("update ChildOrderPO C set C.childOrderMsg = :childOrderMsg where C.id = :id")
    public void updateChildOrderMsg(@Param("id") Long id,@Param("childOrderMsg") String childOrderMsg);


    @Modifying
    @Query("update ChildOrderPO C set C.orderRealPrice = :realPrice,C.orderAgencyPrice = :agencyPrice where C.id = :id")
    public void updateChildOrderPrice(@Param("id") Long id,@Param("realPrice") Double realPrice,@Param("agencyPrice") Double agencyPrice);

    @Query("select C from ChildOrderPO C where C.childOrderCompanyId = :companyId and C.childOrderStatus = :status and C.userPhone = :userPhone")
    public List<ChildOrderPO> selectChildOrderByCompanyIdAndStatus(@Param("companyId") Long companyId,@Param("userPhone")String userPhone,@Param("status") Integer status);


    @Modifying
    @Query("update ChildOrderPO C set C.childOrderUpdateUser = :userId,C.childOrderUpdateDate = :updateDate where id = :childOrderId")
    public void updateChildOrderUserAndDate(@Param("childOrderId") Long childOrderId,@Param("userId") Long userId,@Param("updateDate") Date updateDate);
}

