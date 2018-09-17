package org.ws.java.order.dao.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.ws.java.order.model.po.OrderCompanyBindPO;

import java.util.List;

public interface OrderCompanyBindDAO extends JpaRepository<OrderCompanyBindPO,Long>, JpaSpecificationExecutor<OrderCompanyBindPO> {

    @Query("select O.orderId from OrderCompanyBindPO O where O.companyId in (:companyIds)")
    public List<Long> selectOrderIdByCompanyId(@Param("companyIds") List<Long> companyIds);

    @Query("select O from OrderCompanyBindPO O where O.companyId = :companyId and O.orderId = :orderId")
    public List<OrderCompanyBindPO> selectOrderIdByOrderIdAndCompanyId(@Param("orderId") Long orderId,@Param("companyId") Long companyId);

    @Query("select O from OrderCompanyBindPO O where O.orderId = :orderId")
    public List<OrderCompanyBindPO> selectOrderIdByOrderId(@Param("orderId") Long orderId);

    @Modifying
    @Query("delete from OrderCompanyBindPO OCB where OCB.companyId = :companyId and OCB.orderId = :orderId")
    public void deleteOrderCompany(@Param("companyId") Long companyId,@Param("orderId") Long orderId);
}
