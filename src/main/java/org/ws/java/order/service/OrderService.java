package org.ws.java.order.service;

import org.ws.java.order.model.po.ChildOrderPO;
import org.ws.java.order.model.po.OrderCompanyBindPO;
import org.ws.java.order.model.po.OrderPO;
import org.ws.java.order.model.po.OrderPromulgatorPO;
import org.ws.java.order.model.vo.PageInfo;
import org.ws.java.order.model.vo.PageVO;
import org.ws.java.order.model.vo.ReturnKeyValueVO;
import org.ws.java.order.wsutils.DataBaseHandle.MySearchList;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface OrderService {

    public Long insertOrder(OrderPO orderPO) throws RuntimeException;

    public Long insertChildOrder(ChildOrderPO childOrderPO) throws RuntimeException;

    public PageInfo<OrderPO> selectOrder(MySearchList mySearchList, PageVO pageVO) throws RuntimeException;

    public PageInfo<ChildOrderPO> selectChildOrder(MySearchList mySearchList,PageVO pageVO) throws RuntimeException;

    public List<Long> selectOrderIdsByCompanyIds(List<Long> companyIds) throws RuntimeException;

    public OrderPO selectOrderById(Long orderId) throws RuntimeException;


    public OrderPO selectOrderByIdQ(Long orderId) throws RuntimeException;

    public void updateSubtractNum(Long id) throws RuntimeException;

    public void updateAddtractNum(Long id) throws RuntimeException;

    public List<OrderCompanyBindPO> selectOrderIdByOrderIdAndCompanyId(Long orderId,Long companyId) throws RuntimeException;

    public PageInfo<OrderPO> selectOrderByUser(Map map) throws RuntimeException;

    public List<ChildOrderPO> selectChildOrderByCreteUserAndStatusAndOrderId(Long orderId, Integer status, String userPhone) throws RuntimeException;

    public ChildOrderPO selectChildOrderById(Long childOrderId) throws RuntimeException;

    public void updateChildOrderStatusById(Long childOrderId,Integer status) throws RuntimeException;

    public void updateChildOrOrderByChildFailedRemake(Long childOrderId,String msg) throws RuntimeException;

    public void updateOrderRealPriceById(Long id) throws RuntimeException;

    public Long insertOrderCompanyBind(OrderCompanyBindPO orderCompanyBindPO) throws RuntimeException;

    public void deleteOrderCompanyBindById(Long companyId,Long orderId) throws RuntimeException;

    public void updateOrder(OrderPO orderPO) throws RuntimeException;

    public List<ChildOrderPO> selectOverdueChildOrder(Date endTime, Integer status) throws RuntimeException;

    public void updateChildOrderMsg(Long id,String childOrderMsg) throws RuntimeException;

    public List<ChildOrderPO> selectChildOrderByStatusAndOrderId(Long orderId,Integer status);

    public Integer selectChildOrderCountByStatusAndOrderId(Long orderId, Integer status) throws RuntimeException;

    public List<ReturnKeyValueVO> selectChildOrderCountGroup(Map map) throws RuntimeException;

    public void updateChildOrderPrice(Long id,Double realPrice,Double agencyPrice) throws RuntimeException;

    public Double selectChildOrderRealPrice(Map map) throws RuntimeException;

    public Double selectChildOrderAgencyPrice(Map map) throws RuntimeException;

    public List<ReturnKeyValueVO> selectChildOrderRealPriceGroup(Map map) throws RuntimeException;

    public List<ReturnKeyValueVO> selectChildOrderAgencyPriceGroup(Map map) throws RuntimeException;

    public List<ChildOrderPO> selectChildOrderByCompanyIdAndStatus(Long companyId,String userPhone,Integer status) throws RuntimeException;

    public Integer selectChildOrderCount(Map map) throws RuntimeException;


    public List<ChildOrderPO> selectChildOrderAll(MySearchList mySearchList) throws RuntimeException;


    public List<OrderCompanyBindPO> selectOrderIdByOrderId(Long orderId) throws RuntimeException;

    public void updateChildOrder(ChildOrderPO childOrderPO) throws RuntimeException;

    public void updateChildOrderUserAndDate(Long childOrderId,Long userId,Date updateDate) throws RuntimeException;

    public Long insertOrderProMulgator(OrderPromulgatorPO orderProMulgatorPO) throws RuntimeException;

    public List<OrderPromulgatorPO> selectrOrderPromulgatorByNameAndOrderCreateDate(String name,Date createDate) throws RuntimeException;

    public List<OrderPromulgatorPO> selectrOrderPromulgatorByNameAndOrderCreateDateAndStatus(String name,Date createDate,Integer status) throws RuntimeException;

    public PageInfo<OrderPromulgatorPO> selectOrderPromulgator(MySearchList mySearchList) throws RuntimeException;

    public List<OrderPO> selectOrderByOrderPromulgatorAndOrderEffectiveDateAndStatus(String promulgatorName, Date effectiveDate ,Integer status) throws RuntimeException;

    public void updateOrOrderPromulgatorStatus(Long id,Integer status) throws RuntimeException;

    public Integer selectChildOrderUserCount(Map map) throws RuntimeException;
}
