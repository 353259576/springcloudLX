package org.ws.java.order.timer;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.ws.java.order.annotation.DataBase;
import org.ws.java.order.constants.ChildOrderEnum;
import org.ws.java.order.constants.CompanyEnum;
import org.ws.java.order.constants.DrawingsEnum;
import org.ws.java.order.model.po.ChildOrderPO;
import org.ws.java.order.model.po.CompanyPO;
import org.ws.java.order.model.po.CompanySummaryPO;
import org.ws.java.order.model.po.DrawingsPO;
import org.ws.java.order.service.CompanyService;
import org.ws.java.order.service.DrawingsService;
import org.ws.java.order.service.OrderService;
import org.ws.java.order.wsutils.DataBaseHandle.JpaDataHandle;
import org.ws.java.order.wsutils.DataBaseHandle.MySearchList;
import org.ws.java.order.wsutils.WsStringUtils;

import java.util.*;

@Component
@Slf4j
public class MyTimer {
    @Autowired
    private CompanyService companyService;

    @Autowired
    private DrawingsService drawingsService;

    @Autowired
    private OrderService orderService;


    @Scheduled(cron = "0 0 1 * * ?")
    public void ceateOrderDrawings(){
        MySearchList mySearchList = new MySearchList();
        mySearchList.add("type", JpaDataHandle.Operator.EQ, CompanyEnum.SHOP.getCode());
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY,0);
        calendar.set(Calendar.MINUTE,0);
        calendar.set(Calendar.SECOND,0);
        Date date = calendar.getTime();
        List<CompanyPO> list = companyService.selectCompany(mySearchList);
        if(list != null){
            DrawingsPO drawingsPO = null;
            for(CompanyPO companyPO:list){
                drawingsPO = new DrawingsPO();
                drawingsPO.setDrawType(Integer.parseInt(DrawingsEnum.CLAIM.getCode()));
                drawingsPO.setDrawCompanyId(companyPO.getId());
                drawingsPO.setDrawPrice(0d);
                drawingsPO.setDrawUserPrice(0d);
                drawingsPO.setDrawAgencyPrice(0d);
                drawingsPO.setDrawStatus(Integer.parseInt(DrawingsEnum.DRAWINGSDELETE.getCode()));
                drawingsPO.setDrawCreateDate(date);
                drawingsPO.setDrawName(WsStringUtils.dateToString(date,WsStringUtils.CNSMALLTIMESTRING)+companyPO.getName()+"报销单");
                drawingsService.insertDrawings(drawingsPO);
            }
        }
    }

    //@Scheduled(cron = "0/5 * * * * ?")
    @Scheduled(cron = "0 0 1 * * ?")
    public void createCompanySummary(){
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY,0);
        calendar.set(Calendar.MINUTE,0);
        calendar.set(Calendar.SECOND,0);
        calendar.add(Calendar.DAY_OF_MONTH,-1);
        Date startTime = calendar.getTime();
        calendar.add(Calendar.DAY_OF_MONTH,1);
        Date endTime = calendar.getTime();
        List<CompanyPO> companyPOS = companyService.selectCompany(new MySearchList());
        CompanySummaryPO companySummaryPO = null;
        Map map = new HashMap();
        map.put("startTime",startTime);
        map.put("endTime",endTime);
        map.put("childOrderStatus",new String[]{ChildOrderEnum.CHILDORDERQUALIFIED.getCode(),ChildOrderEnum.CHILDORDERMERCHANTAUDIT.getCode(),ChildOrderEnum.CHILDORDERPLATFORMAUDITFAIL.getCode()});
        Map map1 = new HashMap();
        map1.put("createDate",startTime);
        String dataString = WsStringUtils.dateToString(startTime,WsStringUtils.CNSMALLTIMESTRING);
        List<ChildOrderPO> childOrderPOS = null;
        List<String> userPhoneS = null;
        MySearchList mySearchList = null;
        Integer orderNum = null;
        Double orderPrice = null;
        for (CompanyPO companyPO:companyPOS) {
            companySummaryPO = new CompanySummaryPO();
            companySummaryPO.setSummaryCreateDate(startTime);
            companySummaryPO.setSummaryName(dataString+companyPO.getName()+"统计");
            map.put("childOrderCompanyId",companyPO.getId());
            orderNum = orderService.selectChildOrderCount(map);
            companySummaryPO.setSummaryOrdernum(orderNum);
            orderPrice = orderService.selectChildOrderAgencyPrice(map);
            companySummaryPO.setSummaryOrderprice(orderPrice);
            companySummaryPO.setSummaryUsernum(orderService.selectChildOrderUserCount(map));
            map1.put("companyId",companyPO.getId());
            if(companyPO.getType().toString().equals(CompanyEnum.SHOP.getCode())){
                companySummaryPO.setSummaryAgentprice(drawingsService.selectReceptionReceptionPrice(map1));
                companySummaryPO.setSummaryUserpriceAll(drawingsService.selectReceptionAllPrice(map1));
            }else {
                companySummaryPO.setSummaryUserpriceAll(0d);
                companySummaryPO.setSummaryAgentprice(0d);
            }
            companySummaryPO.setCompanyId(companyPO.getId());
            drawingsService.installCompanySummary(companySummaryPO);
        }

    }
}
