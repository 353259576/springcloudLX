package org.ws.java.order.controller;

import com.alibaba.fastjson.JSON;
import io.swagger.annotations.*;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.ws.java.order.annotation.Authority;
import org.ws.java.order.annotation.MyLog;
import org.ws.java.order.constants.*;
import org.ws.java.order.controller.search.ordercontroller.*;
import org.ws.java.order.model.dto.UserOrderDTO;
import org.ws.java.order.model.po.*;
import org.ws.java.order.model.vo.*;
import org.ws.java.order.service.*;
import org.ws.java.order.utils.PageConvertUtil;
import org.ws.java.order.wsutils.DataBaseHandle.JpaDataHandle;
import org.ws.java.order.wsutils.DataBaseHandle.MySearch;
import org.ws.java.order.wsutils.DataBaseHandle.MySearchList;
import org.ws.java.order.wsutils.FileUtils;
import org.ws.java.order.wsutils.WsStringUtils;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.nio.channels.WritableByteChannel;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@RequestMapping("order/order/")
@Api(value = "订单处理")
@Slf4j
public class OrderController extends BaseController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private UserService userService;

    @Autowired
    private DictService dictService;

    @Autowired
    private CompanyService companyService;

    @Autowired
    private DrawingsService drawingsService;


    @RequestMapping("selectOrder")
    @ApiOperation(value = "管理员查询订单",httpMethod = "POST")
    @Authority(onlyAllowAdmin = true)
    public AjaxVO selectOrder(MySearchList mySearchList, PageVO pageVO){
        MySearch mySearch = mySearchList.remove("companyId");
        if(mySearch != null) {
            List<String> companyIdStrings = Arrays.asList((String[]) mySearch.getValue());
            if (companyIdStrings != null && companyIdStrings.size() != 0) {
                List<Long> companyIds = new ArrayList<>(companyIdStrings.size());
                for (int i = 0; i < companyIdStrings.size(); i++) {
                    companyIds.add(Long.valueOf(companyIdStrings.get(i)));
                }
                List<Long> orderId = orderService.selectOrderIdsByCompanyIds(companyIds);
                if (orderId != null && orderId.size() != 0) {
                    mySearchList.add("id", JpaDataHandle.Operator.IN, orderId);
                }
            }
        }
        mySearchList.add("orderCreateDate", JpaDataHandle.Operator.SORT,"desc");
        PageInfo<OrderPO> orderPOPageInfo = orderService.selectOrder(mySearchList,pageVO);
        List<OrderPO> orderPOS = orderPOPageInfo.getDataList();
        List<OrderVO> orderVOS = new ArrayList<>(orderPOS.size());
        OrderVO orderVO = null;
        UserPO userPO = null;
        DictPO dictPO = null;
        for(OrderPO orderPO : orderPOS){
            orderVO = new OrderVO();
            BeanUtils.copyProperties(orderPO,orderVO);
            if(orderVO.getOrderCreateDate() != null){
                orderVO.setOrderCreateDateLabel(WsStringUtils.dateToString(orderPO.getOrderCreateDate(),WsStringUtils.LONGTIMESTRING));
            }
            if(orderVO.getOrderUpdateDate() != null){
                orderVO.setOrderUpdateDateLabel(WsStringUtils.dateToString(orderPO.getOrderUpdateDate(),WsStringUtils.LONGTIMESTRING));
            }
            if(orderVO.getOrderCreateUser() != null){
                userPO = userService.selectUserById(orderPO.getOrderCreateUser());
                if(userPO != null && userPO.getId() != null){
                    orderVO.setOrderCreateUserLabel(userPO.getUserRealName());
                }
            }

            if(orderVO.getOrderUpdateUser() != null){
                userPO = userService.selectUserById(orderPO.getOrderUpdateUser());
                if(userPO != null && userPO.getId() != null){
                    orderVO.setOrderUpdateUserLabel(userPO.getUserRealName());
                }
            }

            if(orderVO.getOrderStatus() != null){
                dictPO = dictService.selectDictByCodeAndType(orderPO.getOrderStatus().toString(), OrderContants.ORDERSTATUS);
                if(dictPO != null){
                    orderVO.setOrderStatusLabel(dictPO.getLabel());
                }
            }

            if(orderVO.getOrderType() != null){
                dictPO = dictService.selectDictByCodeAndType(orderPO.getOrderType().toString(), OrderContants.ORDERTYPE);
                if(dictPO != null){
                    orderVO.setOrderTypeLabel(dictPO.getLabel());
                }
            }

            if(orderVO.getOrderEffectiveDate() != null){
                orderVO.setOrderEffectiveDateLabel(WsStringUtils.dateToString(orderVO.getOrderEffectiveDate(),WsStringUtils.LONGTIMESTRING));
            }


            orderVOS.add(orderVO);
        }
        PageInfo<OrderVO> orderVOPageInfo = PageConvertUtil.convertEmptyDataPage(orderPOPageInfo,OrderVO.class);
        orderVOPageInfo.setDataList(orderVOS);
        AjaxVO ajaxVO = AjaxVO.newAjax();
        ajaxVO.putDataList(orderVOPageInfo);
        return ajaxVO;
    }


    @RequestMapping(value = "insertOrder")
    @ApiOperation(value = "单个添加订单",httpMethod = "POST")
    @MyLog(name = "添加了一条订单")
    @Transactional(rollbackFor = RuntimeException.class)
    @Authority(onlyAllowAdmin = true)
    public AjaxVO insertOrder(@RequestBody InsertOrderSearch insertOrderSearch){
        OrderPO orderPO = new OrderPO();
        if(insertOrderSearch.getOrderIdcodeIndex() == null){
            insertOrderSearch.orderIdcodeIndex = 0;
        }
        if(insertOrderSearch.getOrderIdcodeIndex() > 18){
            insertOrderSearch.orderIdcodeIndex = 18;
        }
        BeanUtils.copyProperties(insertOrderSearch,orderPO);
        if (orderPO == null){
            return AjaxVO.returnFailMsg("数据为空");
        }
        if(StringUtils.isEmpty(orderPO.getOrderName())){
            return AjaxVO.returnFailMsg("订单名称为空");
        }
        if(StringUtils.isEmpty(orderPO.getOrderPromulgator())){
            return AjaxVO.returnFailMsg("订单提供方为空");
        }
        if(orderPO.getOrderType() == null){
            return AjaxVO.returnFailMsg("订单类型为空");
        }
        if(orderPO.getOrderAllNum() == null){
            return AjaxVO.returnFailMsg("订单总数为空");
        }
        if(orderPO.getOrderPrice() == null){
            return AjaxVO.returnFailMsg("订单单价为空");
        }
        if(orderPO.getOrderAgencyPrice() == null){
            return AjaxVO.returnFailMsg("订单代理单价为空");
        }
        if(StringUtils.isEmpty(insertOrderSearch.orderEffcientDate)){
            return AjaxVO.returnFailMsg("生效日期为空");
        }
        Date date = WsStringUtils.stringToDate(insertOrderSearch.orderEffcientDate);
        orderPO.setOrderNum(orderPO.getOrderAllNum());
        orderPO.setOrderPredictPrice(orderPO.getOrderAgencyPrice()*orderPO.getOrderNum());
        orderPO.setOrderAgencyAllPrice(0d);
        orderPO.setOrderRealPrice(0d);
        orderPO.setOrderNo(WsStringUtils.createOrderNo());
        orderPO.setOrderEffectiveDate(date);
        orderService.insertOrder(orderPO);
        List<OrderPromulgatorPO> promulgatorPOS = orderService.selectrOrderPromulgatorByNameAndOrderCreateDate(orderPO.getOrderPromulgator(),orderPO.getOrderEffectiveDate());
        if(promulgatorPOS == null || promulgatorPOS.isEmpty()){
            OrderPromulgatorPO orderPromulgatorPO = new OrderPromulgatorPO();
            orderPromulgatorPO.setOrderPromulgatorStatus(Integer.valueOf(OrderPromulgatorEnum.ORDERPROMULGATORDSH.getCode()));
            orderPromulgatorPO.setOrderPromulgatorName(orderPO.getOrderPromulgator());
            orderPromulgatorPO.setOrderCreateDate(orderPO.getOrderEffectiveDate());
            orderService.insertOrderProMulgator(orderPromulgatorPO);
        }
        return AjaxVO.returnSuccMsg("添加成功");
    }



    @RequestMapping(value = "insertOrders")
    @ApiOperation(value = "批量添加订单",httpMethod = "POST")
    @Transactional(rollbackFor = RuntimeException.class)
    @Authority(onlyAllowAdmin = true)
    public AjaxVO insertOrders(MultipartFile excelFile){
        if(excelFile == null){
            return AjaxVO.returnFailMsg("上传数据为空");
        }
        String fileName = excelFile.getOriginalFilename();
        if(!fileName.endsWith("xlsx")){
            return AjaxVO.returnFailMsg("文件类型错误");
        }
        try {
            XSSFWorkbook xssfWorkbook = new XSSFWorkbook(excelFile.getInputStream());
            XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(0);
            XSSFRow xssfRow = null;
            XSSFCell xssfCell = null;
            InsertOrderSearch insertOrderSearch = null;
            for(int i = 0; i < xssfSheet.getLastRowNum(); i++) {
                insertOrderSearch = new InsertOrderSearch();
                xssfRow = xssfSheet.getRow(i + 1);
                xssfCell = xssfRow.getCell(0);
                if(!(xssfCell == null || xssfCell.getCellTypeEnum().equals(CellType._NONE))) {
                    xssfCell.setCellType(CellType.STRING);
                    insertOrderSearch.setOrderName(xssfCell.getStringCellValue());
                }else {
                    continue;
                }
                xssfCell = xssfRow.getCell(1);
                if(!(xssfCell == null || xssfCell.getCellTypeEnum().equals(CellType._NONE))) {
                    xssfCell.setCellType(CellType.STRING);
                    insertOrderSearch.setOrderPromulgator(xssfCell.getStringCellValue());
                }
                xssfCell = xssfRow.getCell(2);
                if(!(xssfCell == null || xssfCell.getCellTypeEnum().equals(CellType._NONE))) {
                    if(xssfCell.getCellTypeEnum().equals(CellType.STRING)){
                        insertOrderSearch.setOrderEffcientDate(xssfCell.getStringCellValue());
                    }else {
                        insertOrderSearch.setOrderEffcientDate(WsStringUtils.dateToString(xssfCell.getDateCellValue(),WsStringUtils.LONGTIMESTRING));
                    }

                }
                xssfCell = xssfRow.getCell(3);
                if(!(xssfCell == null || xssfCell.getCellTypeEnum().equals(CellType._NONE))) {
                    xssfCell.setCellType(CellType.STRING);
                    insertOrderSearch.setOrderAllNum(Integer.valueOf(xssfCell.getStringCellValue()));
                }
                xssfCell = xssfRow.getCell(4);
                if(!(xssfCell == null || xssfCell.getCellTypeEnum().equals(CellType._NONE))) {
                    xssfCell.setCellType(CellType.STRING);
                    insertOrderSearch.setOrderPrice(new BigDecimal(xssfCell.getStringCellValue()).doubleValue());
                }
                xssfCell = xssfRow.getCell(5);
                if(!(xssfCell == null || xssfCell.getCellTypeEnum().equals(CellType._NONE))) {
                    xssfCell.setCellType(CellType.STRING);
                    insertOrderSearch.setOrderAgencyPrice(new BigDecimal(xssfCell.getStringCellValue()).doubleValue());
                }
                xssfCell = xssfRow.getCell(6);
                if(!(xssfCell == null || xssfCell.getCellTypeEnum().equals(CellType._NONE))) {
                    xssfCell.setCellType(CellType.STRING);
                    insertOrderSearch.setOrderType(Integer.valueOf(xssfCell.getStringCellValue()));
                }
                xssfCell = xssfRow.getCell(7);
                if(!(xssfCell == null || xssfCell.getCellTypeEnum().equals(CellType._NONE))){
                    xssfCell.setCellType(CellType.STRING);
                    insertOrderSearch.setOrderIdcodeIndex(Integer.valueOf(xssfCell.getStringCellValue()));
                }
                xssfCell = xssfRow.getCell(8);
                if(!(xssfCell == null || xssfCell.getCellTypeEnum().equals(CellType._NONE))){
                    xssfCell.setCellType(CellType.STRING);
                    insertOrderSearch.setOrderRemake(xssfCell.getStringCellValue());
                }
                AjaxVO ajaxVO = this.insertOrder(insertOrderSearch);
                if(ajaxVO.getFlag() != AjaxFlag.SUCC.code()){
                    throw new RuntimeException("添加失败");
                }
            }

        }catch (Exception e){
            e.printStackTrace();
            return AjaxVO.returnFailMsg("excel解析错误");
        }

        return AjaxVO.returnSuccMsg("上传成功");
    }



    @RequestMapping(value = "updateOrder")
    @ApiOperation(value = "修改订单信息",httpMethod = "POST")
    @Authority(onlyAllowAdmin = true)
    public AjaxVO updateOrder(@RequestBody UpdateOrderSearch updateOrderSearch){
        OrderPO orderPO = new OrderPO();
        BeanUtils.copyProperties(updateOrderSearch,orderPO);

        if(orderPO.getId() == null){
            return AjaxVO.returnFailMsg("订单ID为空");
        }
        OrderPO oldOrderPO = orderService.selectOrderById(orderPO.getId());
        if(oldOrderPO == null){
            return AjaxVO.returnFailMsg("订单不存在");
        }
        if(oldOrderPO.getOrderNum() > orderPO.getOrderAllNum()){
            return AjaxVO.returnFailMsg("订单超过已做订单");
        }
        UserPO userPO = getUser();
        Date date = WsStringUtils.stringToDate(updateOrderSearch.orderEffcientDate);
        orderPO.setOrderPredictPrice(orderPO.getOrderAgencyPrice()*orderPO.getOrderAllNum());
        orderPO.setOrderAgencyAllPrice(0d);
        orderPO.setOrderRealPrice(0d);
        orderPO.setOrderEffectiveDate(date);
        orderPO.setOrderCreateUser(null);
        orderPO.setOrderCreateDate(null);
        orderPO.setOrderUpdateUser(userPO.getId());
        orderPO.setOrderUpdateDate(new Date());
        orderService.updateOrder(orderPO);
        return AjaxVO.returnSuccMsg("修改成功");
    }


    @RequestMapping(value = "interruptOrder")
    @ApiOperation(value = "截单",httpMethod = "POST")
    @MyLog(name = "管理员截单")
    @Transactional(rollbackFor = RuntimeException.class)
    @Authority(onlyAllowAdmin = true)
    public AjaxVO interruptOrder(@RequestBody InterruptOrderSearch interruptOrderSearch){
        if(interruptOrderSearch.orderId == null){
            return AjaxVO.returnFailMsg("订单ID为空");
        }
        OrderPO orderPO = orderService.selectOrderById(interruptOrderSearch.orderId);
        if(orderPO == null){
            return AjaxVO.returnFailMsg("订单不存在");
        }
        if(orderPO.getOrderStatus().toString().equals(OrderEnum.ORDERPROCEED.getCode())){
            OrderPO orderPO1 = new OrderPO();
            orderPO1.setId(orderPO.getId());
            orderPO1.setOrderStatus(Integer.valueOf(OrderEnum.ORDERSUSPENGFD.getCode()));
            orderService.updateOrder(orderPO1);
            List<ChildOrderPO> childOrderPOS = orderService.selectChildOrderByStatusAndOrderId(orderPO.getId(),Integer.parseInt(ChildOrderEnum.CHILDORDERPROCEED.getCode()));
            if(childOrderPOS != null){
                for (ChildOrderPO childOrder:childOrderPOS) {
                    orderService.updateChildOrderStatusById(childOrder.getId(),Integer.valueOf(ChildOrderEnum.CHILDORDEROVERTIME.getCode()));
                    orderService.updateChildOrOrderByChildFailedRemake(childOrder.getId(),"订单截单");
                    orderService.updateAddtractNum(childOrder.getParentOrderId());
                }
            }
            return AjaxVO.returnSuccMsg("截单成功");
        }else {
            return AjaxVO.returnFailMsg("当前订单不能截单");
        }
    }


    @RequestMapping(value = "accomplishOrder")
    @ApiOperation(value = "停止订单填写，订单进入审核阶段",httpMethod = "POST")
    @MyLog(name = "管理员停止订单填写")
    @Transactional(rollbackFor = RuntimeException.class)
    @Authority(onlyAllowAdmin = true)
    public synchronized AjaxVO accomplishOrder(@RequestBody AccomplishOrderSearch accomplishOrderSearch){
        if(accomplishOrderSearch.orderId == null){
            return AjaxVO.returnFailMsg("订单ID为空");
        }
        OrderPO orderPO = orderService.selectOrderById(accomplishOrderSearch.orderId);
        if(orderPO == null){
            return AjaxVO.returnFailMsg("订单不存在");
        }
        if(orderPO.getOrderStatus().toString().equals(OrderEnum.ORDERPROCEED.getCode())){
            OrderPO orderPO1 = new OrderPO();
            orderPO1.setId(orderPO.getId());
            orderPO1.setOrderStatus(Integer.valueOf(OrderEnum.ORDERAUDIT.getCode()));
            orderService.updateOrder(orderPO1);
            List<ChildOrderPO> childOrderPOS = orderService.selectChildOrderByStatusAndOrderId(orderPO.getId(),Integer.parseInt(ChildOrderEnum.CHILDORDERPROCEED.getCode()));
            if(childOrderPOS != null){
                for (ChildOrderPO childOrder:childOrderPOS) {
                    orderService.updateChildOrderStatusById(childOrder.getId(),Integer.valueOf(ChildOrderEnum.CHILDORDEROVERTIME.getCode()));
                    orderService.updateChildOrOrderByChildFailedRemake(childOrder.getId(),"订单停止");
                    orderService.updateAddtractNum(childOrder.getParentOrderId());
                }
            }
            childOrderPOS = orderService.selectChildOrderByStatusAndOrderId(orderPO.getId(),Integer.parseInt(ChildOrderEnum.CHILDORDERFINASH.getCode()));
            if(childOrderPOS != null){
                for (ChildOrderPO childOrder:childOrderPOS) {
                    orderService.updateChildOrderStatusById(childOrder.getId(),Integer.valueOf(ChildOrderEnum.CHILDORDEROVERTIME.getCode()));
                    orderService.updateChildOrOrderByChildFailedRemake(childOrder.getId(),"订单停止，审核超时");
                    orderService.updateAddtractNum(childOrder.getParentOrderId());
                }
            }

            return AjaxVO.returnSuccMsg("停止完毕");
        }else {
            return AjaxVO.returnFailMsg("订单状态错误");
        }
    }

    @RequestMapping(value = "finishOrder")
    @ApiOperation(value = "核算完成订单",httpMethod = "POST")
    @MyLog(name = "管理员核算完成订单")
    @Authority(onlyAllowAdmin = true)
    public AjaxVO finishOrder(@RequestBody FinishOrderSearch finishOrderSearch){
        if(finishOrderSearch.orderId == null){
            return AjaxVO.returnFailMsg("订单ID为空");
        }
        OrderPO orderPO = orderService.selectOrderById(finishOrderSearch.orderId);
        if(orderPO == null){
            return AjaxVO.returnFailMsg("订单不存在");
        }

        if(orderPO.getOrderStatus().toString().equals(OrderEnum.ORDERAUDIT.getCode())){
            MySearchList mySearchList = new MySearchList();
            Integer count = orderService.selectChildOrderCountByStatusAndOrderId(orderPO.getId(),Integer.valueOf(ChildOrderEnum.CHILDORDERFINASH.getCode()));
            Integer count1 = orderService.selectChildOrderCountByStatusAndOrderId(orderPO.getId(),Integer.valueOf(ChildOrderEnum.CHILDORDERMERCHANTAUDIT.getCode()));
            if(count == null){
                count = 0;
            }
            if(count1 == null){
                count1 = 0;
            }
            count = count + count1;
            if(count == null || count == 0){
                count = orderService.selectChildOrderCountByStatusAndOrderId(orderPO.getId(),Integer.valueOf(ChildOrderEnum.CHILDORDERQUALIFIED.getCode()));
                OrderPO orderPO1 = new OrderPO();
                orderPO1.setOrderRealNum(count);
                orderPO1.setOrderStatus(Integer.valueOf(OrderEnum.ORDERFINISH.getCode()));
                orderPO1.setId(orderPO.getId());
                if(!count.equals(orderPO.getOrderRealNum())){
                    log.info("数据出错已自动修正");
                }
                orderPO1.setOrderRealPrice(count*orderPO.getOrderPrice());
                Map map = new HashMap();
                map.put("parentOrderId",orderPO.getId());
                map.put("childOrderStatus",new String[]{ChildOrderEnum.CHILDORDERFINASH.getCode()});
                Double price = orderService.selectChildOrderAgencyPrice(map);
                orderPO1.setOrderAgencyAllPrice(price);
                orderService.updateOrder(orderPO1);

                List<OrderPO> orderPOS = orderService.selectOrderByOrderPromulgatorAndOrderEffectiveDateAndStatus(orderPO.getOrderPromulgator(),orderPO.getOrderEffectiveDate(),Integer.valueOf(OrderEnum.ORDERFINISH.getCode()));
                if(orderPOS == null || orderPOS.isEmpty()){
                    List<OrderPromulgatorPO> orderPromulgatorPOS = orderService.selectrOrderPromulgatorByNameAndOrderCreateDate(orderPO.getOrderPromulgator(),orderPO.getOrderEffectiveDate());
                    if(!(orderPromulgatorPOS ==null || orderPromulgatorPOS.isEmpty())){
                        for(OrderPromulgatorPO orderPromulgatorPO:orderPromulgatorPOS){
                            if(orderPromulgatorPO.getOrderPromulgatorStatus().toString().equals(OrderPromulgatorEnum.ORDERPROMULGATORDSH.getCode())){
                                orderService.updateOrOrderPromulgatorStatus(orderPromulgatorPO.getId(),Integer.valueOf(OrderPromulgatorEnum.ORDERPROMULGATORYJS.getCode()));
                            }
                        }
                    }
                }



                return AjaxVO.returnSuccMsg("订单完成");
            }else {
                return AjaxVO.returnFailMsg("还有子订单未审核");
            }
        }else {
            return AjaxVO.returnFailMsg("订单状态错误");
        }
    }



    @RequestMapping(value = "deleteOrder")
    @ApiOperation(value = "删除订单",httpMethod = "POST")
    @Authority(onlyAllowAdmin = true)
    public AjaxVO deleteOrder(@RequestBody DeleteOrder deleteOrder){
        if(deleteOrder.getOrderId() == null) {
            return AjaxVO.returnFailMsg("订单为空");
        }
        OrderPO orderPO = orderService.selectOrderByIdQ(deleteOrder.getOrderId());
        if(orderPO == null){
            return AjaxVO.returnFailMsg("订单不存在");
        }
        if(orderPO.getOrderStatus().toString().equals(OrderEnum.ORDERPROCEED.getCode())){
            OrderPO orderPO1 = new OrderPO();
            orderPO1.setId(orderPO.getId());
            orderPO1.setOrderStatus(Integer.valueOf(OrderEnum.ORDERREMOVE.getCode()));
            orderService.updateOrder(orderPO1);
            MySearchList mySearchList = new MySearchList();
            mySearchList.add("parentOrderId", JpaDataHandle.Operator.EQ,orderPO.getId());
            List<ChildOrderPO> childOrderPOS = orderService.selectChildOrderAll(mySearchList);
            if(childOrderPOS != null){
                for (ChildOrderPO childOrderPO:childOrderPOS) {
                    childOrderPO.setChildOrderStatus(Integer.valueOf(ChildOrderEnum.CHILDORDERDELETE.getCode()));
                    childOrderPO.setChildFailedRemake("管理员删除主订单");
                    orderService.updateChildOrder(childOrderPO);
                }
            }
            return AjaxVO.returnSuccMsg("删除完成");
        }else {
            return AjaxVO.returnFailMsg("订单不允许删除");
        }
    }





    @RequestMapping(value = "insertOrderCompanyBind")
    @ApiOperation(value = "订单与商家绑定",httpMethod = "POST")
    @MyLog(name = "订单商家绑定")
    @Authority(onlyAllowAdmin = true)
    public AjaxVO insertOrderCompanyBind(@RequestBody OrderCompanyBindPO orderCompanyBindPO){
        if(orderCompanyBindPO.getOrderId() == null){
            return AjaxVO.returnFailMsg("商家不存在");
        }
        if(orderCompanyBindPO.getCompanyId() == null){
            return AjaxVO.returnFailMsg("商家ID为空");
        }
        orderCompanyBindPO.setId(null);
        orderService.insertOrderCompanyBind(orderCompanyBindPO);
        return AjaxVO.returnSuccMsg("添加成功");
    }


    @RequestMapping(value = "deleteOrderCompanyBind")
    @ApiOperation(value = "订单与商家解除绑定",httpMethod = "POST")
    @MyLog(name = "订单商家解除绑定")
    @Authority(onlyAllowAdmin = true)
    public AjaxVO deleteOrderCompanyBind(@RequestBody DeleteOrderCompanyBindSearch deleteOrderCompanyBindSearch){
        if(deleteOrderCompanyBindSearch.getOrderId() == null){
            return AjaxVO.returnFailMsg("订单为空");
        }
        if(deleteOrderCompanyBindSearch.getCompanyId() == null){
            return AjaxVO.returnFailMsg("商家ID为空");
        }
        orderService.deleteOrderCompanyBindById(deleteOrderCompanyBindSearch.companyId,deleteOrderCompanyBindSearch.orderId);
        return AjaxVO.returnSuccMsg("解绑成功");
    }





    @RequestMapping("selectOrderByUser")
    @ApiOperation(value = "用户查询能够填写的订单",httpMethod = "POST")
    public AjaxVO selectOrderByUser(@RequestBody PageVO pageVO){
        HttpSession session = this.getHttpSession();
        UserOrderDTO userOrderDTO = (UserOrderDTO)session.getAttribute(SystemConstants.USERMSG);
        if(userOrderDTO == null) {
            return AjaxVO.returnFailMsg("用户未填写任何信息");
        }
        Calendar calendar = Calendar.getInstance();
        String startTime = null;
        String endTime = null;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        startTime = simpleDateFormat.format(calendar.getTime());
        calendar.add(Calendar.DAY_OF_MONTH,1);
        endTime = simpleDateFormat.format(calendar.getTime());
        Map<String,Object> map = new HashMap<>();
        map.put(DataBaseConstant.PAGE,pageVO);
        map.put("companyId",userOrderDTO.getCompanyId());

        map.put("startTime",startTime);
        map.put("endTime",endTime);
        map.put("orderStatus",OrderEnum.ORDERPROCEED.getCode());
        map.put("orderNum",0);
        AjaxVO ajaxVO = AjaxVO.newAjax();
        PageInfo<OrderPO> orderPOPageInfo = orderService.selectOrderByUser(map);
        //List<UserOrderVO> userOrderVOS = new ArrayList<>();
        PageInfo<UserOrderVO> userOrderVOPageInfo = PageConvertUtil.convertPage(orderPOPageInfo,UserOrderVO.class);
        ajaxVO.putDataList(userOrderVOPageInfo);
        return ajaxVO;

    }


    @RequestMapping("selectOrderByCompany")
    @ApiOperation(value = "商家查看数据",httpMethod = "POST")
    @Authority(companyName = "mySearchList.companyId",auto = true)
    public AjaxVO selectOrderByCompany(MySearchList mySearchList){
        MySearch mySearch = mySearchList.get("companyId");
        if(mySearch == null){
            return AjaxVO.returnFailMsg("商家信息为空");
        }
        Map map = mySearchList.createMybaitsMap();
        AjaxVO ajaxVO = AjaxVO.newAjax();
        PageInfo<OrderPO> orderPOPageInfo = orderService.selectOrderByUser(map);
        //List<UserOrderVO> userOrderVOS = new ArrayList<>();
        PageInfo<OrderVO> userOrderVOPageInfo = PageConvertUtil.convertPage(orderPOPageInfo,OrderVO.class);


        Map map1 = new HashMap();
        map1.put("childOrderStatus",new String[]{ChildOrderEnum.CHILDORDERMERCHANTAUDIT.getCode(),ChildOrderEnum.CHILDORDERFINASH.getCode(),ChildOrderEnum.CHILDORDERPLATFORMAUDITFAIL.getCode()});
        map1.put("childOrderCompanyId",mySearch.getValue());
        Integer count = null;
        UserPO userPO = null;
        DictPO dictPO = null;
        Double price = null;
        for(OrderVO orderVO:userOrderVOPageInfo.getDataList()){
            map1.put("parentOrderId",orderVO.getId());
            count = orderService.selectChildOrderCount(map1);
            price = orderService.selectChildOrderAgencyPrice(map1);
            orderVO.setOrderRealNum(count);
            orderVO.setOrderAgencyAllPrice(price);



            if(orderVO.getOrderCreateDate() != null){
                orderVO.setOrderCreateDateLabel(WsStringUtils.dateToString(orderVO.getOrderCreateDate(),WsStringUtils.LONGTIMESTRING));
            }
            if(orderVO.getOrderUpdateDate() != null){
                orderVO.setOrderUpdateDateLabel(WsStringUtils.dateToString(orderVO.getOrderUpdateDate(),WsStringUtils.LONGTIMESTRING));
            }
            if(orderVO.getOrderCreateUser() != null){
                userPO = userService.selectUserById(orderVO.getOrderCreateUser());
                if(userPO != null && userPO.getId() != null){
                    orderVO.setOrderCreateUserLabel(userPO.getUserRealName());
                }
            }

            if(orderVO.getOrderUpdateUser() != null){
                userPO = userService.selectUserById(orderVO.getOrderUpdateUser());
                if(userPO != null && userPO.getId() != null){
                    orderVO.setOrderUpdateUserLabel(userPO.getUserRealName());
                }
            }

            if(orderVO.getOrderStatus() != null){
                dictPO = dictService.selectDictByCodeAndType(orderVO.getOrderStatus().toString(), OrderContants.ORDERSTATUS);
                if(dictPO != null){
                    orderVO.setOrderStatusLabel(dictPO.getLabel());
                }
            }

            if(orderVO.getOrderType() != null){
                dictPO = dictService.selectDictByCodeAndType(orderVO.getOrderType().toString(), OrderContants.ORDERTYPE);
                if(dictPO != null){
                    orderVO.setOrderTypeLabel(dictPO.getLabel());
                }
            }

            if(orderVO.getOrderEffectiveDate() != null){
                orderVO.setOrderEffectiveDateLabel(WsStringUtils.dateToString(orderVO.getOrderEffectiveDate(),WsStringUtils.LONGTIMESTRING));
            }
            orderVO.setOrderPromulgator(null);
            orderVO.setOrderRealPrice(null);
            orderVO.setOrderPrice(null);
            orderVO.setOrderPredictPrice(null);


        }
        ajaxVO.putDataList(userOrderVOPageInfo);
        return ajaxVO;

    }





    @RequestMapping("selectChildOrder")
    @ApiOperation(value = "查询子订单",httpMethod = "POST")
    @Authority(companyName = "mySearchList.childOrderCompanyId",auto = true,isArray = true)
    public AjaxVO selectChildOrder(MySearchList mySearchList,PageVO pageVO){

        MySearch mySearch = mySearchList.remove("name");
        if(mySearch != null){
            MySearchList mySearchList1 = new MySearchList();
            mySearchList1.add(mySearch);
            List<CompanyPO> companyPOS = companyService.selectCompany(mySearchList1);
            if(!(companyPOS == null||companyPOS.size() == 0)){
                List<Long> longList = new ArrayList<>();
                for(CompanyPO companyPO:companyPOS){
                    longList.add(companyPO.getId());
                }
                mySearchList.add("childOrderCompanyId", JpaDataHandle.Operator.IN,longList);
            }
        }

        PageInfo<ChildOrderPO> childOrderPOPageInfo = orderService.selectChildOrder(mySearchList,pageVO);
        ChildOrderVO childOrderVO = null;
        DictPO dictPO = null;
        OrderPO orderPO = null;
        CompanyPO companyPO = null;
        List<ChildOrderVO> childOrderVOS = new ArrayList<>(childOrderPOPageInfo.getDataList().size());
        for (ChildOrderPO childOrderPO : childOrderPOPageInfo.getDataList()) {
            childOrderVO = new ChildOrderVO();
            BeanUtils.copyProperties(childOrderPO,childOrderVO);
            if(childOrderVO.getChildOrderStatus() != null){
                dictPO = dictService.selectDictByCodeAndType(childOrderVO.getChildOrderStatus().toString(),OrderContants.CHILDORDERSTATUS);
                if(dictPO != null){
                    childOrderVO.setChildOrderStatusLbel(dictPO.getLabel());
                }
            }

            if(childOrderVO.getChildOrderCompanyId() != null){
                companyPO = companyService.selectCompanyById(childOrderVO.getChildOrderCompanyId());
                if(companyPO != null){
                    childOrderVO.setCompanyName(companyPO.getName());
                }
            }


            if(childOrderVO.getParentOrderId() != null){
                orderPO = orderService.selectOrderById(childOrderVO.getParentOrderId());
                if(orderPO != null){
                    childOrderVO.setOrderName(orderPO.getOrderName());
                    childOrderVO.setOrderRemake(orderPO.getOrderRemake());
                }
            }

            if(childOrderVO.getChildOrderCreateDate() != null){
                childOrderVO.setChildOrderCreateDateLabel(WsStringUtils.dateToString(childOrderVO.getChildOrderCreateDate(),WsStringUtils.LONGTIMESTRING));
            }

            childOrderVOS.add(childOrderVO);

        }

        PageInfo<ChildOrderVO> childOrderVOPageInfo = PageConvertUtil.convertEmptyDataPage(childOrderPOPageInfo,ChildOrderVO.class);
        childOrderVOPageInfo.setDataList(childOrderVOS);
        AjaxVO ajaxVO = AjaxVO.newAjax();
        ajaxVO.putDataList(childOrderVOPageInfo);
        return ajaxVO;
    }





    @RequestMapping("createUserOrderMsg")
    @ApiOperation(value = "前端用户开始使用信息储存" ,httpMethod = "POST")
    public AjaxVO ucreateUserOrderMsg(@RequestBody UserOrderDTO userOrderDTO){
        HttpSession session = this.getHttpSession();
        if(userOrderDTO == null){
            return AjaxVO.returnFailMsg("用户信息为空");
        }
        if(userOrderDTO.getCompanyId() == null){
            return AjaxVO.returnFailMsg("网点信息为空");
        }
        if(StringUtils.isEmpty(userOrderDTO.getUserName())){
            return AjaxVO.returnFailMsg("用户姓名为空");
        }
        if(StringUtils.isEmpty(userOrderDTO.getUserPhone())){
            return AjaxVO.returnFailMsg("用户号码为空");
        }
        if(StringUtils.isEmpty(userOrderDTO.getUserIdCode())){
            return AjaxVO.returnFailMsg("用户身份证号为空");
        }
        session.setAttribute(SystemConstants.USERMSG,userOrderDTO);
        return AjaxVO.returnSuccMsg("用户信息填写成功");
    }

    @RequestMapping("insertChildOrder")
    @ApiOperation(value = "用户预加载订单",httpMethod = "POST")
    @Transactional(rollbackFor = RuntimeException.class)
    public synchronized AjaxVO insertChildOrder(@RequestBody InsertChildOrderSearch insertChildOrderSearch){
        ChildOrderPO childOrderPO = new ChildOrderPO();
        BeanUtils.copyProperties(insertChildOrderSearch,childOrderPO);
        HttpSession session = this.getHttpSession();
        if(childOrderPO == null){
            return AjaxVO.returnFailMsg("请输入数据");
        }
        if(childOrderPO.getParentOrderId() == null){
            return AjaxVO.returnFailMsg("订单信息为空");
        }
        UserOrderDTO userOrderDTO = (UserOrderDTO)session.getAttribute(SystemConstants.USERMSG);
        if(userOrderDTO == null){
            return AjaxVO.returnFailMsg("用户信息为空");
        }
        OrderPO orderPO = orderService.selectOrderByIdQ(childOrderPO.getParentOrderId());
        if(orderPO == null){
            return AjaxVO.returnFailMsg("订单不存在");
        }
        if(orderPO.getOrderNum() <= 0){
            return AjaxVO.returnFailMsg("订单已满");
        }
        if(orderPO.getOrderType().toString().equals(OrderEnum.LIMIT.getCode())) {
            List<OrderCompanyBindPO> orderCompanyBindPOS = orderService.selectOrderIdByOrderIdAndCompanyId(childOrderPO.getParentOrderId(), userOrderDTO.getCompanyId());
            if (orderCompanyBindPOS == null || orderCompanyBindPOS.size() == 0) {
                return AjaxVO.returnFailMsg("该订单不属于该网点");
            }
        }
        List<ChildOrderPO> childOrderPOS = orderService.selectChildOrderByCreteUserAndStatusAndOrderId(childOrderPO.getParentOrderId(), Integer.valueOf(ChildOrderEnum.CHILDORDERPROCEED.getCode()),userOrderDTO.getUserPhone());
        if(!(childOrderPOS == null || childOrderPOS.size() == 0)){
            return AjaxVO.returnFailMsg("用户已提交当前订单");
        }
        if(!orderPO.getOrderStatus().toString().equals(OrderEnum.ORDERPROCEED.getCode())){
            return AjaxVO.returnSuccMsg("当前订单不可填写");
        }
        orderService.updateSubtractNum(childOrderPO.getParentOrderId());
        childOrderPO.setUserName(userOrderDTO.getUserName());
        childOrderPO.setUserIdcode(userOrderDTO.getUserIdCode());
        childOrderPO.setUserPhone(userOrderDTO.getUserPhone());
        childOrderPO.setChildOrderRemake(orderPO.getOrderRemake());
        childOrderPO.setOrderPromulgator(orderPO.getOrderPromulgator());
        childOrderPO.setChildOrderStatus(Integer.valueOf(ChildOrderEnum.CHILDORDERPROCEED.getCode()));
        childOrderPO.setChildOrderNo(WsStringUtils.createOrderNo());
        childOrderPO.setParentOrderName(orderPO.getOrderName());
        childOrderPO.setChildOrderCompanyId(userOrderDTO.getCompanyId());
        childOrderPO.setOrderIdcodeIndex(orderPO.getOrderIdcodeIndex());
        Long childOrderId = orderService.insertChildOrder(childOrderPO);
        ChildOrderHandleService.setChildOrderHandle(childOrderPO.getParentOrderId(),childOrderId);
        AjaxVO ajaxVO = AjaxVO.newAjax();
        ajaxVO.putData("childOrderId",childOrderId);
        return ajaxVO;
    }


    @RequestMapping(value = "updateChildOrderRemake")
    @ApiOperation(value = "用户填写订单",httpMethod = "POST")
    @Transactional(rollbackFor = RuntimeException.class)
    public synchronized AjaxVO updateChildOrderRemake(@RequestBody Map<Long,String> map){
        if(map.isEmpty()){
            return AjaxVO.returnFailMsg("传入信息为空");
        }
        Set<Map.Entry<Long,String>> set = map.entrySet();
        Iterator<Map.Entry<Long,String>> iterator = set.iterator();
        Map.Entry<Long,String> entry = null;
        ChildOrderPO childOrderPO = null;
        OrderPO orderPO = null;
        Map<Long,String> errorMap = new HashMap<>();
        while (iterator.hasNext()){
            entry = iterator.next();
            childOrderPO = orderService.selectChildOrderById(entry.getKey());
            if(childOrderPO != null && childOrderPO.getChildOrderStatus().toString().equals(ChildOrderEnum.CHILDORDERPROCEED.getCode())){
                if(childOrderPO.getChildOrderCreateDate().getTime()-new Date().getTime() > 3600*1000*2l){
                    orderService.updateChildOrderStatusById(childOrderPO.getId(),Integer.valueOf(ChildOrderEnum.CHILDORDEROVERTIME.getCode()));
                    orderService.updateChildOrOrderByChildFailedRemake(childOrderPO.getId(),"订单超时");
                    orderService.updateAddtractNum(childOrderPO.getParentOrderId());
                    errorMap.put(entry.getKey(),"订单超时");
                }
                orderPO = orderService.selectOrderByIdQ(childOrderPO.getParentOrderId());
                if(orderPO != null && orderPO.getOrderStatus().toString().equals(OrderEnum.ORDERPROCEED.getCode())){
                    orderService.updateChildOrderStatusById(childOrderPO.getId(),Integer.valueOf(ChildOrderEnum.CHILDORDERFINASH.getCode()));
                    orderService.updateChildOrderMsg(childOrderPO.getId(),entry.getValue());
                }else {
                    errorMap.put(entry.getKey(),"填写错误");
                }
            }else {
                errorMap.put(entry.getKey(),"添加失败");
                if(childOrderPO != null){
                    Integer code = childOrderPO.getChildOrderStatus();
                    ChildOrderEnum orderEnums[] = ChildOrderEnum.values();
                    if(orderEnums != null){
                        for (ChildOrderEnum orderEnum:orderEnums) {
                            if(code.toString().equals(orderEnum.getCode())){
                                errorMap.put(entry.getKey(),orderEnum.getLabel());
                                break;
                            }

                        }

                    }


                }else {
                    errorMap.put(entry.getKey(),"订单不存在");
                }

            }

        }
        AjaxVO ajaxVO = AjaxVO.newAjax();
        ajaxVO.putData("error",errorMap);
        return ajaxVO;
    }


    @RequestMapping("userRemoveChildOrder")
    @ApiOperation(value = "用户取消子订单",httpMethod = "POST")
    @Transactional(rollbackFor = RuntimeException.class)
    public synchronized AjaxVO userRemoveChildOrder(@RequestBody UserRemoveChildOrderSearch userRemoveChildOrderSearch){
        HttpSession session = this.getHttpSession();
        UserOrderDTO userOrderDTO = (UserOrderDTO)session.getAttribute(SystemConstants.USERMSG);
        if(userOrderDTO == null){
            return AjaxVO.returnFailMsg("当前用户信息为空");
        }
        if(userRemoveChildOrderSearch.childOrderId == null){
            return AjaxVO.returnFailMsg("订单ID为空");
        }
        ChildOrderPO childOrderPO = orderService.selectChildOrderById(userRemoveChildOrderSearch.childOrderId);
        if(childOrderPO == null){
            return AjaxVO.returnFailMsg("订单不存在");
        }
        if(!childOrderPO.getUserPhone().equals(userOrderDTO.getUserPhone())){
            return AjaxVO.returnFailMsg("此订单不属于当前用户");
        }
        if(!childOrderPO.getChildOrderStatus().toString().equals(ChildOrderEnum.CHILDORDERPROCEED.getCode())) {
            return AjaxVO.returnFailMsg("订单状态不允许删除");
        }
        OrderPO orderPO = orderService.selectOrderByIdQ(childOrderPO.getParentOrderId());
        if(!orderPO.getOrderStatus().toString().equals(OrderEnum.ORDERPROCEED.getCode())){
            return AjaxVO.returnSuccMsg("当前订单不可填写");
        }
        orderService.updateChildOrderStatusById(userRemoveChildOrderSearch.childOrderId,Integer.valueOf(OrderEnum.ORDERREMOVE.getCode()));
        orderService.updateAddtractNum(orderPO.getId());
        return AjaxVO.returnSuccMsg("取消成功");
    }



    @RequestMapping("userRemoveChildOrderByOrderId")
    @ApiOperation(value = "用户取消子订单通过总订单",httpMethod = "POST")
    @Transactional(rollbackFor = RuntimeException.class)
    public synchronized AjaxVO userRemoveChildOrderByOrderId(@RequestBody UserRemoveChildOrderByOrderIdSearch userRemoveChildOrderByOrderIdSearch){
        HttpSession session = this.getHttpSession();
        UserOrderDTO userOrderDTO = (UserOrderDTO)session.getAttribute(SystemConstants.USERMSG);
        if(userOrderDTO == null){
            return AjaxVO.returnFailMsg("当前用户信息为空");
        }
        if(userRemoveChildOrderByOrderIdSearch.orderId == null){
            return AjaxVO.returnFailMsg("订单ID为空");
        }
        OrderPO orderPO = orderService.selectOrderByIdQ(userRemoveChildOrderByOrderIdSearch.orderId);
        if(orderPO == null){
            return AjaxVO.returnFailMsg("订单不存在");
        }
        if(!orderPO.getOrderStatus().toString().equals(OrderEnum.ORDERPROCEED.getCode())){
            return AjaxVO.returnSuccMsg("当前订单不可填写");
        }
        List<ChildOrderPO> childOrderPOS = orderService.selectChildOrderByCompanyIdAndStatus(userOrderDTO.getCompanyId(),userOrderDTO.getUserPhone(),Integer.valueOf(ChildOrderEnum.CHILDORDERPROCEED.getCode()));
        if(childOrderPOS == null || childOrderPOS.size() == 0){
            return AjaxVO.returnSuccMsg("取消成功");
        }

        for(ChildOrderPO childOrderPO:childOrderPOS){

            if(childOrderPO.getParentOrderId().equals(orderPO.getId())){
                if(!childOrderPO.getUserPhone().equals(userOrderDTO.getUserPhone())){
                    return AjaxVO.returnFailMsg("此订单不属于当前用户");
                }
                if(!childOrderPO.getChildOrderStatus().toString().equals(ChildOrderEnum.CHILDORDERPROCEED.getCode())) {
                    return AjaxVO.returnFailMsg("订单状态不允许删除");
                }
                orderService.updateChildOrderStatusById(childOrderPO.getId(),Integer.valueOf(OrderEnum.ORDERREMOVE.getCode()));
                orderService.updateAddtractNum(orderPO.getId());
            }


        }
        return AjaxVO.returnSuccMsg("取消成功");
    }




    @RequestMapping(value = "merchantAgreeChildOrder")
    @ApiOperation(value = "商家审核同意该订单",httpMethod = "POST")
    @MyLog(name = "商家同意该订单")
    @Transactional(rollbackFor = RuntimeException.class)
    @Authority(companyName = "merchantAgreeChildOrderSearch.companyId",auto = true)
    public synchronized AjaxVO merchantAgreeChildOrder(@RequestBody MerchantAgreeChildOrderSearch merchantAgreeChildOrderSearch){
        if(merchantAgreeChildOrderSearch.childOrderId == null){
            return AjaxVO.returnFailMsg("订单信息为空");
        }
        ChildOrderPO childOrderPO = orderService.selectChildOrderById(merchantAgreeChildOrderSearch.childOrderId);
        if(childOrderPO == null){
            return AjaxVO.returnFailMsg("订单不存在");
        }
        if(!childOrderPO.getChildOrderCompanyId().equals(merchantAgreeChildOrderSearch.companyId)){
            return AjaxVO.returnFailMsg("订单与商家不一致");
        }
        if(!childOrderPO.getChildOrderStatus().toString().equals(ChildOrderEnum.CHILDORDERFINASH.getCode())){
            return AjaxVO.returnFailMsg("订单状态错误");
        }
        OrderPO orderPO = orderService.selectOrderByIdQ(childOrderPO.getParentOrderId());
        if(!orderPO.getOrderStatus().toString().equals(OrderEnum.ORDERPROCEED.getCode())){
            return AjaxVO.returnFailMsg("当前订单不可填写");
        }
        orderService.updateChildOrderPrice(childOrderPO.getId(),orderPO.getOrderPrice(),orderPO.getOrderAgencyPrice());
        orderService.updateChildOrderStatusById(merchantAgreeChildOrderSearch.childOrderId,Integer.valueOf(ChildOrderEnum.CHILDORDERMERCHANTAUDIT.getCode()));
        UserPO userPO = getUser();
        orderService.updateChildOrderUserAndDate(childOrderPO.getId(),userPO.getId(),new Date());
        MySearchList mySearchList = new MySearchList();
        mySearchList.add("userPhone", JpaDataHandle.Operator.EQ,childOrderPO.getUserPhone());
        mySearchList.add("companyId", JpaDataHandle.Operator.EQ,childOrderPO.getChildOrderCompanyId());
        mySearchList.add("createDate", JpaDataHandle.Operator.EQ,WsStringUtils.dateToString(childOrderPO.getChildOrderCreateDate(),WsStringUtils.SMALLTIMESTRING));
        List<CompanyReceptionPO> companyReceptionPOS = drawingsService.selectCompanyReceptionAll(mySearchList);
        if(companyReceptionPOS == null || companyReceptionPOS.isEmpty()){
            CompanyPO companyPO = companyService.selectCompanyById(childOrderPO.getChildOrderCompanyId());
            if(!(companyPO == null|| companyPO.getType().toString().equals(CompanyEnum.AGENT.getCode()))){

                MySearchList mySearchList1 = new MySearchList();
                mySearchList1.add("drawCreateDate", JpaDataHandle.Operator.EQ,WsStringUtils.dateToString(childOrderPO.getChildOrderCreateDate(),WsStringUtils.SMALLTIMESTRING));
                mySearchList1.add("drawType", JpaDataHandle.Operator.EQ,DrawingsEnum.CLAIM.getCode());
                mySearchList1.add("drawCompanyId", JpaDataHandle.Operator.EQ,companyPO.getId());
                List<DrawingsPO> drawingsPOS = drawingsService.selectDrawingsAll(mySearchList1);
                Long drawingsId = null;
                if(drawingsPOS == null || drawingsPOS.size() == 0){
                    DrawingsPO drawingsPO = new DrawingsPO();
                    Calendar calendar = Calendar.getInstance();
                    calendar.setTime(childOrderPO.getChildOrderCreateDate());
                    calendar.set(Calendar.SECOND,0);
                    calendar.set(Calendar.MINUTE,0);
                    calendar.set(Calendar.HOUR_OF_DAY,0);
                    drawingsPO.setDrawCreateDate(calendar.getTime());
                    drawingsPO.setDrawType(Integer.parseInt(DrawingsEnum.CLAIM.getCode()));
                    drawingsPO.setDrawCompanyId(companyPO.getId());
                    drawingsPO.setDrawStatus(Integer.parseInt(DrawingsEnum.DRAWINGSDELETE.getCode()));
                    drawingsPO.setDrawAgencyPrice(0d);
                    drawingsPO.setDrawUserPrice(0d);
                    drawingsPO.setDrawPrice(0d);
                    drawingsPO.setDrawName(WsStringUtils.dateToString(calendar.getTime(),WsStringUtils.CNSMALLTIMESTRING)+companyPO.getName()+"报销单");
                    drawingsId = drawingsService.insertDrawings(drawingsPO);
                }else {
                    drawingsId = drawingsPOS.get(0).getId();
                }

                if(drawingsId != null){
                    CompanyReceptionPO companyReceptionPO = new CompanyReceptionPO();
                    companyReceptionPO.setUserName(childOrderPO.getUserName());
                    companyReceptionPO.setUserPhone(childOrderPO.getUserPhone());
                    companyReceptionPO.setCreateDate(childOrderPO.getChildOrderCreateDate());
                    companyReceptionPO.setCompanyId(childOrderPO.getChildOrderCompanyId());
                    companyReceptionPO.setDrawingsId(drawingsId);
                    drawingsService.insertCompanyReception(companyReceptionPO);
                }


            }
        }
        return AjaxVO.returnSuccMsg("审核成功");

    }

    @RequestMapping(value = "merchantAgreeChildOrders")
    @ApiOperation(value = "商家批量审核同意该订单",httpMethod = "POST")
    @MyLog(name = "商家批量同意该订单")
    @Authority(companyName = "merchantAgreeChildOrdersSearch.companyId",auto = true)
    @Transactional(rollbackFor = RuntimeException.class)
    public AjaxVO merchantAgreeChildOrders(@RequestBody MerchantAgreeChildOrdersSearch merchantAgreeChildOrdersSearch){
        if(merchantAgreeChildOrdersSearch.childOrderIds == null || merchantAgreeChildOrdersSearch.childOrderIds.length == 0){
            return AjaxVO.returnFailMsg("订单信息为空");
        }
        MerchantAgreeChildOrderSearch merchantAgreeChildOrderSearch = null;
        for(int i = 0; i < merchantAgreeChildOrdersSearch.childOrderIds.length; i++){
            merchantAgreeChildOrderSearch = new MerchantAgreeChildOrderSearch();
            merchantAgreeChildOrderSearch.setChildOrderId(merchantAgreeChildOrdersSearch.childOrderIds[i]);
            merchantAgreeChildOrderSearch.setCompanyId(merchantAgreeChildOrdersSearch.companyId);
            AjaxVO ajaxVO = this.merchantAgreeChildOrder(merchantAgreeChildOrderSearch);
            if(ajaxVO.getFlag() != AjaxFlag.SUCC.code()){
                throw new RuntimeException("订单错误");
            }
        }
        return AjaxVO.returnSuccMsg("批量审核成功");


    }



    @RequestMapping(value = "merchantRefuseChildOrder")
    @ApiOperation(value = "商家审核拒绝该订单",httpMethod = "POST")
    @MyLog(name = "商家拒绝该订单")
    @Transactional(rollbackFor = RuntimeException.class)
    @Authority(companyName = "merchantRefuseChildOrderSearch.companyId",auto = true)
    public synchronized AjaxVO merchantRefuseChildOrder(@RequestBody MerchantRefuseChildOrderSearch merchantRefuseChildOrderSearch){
        if(merchantRefuseChildOrderSearch.childOrderId == null){
            return AjaxVO.returnFailMsg("订单信息为空");
        }
        if(StringUtils.isEmpty(merchantRefuseChildOrderSearch.msg)){
            return AjaxVO.returnFailMsg("商家拒绝理由为空");
        }
        if(merchantRefuseChildOrderSearch.companyId == null){
            return AjaxVO.returnFailMsg("传入商家信息为空");
        }
        ChildOrderPO childOrderPO = orderService.selectChildOrderById(merchantRefuseChildOrderSearch.childOrderId);
        if(childOrderPO == null){
            return AjaxVO.returnFailMsg("订单不存在");
        }
        if(!childOrderPO.getChildOrderCompanyId().equals(merchantRefuseChildOrderSearch.companyId)){
            return AjaxVO.returnFailMsg("订单与商家不一致");
        }
        if(!childOrderPO.getChildOrderStatus().toString().equals(ChildOrderEnum.CHILDORDERFINASH.getCode())){
            return AjaxVO.returnFailMsg("订单状态错误");
        }
        OrderPO orderPO = orderService.selectOrderByIdQ(childOrderPO.getParentOrderId());
        if(!orderPO.getOrderStatus().toString().equals(OrderEnum.ORDERPROCEED.getCode())&&!orderPO.getOrderStatus().toString().equals(OrderEnum.ORDERAUDIT.getCode())){
            return AjaxVO.returnFailMsg("当前订单不可填写");
        }
        orderService.updateChildOrderStatusById(merchantRefuseChildOrderSearch.childOrderId,Integer.valueOf(ChildOrderEnum.CHILDORDISDERQUALIFIED.getCode()));
        orderService.updateChildOrOrderByChildFailedRemake(childOrderPO.getId(),merchantRefuseChildOrderSearch.msg);
        orderService.updateAddtractNum(childOrderPO.getParentOrderId());
        UserPO userPO = getUser();
        orderService.updateChildOrderUserAndDate(childOrderPO.getId(),userPO.getId(),new Date());
        return AjaxVO.returnSuccMsg("审核成功");

    }


    @RequestMapping(value = "merchantRefuseChildOrders")
    @ApiOperation(value = "商家批量审核拒绝该订单",httpMethod = "POST")
    @MyLog(name = "商家批量拒绝该订单")
    //@Authority(companyName = "merchantRefuseChildOrdersSearch.companyId",auto = true)
    @Transactional(rollbackFor = RuntimeException.class)
    public AjaxVO merchantRefuseChildOrders(@RequestBody MerchantRefuseChildOrdersSearch merchantRefuseChildOrdersSearch){
        if(merchantRefuseChildOrdersSearch.childOrderIds == null || merchantRefuseChildOrdersSearch.childOrderIds.length == 0){
            return AjaxVO.returnFailMsg("订单信息为空");
        }
        if(StringUtils.isEmpty(merchantRefuseChildOrdersSearch.msg)){
            return AjaxVO.returnFailMsg("提交信息为空");
        }
        MerchantRefuseChildOrderSearch merchantRefuseChildOrderSearch = null;
        for(int i = 0; i < merchantRefuseChildOrdersSearch.childOrderIds.length; i++){
            merchantRefuseChildOrderSearch = new MerchantRefuseChildOrderSearch();
            merchantRefuseChildOrderSearch.setChildOrderId(merchantRefuseChildOrdersSearch.childOrderIds[i]);
            merchantRefuseChildOrderSearch.setCompanyId(merchantRefuseChildOrdersSearch.companyId);
            merchantRefuseChildOrderSearch.setMsg(merchantRefuseChildOrdersSearch.msg);
            AjaxVO ajaxVO = this.merchantRefuseChildOrder(merchantRefuseChildOrderSearch);
            if(ajaxVO.getFlag() != AjaxFlag.SUCC.code()){
                throw new RuntimeException("订单错误");
            }
        }
        return AjaxVO.returnSuccMsg("批量审核成功");


    }



    @RequestMapping(value = "platformAgreeChildOrder")
    @ApiOperation(value = "平台审核同意该订单",httpMethod = "POST")
    @MyLog(name = "平台同意该订单")
    @Transactional(rollbackFor = RuntimeException.class)
    @Authority(onlyAllowAdmin = true)
    public synchronized AjaxVO platformAgreeChildOrder(@RequestBody PlatformAgreeChildOrderSearch platformAgreeChildOrderSearch){
        if(platformAgreeChildOrderSearch.childOrderId == null){
            return AjaxVO.returnFailMsg("订单信息为空");
        }
        ChildOrderPO childOrderPO = orderService.selectChildOrderById(platformAgreeChildOrderSearch.childOrderId);
        if(childOrderPO == null){
            return AjaxVO.returnFailMsg("订单不存在");
        }
        if(!childOrderPO.getChildOrderStatus().toString().equals(ChildOrderEnum.CHILDORDERMERCHANTAUDIT.getCode())){
            return AjaxVO.returnFailMsg("订单状态错误");
        }
        OrderPO orderPO = orderService.selectOrderByIdQ(childOrderPO.getParentOrderId());
        if(!orderPO.getOrderStatus().toString().equals(OrderEnum.ORDERAUDIT.getCode())){
            return AjaxVO.returnFailMsg("当前订单不允许审核");
        }
        orderService.updateChildOrderStatusById(platformAgreeChildOrderSearch.childOrderId,Integer.valueOf(ChildOrderEnum.CHILDORDERQUALIFIED.getCode()));

        //Double realPrice = orderPO.getOrderPrice()*orderPO.getOrderRealNum();
        orderService.updateOrderRealPriceById(orderPO.getId());
        UserPO userPO = getUser();
        orderService.updateChildOrderUserAndDate(childOrderPO.getId(),userPO.getId(),new Date());

        FinishOrderSearch finishOrderSearch = new FinishOrderSearch();
        finishOrderSearch.setOrderId(orderPO.getId());
        this.finishOrder(finishOrderSearch);
        return AjaxVO.returnSuccMsg("审核成功");

    }



    @RequestMapping(value = "platformAgreeChildOrders")
    @ApiOperation(value = "平台批量审核同意该订单",httpMethod = "POST")
    @MyLog(name = "平台批量同意该订单")
    @Transactional(rollbackFor = RuntimeException.class)
    @Authority(onlyAllowAdmin = true)
    public AjaxVO platformAgreeChildOrders(@RequestBody PlatformAgreeChildOrdersSearch platformAgreeChildOrdersSearch){
        if(platformAgreeChildOrdersSearch.childOrderIds == null || platformAgreeChildOrdersSearch.childOrderIds.length == 0){
            return AjaxVO.returnFailMsg("订单信息为空");
        }
        PlatformAgreeChildOrderSearch platformAgreeChildOrderSearch = null;
        for(int i = 0; i < platformAgreeChildOrdersSearch.childOrderIds.length; i++){
            platformAgreeChildOrderSearch = new PlatformAgreeChildOrderSearch();
            platformAgreeChildOrderSearch.setChildOrderId(platformAgreeChildOrdersSearch.childOrderIds[i]);
            AjaxVO ajaxVO = this.platformAgreeChildOrder(platformAgreeChildOrderSearch);
            if(ajaxVO.getFlag() != AjaxFlag.SUCC.code()){
                throw new RuntimeException("订单错误");
            }
        }
        return AjaxVO.returnSuccMsg("修改成功");
    }





    @RequestMapping(value = "platformRefuseChildOrder")
    @ApiOperation(value = "平台审核拒绝该订单",httpMethod = "POST")
    @MyLog(name = "平台拒绝该订单")
    @Transactional(rollbackFor = RuntimeException.class)
    @Authority(onlyAllowAdmin = true)
    public synchronized AjaxVO platformRefuseChildOrder(@RequestBody PlatformRefuseChildOrderSearch platformRefuseChildOrderSearch){
        if(platformRefuseChildOrderSearch.childOrderId == null){
            return AjaxVO.returnFailMsg("订单信息为空");
        }
        ChildOrderPO childOrderPO = orderService.selectChildOrderById(platformRefuseChildOrderSearch.childOrderId);
        if(childOrderPO == null){
            return AjaxVO.returnFailMsg("订单不存在");
        }
        if(!childOrderPO.getChildOrderStatus().toString().equals(ChildOrderEnum.CHILDORDERMERCHANTAUDIT.getCode())){
            return AjaxVO.returnFailMsg("订单状态错误");
        }
        if(StringUtils.isEmpty(platformRefuseChildOrderSearch.msg)){
            return AjaxVO.returnFailMsg("订单错误信息为空");
        }
        OrderPO orderPO = orderService.selectOrderByIdQ(childOrderPO.getParentOrderId());
        if(!orderPO.getOrderStatus().toString().equals(OrderEnum.ORDERAUDIT.getCode())){
            return AjaxVO.returnFailMsg("当前订单不允许审核");
        }
        orderService.updateChildOrderStatusById(platformRefuseChildOrderSearch.childOrderId,Integer.valueOf(ChildOrderEnum.CHILDORDERPLATFORMAUDITFAIL.getCode()));
        orderService.updateAddtractNum(childOrderPO.getParentOrderId());
        orderService.updateChildOrOrderByChildFailedRemake(childOrderPO.getId(),platformRefuseChildOrderSearch.msg);
        UserPO userPO = getUser();
        orderService.updateChildOrderUserAndDate(childOrderPO.getId(),userPO.getId(),new Date());
        FinishOrderSearch finishOrderSearch = new FinishOrderSearch();
        finishOrderSearch.setOrderId(childOrderPO.getParentOrderId());
        this.finishOrder(finishOrderSearch);
        return AjaxVO.returnSuccMsg("审核成功");

    }


    @RequestMapping(value = "platformRefuseChildOrders")
    @ApiOperation(value = "平台批量审核拒绝该订单",httpMethod = "POST")
    @MyLog(name = "平台批量拒绝该订单")
    @Transactional(rollbackFor = RuntimeException.class)
    @Authority(onlyAllowAdmin = true)
    public AjaxVO platformRefuseChildOrders(@RequestBody PlatformRefuseChildOrdersSearch platformRefuseChildOrdersSearch){
        if(platformRefuseChildOrdersSearch.childOrderIds == null || platformRefuseChildOrdersSearch.childOrderIds.length == 0){
            return AjaxVO.returnFailMsg("订单信息为空");
        }
        if(StringUtils.isEmpty(platformRefuseChildOrdersSearch.msg)){
            return AjaxVO.returnFailMsg("拒绝信息为空");
        }
        PlatformRefuseChildOrderSearch platformRefuseChildOrderSearch = null;
        for(int i = 0; i < platformRefuseChildOrdersSearch.childOrderIds.length; i++){
            platformRefuseChildOrderSearch = new PlatformRefuseChildOrderSearch();
            platformRefuseChildOrderSearch.setChildOrderId(platformRefuseChildOrdersSearch.childOrderIds[i]);
            platformRefuseChildOrderSearch.setMsg(platformRefuseChildOrdersSearch.msg);
            AjaxVO ajaxVO = this.platformRefuseChildOrder(platformRefuseChildOrderSearch);
            if(ajaxVO.getFlag() != AjaxFlag.SUCC.code()){
                throw new RuntimeException("订单错误");
            }
        }
        return AjaxVO.returnSuccMsg("修改成功");
    }



    @RequestMapping(value = "reviewChildOrder")
    @ApiOperation(value = "平台撤销操作",httpMethod = "POST")
    @Transactional(rollbackFor = RuntimeException.class)
    @Authority(onlyAllowAdmin = true)
    public synchronized AjaxVO reviewChildOrder(@RequestBody ReviewChildOrderSearch reviewChildOrderSearch){
        if(reviewChildOrderSearch.orderId == null){
            return AjaxVO.returnFailMsg("订单ID为空");
        }
        UserPO userPO = getUser();
        ChildOrderPO childOrderPO = orderService.selectChildOrderById(reviewChildOrderSearch.orderId);
        if(childOrderPO.getChildOrderStatus().toString().equals(ChildOrderEnum.CHILDORDERQUALIFIED.getCode())){
            ChildOrderPO newChildOrderPO = new ChildOrderPO();
            newChildOrderPO.setId(childOrderPO.getId());
            newChildOrderPO.setChildOrderStatus(Integer.valueOf(ChildOrderEnum.CHILDORDERMERCHANTAUDIT.getCode()));
            newChildOrderPO.setChildOrderUpdateUser(userPO.getId());
            newChildOrderPO.setChildOrderUpdateDate(new Date());
            orderService.updateChildOrder(newChildOrderPO);
            OrderPO orderPO = orderService.selectOrderByIdQ(childOrderPO.getParentOrderId());
            if(orderPO.getOrderStatus().toString().equals(OrderEnum.ORDERFINISH.getCode())){
                OrderPO newOrderPO = new OrderPO();
                newOrderPO.setId(orderPO.getId());
                newOrderPO.setOrderStatus(Integer.valueOf(OrderEnum.ORDERAUDIT.getCode()));
                newOrderPO.setOrderRealPrice(0d);
                newOrderPO.setOrderAgencyAllPrice(0d);
                orderService.updateOrder(newOrderPO);
            }
            return AjaxVO.returnSuccMsg("撤销成功");
        }else if(childOrderPO.getChildOrderStatus().toString().equals(ChildOrderEnum.CHILDORDERPLATFORMAUDITFAIL.getCode())){
            OrderPO orderPO = orderService.selectOrderByIdQ(childOrderPO.getParentOrderId());
            if(orderPO.getOrderNum() > 0){
                orderService.updateAddtractNum(orderPO.getId());
                ChildOrderPO newChildOrderPO = new ChildOrderPO();
                newChildOrderPO.setId(childOrderPO.getId());
                newChildOrderPO.setChildOrderStatus(Integer.valueOf(ChildOrderEnum.CHILDORDERMERCHANTAUDIT.getCode()));
                newChildOrderPO.setChildFailedRemake("");
                newChildOrderPO.setChildOrderUpdateUser(userPO.getId());
                newChildOrderPO.setChildOrderUpdateDate(new Date());
                orderService.updateChildOrder(newChildOrderPO);
                if(orderPO.getOrderStatus().toString().equals(OrderEnum.ORDERFINISH.getCode())){
                    OrderPO newOrderPO = new OrderPO();
                    newOrderPO.setId(orderPO.getId());
                    newOrderPO.setOrderStatus(Integer.valueOf(OrderEnum.ORDERAUDIT.getCode()));
                    newOrderPO.setOrderRealPrice(0d);
                    newOrderPO.setOrderAgencyAllPrice(0d);
                    orderService.updateOrder(newOrderPO);
                }
                return AjaxVO.returnSuccMsg("撤销成功");
            }else {
                return AjaxVO.returnFailMsg("订单总量不足，无法恢复");
            }
        } else {
            return AjaxVO.returnFailMsg("订单状态错误");
        }
    }




    @RequestMapping(value = "merchantReviewChildOrder")
    @ApiOperation(value = "商家撤销操作",httpMethod = "POST")
    @Transactional(rollbackFor = RuntimeException.class)
    @Authority(companyName = "merchantReviewChildOrderSearch.companyId")
    public synchronized AjaxVO merchantReviewChildOrder(@RequestBody MerchantReviewChildOrderSearch merchantReviewChildOrderSearch){
        if(merchantReviewChildOrderSearch.orderId == null){
            return AjaxVO.returnFailMsg("订单ID为空");
        }
        if(merchantReviewChildOrderSearch.companyId == null){
            return AjaxVO.returnFailMsg("商家为空");
        }
        UserPO userPO = getUser();
        ChildOrderPO childOrderPO = orderService.selectChildOrderById(merchantReviewChildOrderSearch.orderId);
        if(!childOrderPO.getChildOrderCompanyId().equals(merchantReviewChildOrderSearch.companyId)){
            return AjaxVO.returnFailMsg("商家ID错误");
        }
        if(childOrderPO.getChildOrderStatus().toString().equals(ChildOrderEnum.CHILDORDERMERCHANTAUDIT.getCode())){
            ChildOrderPO newChildOrderPO = new ChildOrderPO();
            newChildOrderPO.setId(childOrderPO.getId());
            newChildOrderPO.setChildOrderStatus(Integer.valueOf(ChildOrderEnum.CHILDORDERFINASH.getCode()));
            newChildOrderPO.setChildOrderUpdateUser(userPO.getId());
            newChildOrderPO.setChildOrderUpdateDate(new Date());
            newChildOrderPO.setOrderRealPrice(0d);
            newChildOrderPO.setOrderAgencyPrice(0d);
            orderService.updateChildOrder(newChildOrderPO);
            return AjaxVO.returnSuccMsg("撤销成功");
        }else if(childOrderPO.getChildOrderStatus().toString().equals(ChildOrderEnum.CHILDORDISDERQUALIFIED.getCode())){
            OrderPO orderPO = orderService.selectOrderByIdQ(childOrderPO.getParentOrderId());
            if(orderPO.getOrderNum() > 0){
                if(orderPO.getOrderStatus().toString().equals(OrderEnum.ORDERPROCEED.getCode())){
                    orderService.updateAddtractNum(orderPO.getId());
                    ChildOrderPO newChildOrderPO = new ChildOrderPO();
                    newChildOrderPO.setId(childOrderPO.getId());
                    newChildOrderPO.setChildOrderStatus(Integer.valueOf(ChildOrderEnum.CHILDORDERFINASH.getCode()));
                    newChildOrderPO.setChildFailedRemake("");
                    newChildOrderPO.setChildOrderUpdateUser(userPO.getId());
                    newChildOrderPO.setChildOrderUpdateDate(new Date());
                    orderService.updateChildOrder(newChildOrderPO);
                    return AjaxVO.returnSuccMsg("撤销成功");
                }else {
                    return AjaxVO.returnFailMsg("当前订单已经结束");
                }
            }else {
                return AjaxVO.returnFailMsg("订单总量不足，无法恢复");
            }
        } else {
            return AjaxVO.returnFailMsg("订单状态错误");
        }
    }




    @RequestMapping(value = "userOwnedOrder")
    @ApiOperation(value = "用户已加载过的订单",httpMethod = "POST")
    public AjaxVO userOwnedOrder(){
        HttpSession session = this.getHttpSession();
        UserOrderDTO userOrderDTO = (UserOrderDTO)session.getAttribute(SystemConstants.USERMSG);
        if(userOrderDTO == null){
            return AjaxVO.returnFailMsg("用户信息为空");
        }
        List<ChildOrderPO> childOrderPOS = orderService.selectChildOrderByCompanyIdAndStatus(userOrderDTO.getCompanyId(),userOrderDTO.getUserPhone(),Integer.valueOf(ChildOrderEnum.CHILDORDERPROCEED.getCode()));
        List<Map<String,Long>> longList = new ArrayList<>();
        Map<String,Long> map = null;
        for(ChildOrderPO childOrderPO : childOrderPOS){
            if(childOrderPO.getUserPhone().equals(userOrderDTO.getUserPhone())){

                map = new HashMap<>();
                map.put("orderId",childOrderPO.getParentOrderId());
                map.put("childOrderId",childOrderPO.getId());
                longList.add(map);
            }

        }
        AjaxVO ajaxVO = AjaxVO.newAjax();
        ajaxVO.putDataList(longList);
        return ajaxVO;
    }



    @RequestMapping(value = "selectUserChildOrder")
    @ApiOperation(value = "查询用户拥有订单",httpMethod = "POST")
    public AjaxVO selectUserChildOrder(MySearchList mySearchList){
        HttpSession session = getHttpSession();
        UserOrderDTO userRoleDTO = (UserOrderDTO)session.getAttribute(SystemConstants.USERMSG);
        if(userRoleDTO == null){
            return AjaxVO.returnFailMsg("请填写信息");
        }
        mySearchList.remove("userPhone");
        mySearchList.remove("childOrderCompanyId");
        mySearchList.add("childOrderCompanyId", JpaDataHandle.Operator.EQ,userRoleDTO.getCompanyId());
        mySearchList.add("userPhone", JpaDataHandle.Operator.EQ,userRoleDTO.getUserPhone());
        mySearchList.add("childOrderStatus", JpaDataHandle.Operator.NE,Integer.valueOf(ChildOrderEnum.CHILDORDERDELETE.getCode()));
        PageInfo<ChildOrderPO> childOrderPOPageInfo = orderService.selectChildOrder(mySearchList,mySearchList.getPageVO());



        AjaxVO ajaxVO = AjaxVO.newAjax();
        ajaxVO.putDataList(childOrderPOPageInfo);
        return ajaxVO;
    }


    @RequestMapping(value = "selectChildOrderCountGroup")
    @ApiOperation(value = "查询订单数量",httpMethod = "POST")
    @Authority(companyName = "mySearchList.childOrderCompanyId",auto = true)
    public AjaxVO selectChildOrderCountGroup(MySearchList mySearchList){
        MySearch mySearch = mySearchList.get("childOrderStatus");
        if(mySearch == null) {
            return AjaxVO.returnFailMsg("状态信息为空");
        }
        if(mySearch.getValue() == null){
            return AjaxVO.returnFailMsg("状态信息值为空");
        }
        if(!(mySearch.getValue().getClass().isArray()||mySearch.getValue() instanceof List)){
            return AjaxVO.returnFailMsg("状态信息必须为数组类型");
        }
        Map map = mySearchList.createMybaitsMapNoPage();
        List<ReturnKeyValueVO> returnKeyValueVOS = orderService.selectChildOrderCountGroup(map);
        AjaxVO ajaxVO = AjaxVO.newAjax();
        ajaxVO.putDataList(returnKeyValueVOS);
        return ajaxVO;

    }




    @RequestMapping(value = "selectChildOrderRealPriceGroup")
    @ApiOperation(value = "查询订单真实收入分组",httpMethod = "POST")
    @Authority(onlyAllowAdmin = true)
    public AjaxVO selectChildOrderRealPriceGroup(MySearchList mySearchList){
        MySearch mySearch = mySearchList.get("childOrderStatus");
        if(mySearch == null) {
            return AjaxVO.returnFailMsg("状态信息为空");
        }
        if(mySearch.getValue() == null){
            return AjaxVO.returnFailMsg("状态信息值为空");
        }
        if(!(mySearch.getValue().getClass().isArray()||mySearch.getValue() instanceof List)){
            return AjaxVO.returnFailMsg("状态信息必须为数组类型");
        }
        Map map = mySearchList.createMybaitsMapNoPage();
        List<ReturnKeyValueVO> returnKeyValueVOS = orderService.selectChildOrderRealPriceGroup(map);
        AjaxVO ajaxVO = AjaxVO.newAjax();
        ajaxVO.putDataList(returnKeyValueVOS);
        return ajaxVO;

    }




    @RequestMapping(value = "selectChildOrderAgencyPriceGroup")
    @ApiOperation(value = "查询订单代理价格分组",httpMethod = "POST")
    @Authority(companyName = "mySearchList.childOrderCompanyId",auto = true)
    public AjaxVO selectChildOrderAgencyPriceGroup(MySearchList mySearchList){
        MySearch mySearch = mySearchList.get("childOrderStatus");
        if(mySearch == null) {
            return AjaxVO.returnFailMsg("状态信息为空");
        }
        if(mySearch.getValue() == null){
            return AjaxVO.returnFailMsg("状态信息值为空");
        }
        if(!(mySearch.getValue().getClass().isArray()||mySearch.getValue() instanceof List)){
            return AjaxVO.returnFailMsg("状态信息必须为数组类型");
        }
        Map map = mySearchList.createMybaitsMapNoPage();
        List<ReturnKeyValueVO> returnKeyValueVOS = orderService.selectChildOrderAgencyPriceGroup(map);
        AjaxVO ajaxVO = AjaxVO.newAjax();
        ajaxVO.putDataList(returnKeyValueVOS);
        return ajaxVO;

    }





    @RequestMapping("selectChildOrderRealPrice")
    @ApiOperation(value = "查询总收入",httpMethod = "POST")
    @Authority(companyName = "mySearchList.childOrderCompanyId",auto = true)
    public AjaxVO selectChildOrderRealPrice(MySearchList mySearchList){
        Map map = mySearchList.createMybaitsMapNoPage();
        Double price = orderService.selectChildOrderRealPrice(map);
        AjaxVO ajaxVO = new AjaxVO();
        ajaxVO.putData("price",price);
        return ajaxVO;
    }

    @RequestMapping(value = "selectChildOrderAgencyPrice")
    @ApiOperation(value = "查询代理收入",httpMethod = "POST")
    @Authority(companyName = "mySearchList.childOrderCompanyId",auto = true)
    public AjaxVO selectChildOrderAgencyPrice(MySearchList mySearchList){
        Map map = mySearchList.createMybaitsMapNoPage();
        Double price = orderService.selectChildOrderAgencyPrice(map);
        AjaxVO ajaxVO = new AjaxVO();
        ajaxVO.putData("price",price);
        return ajaxVO;
    }


    @RequestMapping(value = "selectOrderIdByOrderId")
    @ApiOperation(value = "查询订单绑定商家",httpMethod = "POST")
    @Authority(onlyAllowAdmin = true)
    public AjaxVO selectOrderIdByOrderId(@RequestBody SelectOrderIdByOrderIdSearch selectOrderIdByOrderIdSearch){
        if(selectOrderIdByOrderIdSearch.orderId == null){
            return AjaxVO.returnFailMsg("订单ID为空");
        }
        List<OrderCompanyBindPO> orderCompanyBindPOS = orderService.selectOrderIdByOrderId(selectOrderIdByOrderIdSearch.orderId);
        AjaxVO ajaxVO = AjaxVO.newAjax();
        ajaxVO.putDataList(orderCompanyBindPOS);
        return ajaxVO;
    }


    @RequestMapping(value = "createChildOrderExcel")
    @ApiOperation(value = "创建子订单excel表",httpMethod = "POST")
    @Authority(companyName = "mySearchList.childOrderCompanyId")
    public void createChildOrderExcel(MySearchList mySearchList){
        Set<Long> parentOderIdSet = new HashSet<>();
        Map<Long,List<ChildOrderPO>> map = new HashMap<>();
        List<ChildOrderPO> childOrderPOList = null;
        List<ChildOrderPO> childOrderPOS = orderService.selectChildOrderAll(mySearchList);
        for (ChildOrderPO childOrderPO : childOrderPOS) {
            parentOderIdSet.add(childOrderPO.getParentOrderId());
            childOrderPOList = map.get(childOrderPO.getParentOrderId());
            if(childOrderPOList == null){
                childOrderPOList = new ArrayList<>();
                map.put(childOrderPO.getParentOrderId(),childOrderPOList);
            }
            childOrderPOList.add(childOrderPO);
        }
        List<InputStream> inputStreams = new ArrayList<>();
        List<String> fileName = new ArrayList<>();
        Iterator<Long> longIterator = parentOderIdSet.iterator();
        Long parentOrderId = null;
        OrderPO orderPO = null;
        while (longIterator.hasNext()){
            parentOrderId = longIterator.next();
            orderPO = orderService.selectOrderById(parentOrderId);
            if(orderPO != null){
                XSSFWorkbook xssfWorkbook = new XSSFWorkbook();
                XSSFSheet xssfSheet = xssfWorkbook.createSheet(orderPO.getOrderName());
                XSSFRow xssfRow = xssfSheet.createRow(0);
                XSSFCell xssfCell = xssfRow.createCell(0);
                xssfCell.setCellValue("订单编号");
                xssfCell = xssfRow.createCell(1);
                xssfCell.setCellValue("用户名称");
                xssfCell = xssfRow.createCell(2);
                xssfCell.setCellValue("用户联系方式");
                xssfCell = xssfRow.createCell(3);
                xssfCell.setCellValue("用户身份证号码");
                xssfCell = xssfRow.createCell(4);
                xssfCell.setCellValue("其他信息");
                childOrderPOList = map.get(orderPO.getId());
                for(int i = 0; i < childOrderPOList.size(); i++){
                    xssfRow = xssfSheet.createRow(i+1);
                    xssfCell = xssfRow.createCell(0);
                    xssfCell.setCellValue(childOrderPOList.get(i).getChildOrderNo());
                    xssfCell = xssfRow.createCell(1);
                    xssfCell.setCellValue(childOrderPOList.get(i).getUserName());
                    xssfCell = xssfRow.createCell(2);
                    xssfCell.setCellValue(childOrderPOList.get(i).getUserPhone());
                    if(!(childOrderPOList.get(i).getOrderIdcodeIndex() == null || childOrderPOList.get(i).getOrderIdcodeIndex() == 0)){
                        xssfCell = xssfRow.createCell(3);
                        if(childOrderPOList.get(i).getUserIdcode().length() < childOrderPOList.get(i).getOrderIdcodeIndex()){
                            xssfCell.setCellValue(childOrderPOList.get(i).getUserIdcode());
                        }else {
                            xssfCell.setCellValue(childOrderPOList.get(i).getUserIdcode().substring(childOrderPOList.get(i).getUserIdcode().length()-childOrderPOList.get(i).getOrderIdcodeIndex(),childOrderPOList.get(i).getUserIdcode().length()));
                        }

                    }
                    xssfCell = xssfRow.createCell(4);
                    xssfCell.setCellValue(childOrderPOList.get(i).getChildOrderMsg());
                }
                ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();

                try {
                    xssfWorkbook.write(byteArrayOutputStream);
                    byte[] bytes = byteArrayOutputStream.toByteArray();
                    ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bytes);
                    inputStreams.add(byteArrayInputStream);
                    fileName.add(orderPO.getOrderName()+".xlsx");
                }catch (Exception e){
                    e.printStackTrace();
                }finally {
                    try {
                        byteArrayOutputStream.flush();
                        byteArrayOutputStream.close();
                    }catch (Exception e){
                        e.printStackTrace();
                    }

                }


            }
        }


        byte bytes[] = FileUtils.encodeFileToZip(inputStreams.toArray(new InputStream[inputStreams.size()]),fileName.toArray(new String[fileName.size()]));
        HttpServletResponse response = this.getHttpServletResponse();

        response.addHeader("Content-Length", "" + bytes.length);
        OutputStream outputStream = null;
        try{
            response.addHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode("压缩文件.zip.zip","utf-8"));
            outputStream = response.getOutputStream();
            WritableByteChannel writableByteChannel = Channels.newChannel(outputStream);
            ByteBuffer byteBuffer = ByteBuffer.wrap(bytes);
            while (byteBuffer.hasRemaining()){
                writableByteChannel.write(byteBuffer);
            }
            byteBuffer.clear();
            writableByteChannel.close();
            outputStream.flush();
            outputStream.close();
        }catch (Exception e){
            e.printStackTrace();
        }

    }



    @RequestMapping(value = "selectOrderPromulgator")
    @ApiOperation(value = "提供商订单查询",httpMethod = "POST")
    @Authority(onlyAllowAdmin = true)
    public AjaxVO selectOrderPromulgator(MySearchList mySearchList){
        PageInfo<OrderPromulgatorPO> orderPromulgatorPOPageInfo = orderService.selectOrderPromulgator(mySearchList);
        PageInfo<OrderPromulgatorVO> orderPromulgatorVOPageInfo = PageConvertUtil.convertPage(orderPromulgatorPOPageInfo,OrderPromulgatorVO.class);
        Map map = new HashMap();
        Double price = null;
        for(OrderPromulgatorVO orderPromulgatorVO:orderPromulgatorVOPageInfo.getDataList()){
            if(orderPromulgatorVO.getOrderCreateDate() != null){
                orderPromulgatorVO.setOrderCreateDateLabel(WsStringUtils.dateToString(orderPromulgatorVO.getOrderCreateDate(),WsStringUtils.LONGTIMESTRING));
            }
            map.put("orderPromulgator",orderPromulgatorVO.getOrderPromulgatorName());
            map.put("childOrderStatus",new String[]{ChildOrderEnum.CHILDORDERQUALIFIED.getCode()});
            price = orderService.selectChildOrderRealPrice(map);
            orderPromulgatorVO.setPrice(price);
            if(orderPromulgatorVO.getOrderPromulgatorStatus().toString().equals(OrderPromulgatorEnum.ORDERPROMULGATORYJS.getCode())){
                orderPromulgatorVO.setOrderPromulgatorStatusLabel(OrderPromulgatorEnum.ORDERPROMULGATORYJS.getLabel());
            }else {
                orderPromulgatorVO.setOrderPromulgatorStatusLabel(OrderPromulgatorEnum.ORDERPROMULGATORDSH.getLabel());
            }

        }
        AjaxVO ajaxVO = AjaxVO.newAjax();
        ajaxVO.putDataList(orderPromulgatorVOPageInfo);
        return ajaxVO;
    }


    @RequestMapping(value = "selectAgencyPriceLineChart")
    @ApiOperation(value = "查询资金折线图",httpMethod = "POST")
    @Authority(companyName = "mySearchList.childOrderCompanyId",auto = true)
    public AjaxVO selectAgencyPriceLineChart(MySearchList mySearchList){
        MySearch startTimeMysearch = mySearchList.remove("startTime");
        MySearch endTimeMysearch = mySearchList.remove("endTime");
        Calendar calendar = Calendar.getInstance();
        List<String> allDateStringList = new ArrayList<>();
        dataDay(mySearchList, startTimeMysearch, endTimeMysearch, calendar, allDateStringList);

        mySearchList.remove("childOrderStatus");
        mySearchList.add("childOrderStatus", JpaDataHandle.Operator.IN,new String[]{ChildOrderEnum.CHILDORDERQUALIFIED.getCode()});
        List<ReturnKeyValueVO> returnKeyValueVOS = orderService.selectChildOrderAgencyPriceGroup(mySearchList.createMybaitsMapNoPage());
        Map<String,String> realPriceMap = new HashMap<>();
        for(ReturnKeyValueVO returnKeyValueVO : returnKeyValueVOS){
            realPriceMap.put(returnKeyValueVO.getDatevalue(),returnKeyValueVO.getDatavalue());
        }
        returnKeyValueVOS.clear();
        mySearchList.remove("childOrderStatus");
        mySearchList.add("childOrderStatus", JpaDataHandle.Operator.IN,new String[]{ChildOrderEnum.CHILDORDERQUALIFIED.getCode(),ChildOrderEnum.CHILDORDERMERCHANTAUDIT.getCode(),ChildOrderEnum.CHILDORDERPLATFORMAUDITFAIL.getCode()});
        returnKeyValueVOS = orderService.selectChildOrderAgencyPriceGroup(mySearchList.createMybaitsMapNoPage());
        Map<String,String> allPriceMap = new HashMap<>();
        for(ReturnKeyValueVO returnKeyValueVO : returnKeyValueVOS){
            allPriceMap.put(returnKeyValueVO.getDatevalue(),returnKeyValueVO.getDatavalue());
        }
        List<LineChartVO> lineChartVOS = new ArrayList<>();
        String realPriceString = null;
        String allPriceString = null;
        LineChartVO lineChartVO = null;
        for(String str:allDateStringList){
            lineChartVO = new LineChartVO();
            lineChartVO.setDatelabel(str);
            realPriceString = realPriceMap.remove(str);
            allPriceString = allPriceMap.remove(str);
            if(realPriceString != null){
                lineChartVO.setValue1(realPriceString);
            }
            if(allPriceString != null){
                lineChartVO.setValue2(allPriceString);
            }
            if(!(realPriceString == null || allPriceString == null)){
                lineChartVO.setProbability(new BigDecimal(Double.parseDouble(lineChartVO.getValue1())/Double.parseDouble(lineChartVO.getValue2())).setScale(2,BigDecimal.ROUND_HALF_EVEN).doubleValue()*100+"%");
            }
            lineChartVOS.add(lineChartVO);
        }
        System.out.println(JSON.toJSONString(allDateStringList));
        AjaxVO ajaxVO = AjaxVO.newAjax();
        ajaxVO.putDataList(lineChartVOS);
        return ajaxVO;
    }




    @RequestMapping(value = "selectAgencyOrderCountLineChart")
    @ApiOperation(value = "查询人数折线图",httpMethod = "POST")
    @Authority(companyName = "mySearchList.childOrderCompanyId",auto = true)
    public AjaxVO selectAgencyOrderCountLineChart(MySearchList mySearchList){
        MySearch startTimeMysearch = mySearchList.remove("startTime");
        MySearch endTimeMysearch = mySearchList.remove("endTime");
        Calendar calendar = Calendar.getInstance();
        List<String> allDateStringList = new ArrayList<>();
        dataDay(mySearchList, startTimeMysearch, endTimeMysearch, calendar, allDateStringList);

        mySearchList.remove("childOrderStatus");
        mySearchList.add("childOrderStatus", JpaDataHandle.Operator.IN,new String[]{ChildOrderEnum.CHILDORDERQUALIFIED.getCode()});
        List<ReturnKeyValueVO> returnKeyValueVOS = orderService.selectChildOrderCountGroup(mySearchList.createMybaitsMapNoPage());
        Map<String,String> realPriceMap = new HashMap<>();
        for(ReturnKeyValueVO returnKeyValueVO : returnKeyValueVOS){
            realPriceMap.put(returnKeyValueVO.getDatevalue(),returnKeyValueVO.getDatavalue());
        }
        returnKeyValueVOS.clear();
        mySearchList.remove("childOrderStatus");
        mySearchList.add("childOrderStatus", JpaDataHandle.Operator.IN,new String[]{ChildOrderEnum.CHILDORDERQUALIFIED.getCode(),ChildOrderEnum.CHILDORDERMERCHANTAUDIT.getCode(),ChildOrderEnum.CHILDORDERPLATFORMAUDITFAIL.getCode()});
        returnKeyValueVOS = orderService.selectChildOrderCountGroup(mySearchList.createMybaitsMapNoPage());
        Map<String,String> allPriceMap = new HashMap<>();
        for(ReturnKeyValueVO returnKeyValueVO : returnKeyValueVOS){
            allPriceMap.put(returnKeyValueVO.getDatevalue(),returnKeyValueVO.getDatavalue());
        }
        List<LineChartVO> lineChartVOS = new ArrayList<>();
        String realPriceString = null;
        String allPriceString = null;
        LineChartVO lineChartVO = null;
        for(String str:allDateStringList){
            lineChartVO = new LineChartVO();
            lineChartVO.setDatelabel(str);
            realPriceString = realPriceMap.remove(str);
            allPriceString = allPriceMap.remove(str);
            if(realPriceString != null){
                lineChartVO.setValue1(realPriceString);
            }
            if(allPriceString != null){
                lineChartVO.setValue2(allPriceString);
            }
            if(!(realPriceString == null || allPriceString == null)){
                lineChartVO.setProbability(new BigDecimal(Double.parseDouble(lineChartVO.getValue1())/Double.parseDouble(lineChartVO.getValue2())).setScale(2,BigDecimal.ROUND_HALF_EVEN).doubleValue()*100+"%");
            }
            lineChartVOS.add(lineChartVO);
        }
        System.out.println(JSON.toJSONString(allDateStringList));
        AjaxVO ajaxVO = AjaxVO.newAjax();
        ajaxVO.putDataList(lineChartVOS);
        return ajaxVO;
    }

    private void dataDay(MySearchList mySearchList, MySearch startTimeMysearch, MySearch endTimeMysearch, Calendar calendar, List<String> allDateStringList) {
        if (startTimeMysearch == null || endTimeMysearch == null) {
            if (startTimeMysearch != null) {
                calendar.setTime(WsStringUtils.objectToDate(startTimeMysearch.getValue()));
                calendar.set(Calendar.SECOND, 0);
                calendar.set(Calendar.HOUR_OF_DAY, 0);
                calendar.set(Calendar.MINUTE, 0);
                Date startTime = calendar.getTime();
                for (int i = 0; i < 31; i++) {
                    allDateStringList.add(WsStringUtils.dateToString(calendar.getTime(), WsStringUtils.SMALLTIMESTRING));
                    calendar.add(Calendar.DAY_OF_MONTH, 1);
                }
                Date endTime = calendar.getTime();
                mySearchList.add("endTime", JpaDataHandle.Operator.LTE, endTime);
                mySearchList.add("startTime", JpaDataHandle.Operator.GTE, startTime);


            } else if (endTimeMysearch != null) {
                calendar.setTime(WsStringUtils.objectToDate(endTimeMysearch.getValue()));
                calendar.set(Calendar.SECOND, 0);
                calendar.set(Calendar.HOUR_OF_DAY, 0);
                calendar.set(Calendar.MINUTE, 0);
                Date endTime = calendar.getTime();
                for (int i = 0; i < 31; i++) {
                    allDateStringList.add(WsStringUtils.dateToString(calendar.getTime(), WsStringUtils.SMALLTIMESTRING));
                    calendar.add(Calendar.DAY_OF_MONTH, -1);
                }
                Collections.reverse(allDateStringList);
                Date startTime = calendar.getTime();
                mySearchList.add("endTime", JpaDataHandle.Operator.LTE, endTime);
                mySearchList.add("startTime", JpaDataHandle.Operator.GTE, startTime);

            } else {
                calendar.set(Calendar.SECOND, 0);
                calendar.set(Calendar.HOUR_OF_DAY, 0);
                calendar.set(Calendar.MINUTE, 0);
                calendar.set(Calendar.DAY_OF_MONTH, 1);
                Date startTime = calendar.getTime();
                int lastDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
                for (int i = 0; i < lastDay; i++) {
                    allDateStringList.add(WsStringUtils.dateToString(calendar.getTime(), WsStringUtils.SMALLTIMESTRING));
                    calendar.add(Calendar.DAY_OF_MONTH, 1);
                }
                Date endTime = calendar.getTime();
                mySearchList.add("endTime", JpaDataHandle.Operator.LTE, endTime);
                mySearchList.add("startTime", JpaDataHandle.Operator.GTE, startTime);
            }

        } else {
            calendar.setTime(WsStringUtils.objectToDate(startTimeMysearch.getValue()));
            calendar.set(Calendar.SECOND, 0);
            calendar.set(Calendar.HOUR_OF_DAY, 0);
            calendar.set(Calendar.MINUTE, 0);
            Date startTime = calendar.getTime();
            calendar.setTime(WsStringUtils.objectToDate(endTimeMysearch.getValue()));
            calendar.set(Calendar.SECOND, 0);
            calendar.set(Calendar.HOUR_OF_DAY, 0);
            calendar.set(Calendar.MINUTE, 0);
            Date endTime = calendar.getTime();
            mySearchList.add("endTime", JpaDataHandle.Operator.LTE, endTime);
            mySearchList.add("startTime", JpaDataHandle.Operator.GTE, startTime);
            for (long i = startTime.getTime(); i < endTime.getTime(); i = i + 3600 * 24 * 1000) {
                allDateStringList.add(WsStringUtils.dateToString(new Date(i), WsStringUtils.SMALLTIMESTRING));
            }
        }
    }

}
