package org.ws.java.order.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.ws.java.order.annotation.DataBase;
import org.ws.java.order.config.DynamicDataSource;
import org.ws.java.order.constants.DataBaseConstant;
import org.ws.java.order.constants.OrderEnum;
import org.ws.java.order.dao.jpa.ChildOrderDAO;
import org.ws.java.order.dao.jpa.OrderCompanyBindDAO;
import org.ws.java.order.dao.jpa.OrderDAO;
import org.ws.java.order.dao.jpa.OrderPromulgatorDAO;
import org.ws.java.order.dao.mapper.OrderMapper;
import org.ws.java.order.model.po.ChildOrderPO;
import org.ws.java.order.model.po.OrderCompanyBindPO;
import org.ws.java.order.model.po.OrderPO;
import org.ws.java.order.model.po.OrderPromulgatorPO;
import org.ws.java.order.model.vo.PageInfo;
import org.ws.java.order.model.vo.PageVO;
import org.ws.java.order.model.vo.ReturnKeyValueVO;
import org.ws.java.order.service.OrderService;
import org.ws.java.order.utils.PageConvertUtil;
import org.ws.java.order.wsutils.DataBaseHandle.JpaDataHandle;
import org.ws.java.order.wsutils.DataBaseHandle.MySearchList;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDAO orderDAO;

    @Autowired
    private ChildOrderDAO childOrderDAO;

    @Autowired
    private OrderCompanyBindDAO orderCompanyBindDAO;

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private OrderPromulgatorDAO orderProMulgatorDAO;

    @Override
    @Transactional(rollbackFor = RuntimeException.class,propagation = Propagation.MANDATORY)
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    public Long insertOrder(OrderPO orderPO) throws RuntimeException {
        orderPO.setId(null);
        orderPO.setOrderCreateDate(new Date());
        orderPO.setOrderUpdateUser(null);
        orderPO.setOrderUpdateDate(null);
        orderPO.setOrderStatus(Integer.valueOf(OrderEnum.ORDERPROCEED.getCode()));
        orderDAO.save(orderPO);
        return orderPO.getId();
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class,propagation = Propagation.MANDATORY)
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    public Long insertChildOrder(ChildOrderPO childOrderPO) throws RuntimeException {
        childOrderPO.setId(null);
        childOrderPO.setChildOrderCreateDate(new Date());
        childOrderDAO.save(childOrderPO);
        return childOrderPO.getId();
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public PageInfo<OrderPO> selectOrder(MySearchList mySearchList, PageVO pageVO) throws RuntimeException {
        PageInfo<OrderPO> orderPOPageInfo = PageConvertUtil.createPageInfo(orderDAO,mySearchList,OrderPO.class);
        return orderPOPageInfo;
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public PageInfo<ChildOrderPO> selectChildOrder(MySearchList mySearchList, PageVO pageVO) throws RuntimeException {
        PageInfo<ChildOrderPO> childOrderPOPageInfo =PageConvertUtil.createPageInfo(childOrderDAO,mySearchList,ChildOrderPO.class);
        return childOrderPOPageInfo;
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<Long> selectOrderIdsByCompanyIds(List<Long> companyIds) throws RuntimeException {
        if(companyIds == null || companyIds.size() == 0){
            return null;
        }
        return orderCompanyBindDAO.selectOrderIdByCompanyId(companyIds);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public OrderPO selectOrderById(Long orderId) throws RuntimeException {
        return orderDAO.findById(orderId).orElse(null);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.MANDATORY)
    public void updateSubtractNum(Long id) throws RuntimeException {
        orderDAO.updateSubtractNum(id);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    public OrderPO selectOrderByIdQ(Long orderId) throws RuntimeException {
        return orderDAO.findById(orderId).orElse(null);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.MANDATORY)
    public void updateAddtractNum(Long id) throws RuntimeException {
        orderDAO.updateAddtractNum(id);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    public List<OrderCompanyBindPO> selectOrderIdByOrderIdAndCompanyId(Long orderId, Long companyId) throws RuntimeException {
        return orderCompanyBindDAO.selectOrderIdByOrderIdAndCompanyId(orderId,companyId);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public PageInfo<OrderPO> selectOrderByUser(Map map) throws RuntimeException {
        PageVO pageVO = (PageVO) map.get(DataBaseConstant.PAGE);
        if(pageVO == null){
            //pageVO = new PageVO();
            throw new RuntimeException("没有分页信息");
        }
        List<OrderPO> orderPOS = orderMapper.selectOrderByUser(map);
        PageInfo<OrderPO> orderPOPageInfo = new PageInfo<>();
        orderPOPageInfo.setDataList(orderPOS);
        orderPOPageInfo.setPageVO(pageVO);
        return orderPOPageInfo;
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    public List<ChildOrderPO> selectChildOrderByCreteUserAndStatusAndOrderId(Long orderId, Integer status, String userPhone) throws RuntimeException {
        return childOrderDAO.selectChildOrderByCreteUserAndStatusAndOrderId(orderId,status,userPhone);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    public ChildOrderPO selectChildOrderById(Long childOrderId) throws RuntimeException {
        return childOrderDAO.findById(childOrderId).orElse(null);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class)
    public void updateChildOrderStatusById(Long childOrderId, Integer status) throws RuntimeException {
        childOrderDAO.updateChildOrderStatusById(childOrderId,status);
    }


    @Override
    @Transactional(rollbackFor = RuntimeException.class,propagation = Propagation.MANDATORY)
    public void updateChildOrOrderByChildFailedRemake(Long childOrderId, String msg) throws RuntimeException {
        childOrderDAO.updateChildOrOrderByChildFailedRemake(childOrderId,msg);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class,propagation = Propagation.MANDATORY)
    public void updateOrderRealPriceById(Long id) throws RuntimeException {
        orderDAO.updateOrderRealPriceById(id);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class)
    public Long insertOrderCompanyBind(OrderCompanyBindPO orderCompanyBindPO) throws RuntimeException {
        return orderCompanyBindDAO.save(orderCompanyBindPO).getId();
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class)
    public void deleteOrderCompanyBindById(Long companyId, Long orderId) throws RuntimeException {
        orderCompanyBindDAO.deleteOrderCompany(companyId,orderId);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class)
    public void updateOrder(OrderPO orderPO) throws RuntimeException {
        orderMapper.updateOrder(orderPO);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<ChildOrderPO> selectOverdueChildOrder(Date endTime, Integer status) throws RuntimeException {
        return childOrderDAO.selectOverdueChildOrder(endTime,status);
    }


    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class)
    public void updateChildOrderMsg(Long id, String childOrderMsg) throws RuntimeException {
        childOrderDAO.updateChildOrderMsg(id,childOrderMsg);
    }


    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<ChildOrderPO> selectChildOrderByStatusAndOrderId(Long orderId, Integer status) {
        return childOrderDAO.selectChildOrderByStatusAndOrderId(orderId,status);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    public Integer selectChildOrderCountByStatusAndOrderId(Long orderId, Integer status) throws RuntimeException {
        return childOrderDAO.selectChildOrderCountByStatusAndOrderId(orderId,status);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<ReturnKeyValueVO> selectChildOrderCountGroup(Map map) throws RuntimeException {
        return orderMapper.selectChildOrderCountGroup(map);
    }


    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class,propagation = Propagation.MANDATORY)
    public void updateChildOrderPrice(Long id, Double realPrice, Double agencyPrice) throws RuntimeException {
        childOrderDAO.updateChildOrderPrice(id,realPrice,agencyPrice);
    }


    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public Double selectChildOrderRealPrice(Map map) throws RuntimeException {
        Double price = orderMapper.selectChildOrderRealPrice(map);
        if(price == null){
            price = 0d;
        }
        return price;
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public Double selectChildOrderAgencyPrice(Map map) throws RuntimeException {
        Double price = orderMapper.selectChildOrderAgencyPrice(map);
        if(price == null){
            price = 0d;
        }
        return price;
    }


    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<ReturnKeyValueVO> selectChildOrderRealPriceGroup(Map map) throws RuntimeException {
        return orderMapper.selectChildOrderRealPriceGroup(map);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<ReturnKeyValueVO> selectChildOrderAgencyPriceGroup(Map map) throws RuntimeException {
        return orderMapper.selectChildOrderAgencyPriceGroup(map);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<ChildOrderPO> selectChildOrderByCompanyIdAndStatus(Long companyId,String userPhone, Integer status) throws RuntimeException {
        return childOrderDAO.selectChildOrderByCompanyIdAndStatus(companyId,userPhone,status);
    }


    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public Integer selectChildOrderCount(Map map) throws RuntimeException {
        Integer count = orderMapper.selectChildOrderCount(map);
        return count==null?0:count;
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<ChildOrderPO> selectChildOrderAll(MySearchList mySearchList) throws RuntimeException {
        Specification<ChildOrderPO> specification = JpaDataHandle.getSpecification(mySearchList);
        List<ChildOrderPO> childOrderPOS = childOrderDAO.findAll(specification);
        return childOrderPOS;
    }


    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<OrderCompanyBindPO> selectOrderIdByOrderId(Long orderId) throws RuntimeException {
        return orderCompanyBindDAO.selectOrderIdByOrderId(orderId);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class)
    public void updateChildOrder(ChildOrderPO childOrderPO) throws RuntimeException {
        orderMapper.updateChildOrder(childOrderPO);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class)
    public void updateChildOrderUserAndDate(Long childOrderId, Long userId, Date updateDate) throws RuntimeException {
        childOrderDAO.updateChildOrderUserAndDate(childOrderId,userId,updateDate);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class)
    public Long insertOrderProMulgator(OrderPromulgatorPO orderProMulgatorPO) throws RuntimeException {
        return orderProMulgatorDAO.save(orderProMulgatorPO).getId();
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<OrderPromulgatorPO> selectrOrderPromulgatorByNameAndOrderCreateDate(String name,Date createDate) throws RuntimeException {
        return orderProMulgatorDAO.selectrOrderPromulgatorByNameAndOrderCreateDate(name,createDate);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public PageInfo<OrderPromulgatorPO> selectOrderPromulgator(MySearchList mySearchList) throws RuntimeException {
        PageInfo<OrderPromulgatorPO> orderProMulgatorPOPageInfo = PageConvertUtil.createPageInfo(orderProMulgatorDAO,mySearchList, OrderPromulgatorPO.class);
        return orderProMulgatorPOPageInfo;
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<OrderPromulgatorPO> selectrOrderPromulgatorByNameAndOrderCreateDateAndStatus(String name, Date createDate, Integer status) throws RuntimeException {
        return orderProMulgatorDAO.selectrOrderPromulgatorByNameAndOrderCreateDateAndStatus(name,createDate,status);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<OrderPO> selectOrderByOrderPromulgatorAndOrderEffectiveDateAndStatus(String promulgatorName, Date effectiveDate, Integer status) throws RuntimeException {
        return orderDAO.selectOrderByOrderPromulgatorAndOrderEffectiveDateAndStatus(promulgatorName,effectiveDate,status);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class)
    public void updateOrOrderPromulgatorStatus(Long id, Integer status) throws RuntimeException {
        orderProMulgatorDAO.updateOrOrderPromulgatorStatus(id,status);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public Integer selectChildOrderUserCount(Map map) throws RuntimeException {
        Integer count = orderMapper.selectChildOrderUserCount(map);
        return count==null?0:count;
    }
}
