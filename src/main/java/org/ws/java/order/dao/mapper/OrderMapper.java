package org.ws.java.order.dao.mapper;

import org.ws.java.order.model.po.ChildOrderPO;
import org.ws.java.order.model.po.OrderPO;
import org.ws.java.order.model.vo.ReturnKeyValueVO;

import java.util.List;
import java.util.Map;

public interface OrderMapper {

    public List<OrderPO> selectOrderByUser(Map map);

    public void updateOrder(OrderPO orderPO);

    public List<ReturnKeyValueVO> selectChildOrderCountGroup(Map map);
    public List<ReturnKeyValueVO> selectChildOrderRealPriceGroup(Map map);
    public List<ReturnKeyValueVO> selectChildOrderAgencyPriceGroup(Map map);

    public Integer selectChildOrderCount(Map map);
    public Double selectChildOrderRealPrice(Map map);
    public Double selectChildOrderAgencyPrice(Map map);

    public void updateChildOrder(ChildOrderPO childOrderPO);

    public Integer selectChildOrderUserCount(Map map);
}
