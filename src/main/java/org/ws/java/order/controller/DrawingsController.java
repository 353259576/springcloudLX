package org.ws.java.order.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.impl.execchain.MainClientExec;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.ws.java.order.annotation.Authority;
import org.ws.java.order.constants.*;
import org.ws.java.order.controller.search.drawingscontroller.*;
import org.ws.java.order.model.po.*;
import org.ws.java.order.model.vo.AjaxVO;
import org.ws.java.order.model.vo.CompanyReceptionVO;
import org.ws.java.order.model.vo.DrawingsVO;
import org.ws.java.order.model.vo.PageInfo;
import org.ws.java.order.service.*;
import org.ws.java.order.utils.PageConvertUtil;
import org.ws.java.order.wsutils.DataBaseHandle.JpaDataHandle;
import org.ws.java.order.wsutils.DataBaseHandle.MySearchList;
import org.ws.java.order.wsutils.WsBeanUtis;
import org.ws.java.order.wsutils.WsStringUtils;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "/order/drawings/")
public class DrawingsController  extends BaseController{

    @Autowired
    private DrawingsService drawingsService;

    @Autowired
    private CompanyService companyService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private UserService userService;

    @Autowired
    private DictService dictService;

    @RequestMapping(value = "selectDrawings")
    @ApiOperation(value = "查询提现记录",httpMethod = "POST")
    @Authority(companyName = "mySearchList.drawCompanyId",auto = true,isArray = true)
    public AjaxVO selectDrawings(MySearchList mySearchList){
        PageInfo<DrawingsPO> drawingsPOPageInfo = drawingsService.selectDrawings(mySearchList);
        PageInfo<DrawingsVO> drawingsVOPageInfo = PageConvertUtil.convertPage(drawingsPOPageInfo,DrawingsVO.class);
        CompanyPO companyPO = null;
        UserPO userPO = null;
        DictPO dictPO = null;
        Map map = null;
        Map<Long,Double> longDoubleMap = new HashMap<>();
        for(DrawingsVO drawingsVO:drawingsVOPageInfo.getDataList()){
            if(drawingsVO.getDrawCompanyId() != null){
                companyPO = companyService.selectCompanyById(drawingsVO.getDrawCompanyId());
                if(companyPO != null){
                    drawingsVO.setDrawCompanyLabel(companyPO.getName());
                }
                if(drawingsVO.getDrawCreateDate() != null){
                    drawingsVO.setDrawCreateDateLabel(WsStringUtils.dateToString(drawingsVO.getDrawCreateDate(),WsStringUtils.CNLONGTIMESTRING));
                }
                if(drawingsVO.getDrawUpdateDate() != null){
                    drawingsVO.setDrawUpdateDateLabel(WsStringUtils.dateToString(drawingsVO.getDrawUpdateDate(),WsStringUtils.CNLONGTIMESTRING));
                }
                if(drawingsVO.getDrawUpdateUser() != null){
                    userPO = userService.selectUserById(drawingsVO.getDrawUpdateUser());
                    if(userPO != null){
                        drawingsVO.setDrawUpdateUserLabel(userPO.getUserName());
                    }
                }
                if(drawingsVO.getDrawCreateUser() != null){
                    userPO = userService.selectUserById(drawingsVO.getDrawCreateUser());
                    if(userPO != null){
                        drawingsVO.setDrawCreateUserLabel(userPO.getUserName());
                    }
                }
                if(drawingsVO.getDrawStatus() != null){
                    dictPO = dictService.selectDictByCodeAndType(drawingsVO.getDrawStatus().toString(), AllStatusConstants.DRAWINGSSTATUS);
                    if(dictPO != null){
                        drawingsVO.setDrawStatusLabel(dictPO.getLabel());
                    }
                }
                if(drawingsVO.getDrawType() != null){
                    dictPO = dictService.selectDictByCodeAndType(drawingsVO.getDrawType().toString(), AllStatusConstants.DRAWINGSTYPE);
                    if(dictPO != null){
                        drawingsVO.setDrawTypeLabel(dictPO.getLabel());
                    }
                }
                Double price = longDoubleMap.get(drawingsVO.getDrawCompanyId());
                if(price == null){
                    map = new HashMap();
                    map.put("childOrderCompanyId",drawingsVO.getDrawCompanyId());
                    map.put("childOrderStatus",new String[]{ChildOrderEnum.CHILDORDERQUALIFIED.getCode()});
                    Double allprice = orderService.selectChildOrderAgencyPrice(map);
                    if(allprice == null){
                        allprice = 0d;
                    }
                    map = new HashMap();
                    map.put("drawCompanyId",drawingsVO.getDrawCompanyId());
                    map.put("drawStatus",new String[]{DrawingsEnum.DRAWINGSAGREE.getCode(),DrawingsEnum.DRAWINGSINSERT.getCode()});
                    Double allDrawingsPrice = drawingsService.selectDrawingsPrice(map);
                    if(allDrawingsPrice == null){
                        allDrawingsPrice = 0d;
                    }
                    drawingsVO.setCompanyPrice(allprice-allDrawingsPrice);
                    longDoubleMap.put(drawingsVO.getDrawCompanyId(),allprice-allDrawingsPrice);
                }else {
                    drawingsVO.setCompanyPrice(price);
                }


            }
        }
        AjaxVO ajaxVO = AjaxVO.newAjax();
        ajaxVO.putDataList(drawingsVOPageInfo);
        return ajaxVO;
    }

    @RequestMapping(value = "insertDrawings")
    @ApiOperation(value = "添加提现信息",httpMethod = "POST")
    @Authority(companyName = "insertDrawingsSearch.drawCompanyId")
    public AjaxVO insertDrawings(@RequestBody InsertDrawingsSearch insertDrawingsSearch){
        HttpSession session = this.getHttpSession();
        UserPO userPO = (UserPO)session.getAttribute(SystemConstants.USER);
        if(StringUtils.isEmpty(insertDrawingsSearch.getDrawName())){
            return AjaxVO.returnFailMsg("提现理由为空");
        }
        if(insertDrawingsSearch.getDrawPrice() == null){
            return AjaxVO.returnFailMsg("提现金额为空");
        }
        if(insertDrawingsSearch.getDrawPrice() <= 0){
            return AjaxVO.returnFailMsg("提现金额为零");
        }
        if(insertDrawingsSearch.getDrawCompanyId() == null){
            return AjaxVO.returnFailMsg("提现公司为空");
        }
        CompanyPO companyPO = companyService.selectCompanyById(insertDrawingsSearch.getDrawCompanyId());
        if(companyPO == null){
            return AjaxVO.returnFailMsg("公司为空");
        }
        Map map = new HashMap();
        map.put("childOrderCompanyId",companyPO.getId());
        map.put("childOrderStatus",new String[]{ChildOrderEnum.CHILDORDERQUALIFIED.getCode()});
        Double allprice = orderService.selectChildOrderAgencyPrice(map);
        if(allprice == null){
            allprice = 0d;
        }
        map = new HashMap();
        map.put("drawCompanyId",companyPO.getId());
        map.put("drawStatus",new String[]{DrawingsEnum.DRAWINGSAGREE.getCode(),DrawingsEnum.DRAWINGSINSERT.getCode()});
        Double allDrawingsPrice = drawingsService.selectDrawingsPrice(map);
        if(allDrawingsPrice == null){
            allDrawingsPrice = 0d;
        }
        if(allprice-allDrawingsPrice-insertDrawingsSearch.getDrawPrice() <= 0){
            return AjaxVO.returnFailMsg("余额为空");
        }

        DrawingsPO drawingsPO = new DrawingsPO();
        BeanUtils.copyProperties(insertDrawingsSearch,drawingsPO);
        drawingsPO.setDrawCreateDate(new Date());
        drawingsPO.setDrawCreateUser(userPO.getId());
        drawingsPO.setDrawStatus(Integer.valueOf(DrawingsEnum.DRAWINGSINSERT.getCode()));
        if(companyPO.getType().toString().equals(CompanyEnum.SHOP.getCode())){
            drawingsPO.setDrawType(Integer.valueOf(DrawingsEnum.CLAIM.getCode()));
        }else {
            drawingsPO.setDrawType(Integer.valueOf(DrawingsEnum.DEPOSIT.getCode()));
        }
        drawingsService.insertDrawings(drawingsPO);
        return AjaxVO.returnSuccMsg("提现成功");
    }


    @RequestMapping(value = "agreeDrawings")
    @ApiOperation(value = "同意提现",httpMethod = "POST")
    @Authority(onlyAllowAdmin = true)
    public AjaxVO agreeDrawings(@RequestBody AgreeDrawingsSearch agreeDrawingsSearch){
        if(agreeDrawingsSearch == null){
            return AjaxVO.returnFailMsg("提现记录为空");
        }
        UserPO userPO = getUser();
        drawingsService.updateDrawingsStatus(agreeDrawingsSearch.drawingsId,Integer.valueOf(DrawingsEnum.DRAWINGSAGREE.getCode()));
        drawingsService.updateDrawingsUpdateUser(agreeDrawingsSearch.drawingsId,userPO.getId());
        return AjaxVO.returnSuccMsg("提现完成");

    }

    @RequestMapping(value = "rejectDrawings")
    @ApiOperation(value = "拒绝提现请求",httpMethod = "POST")
    @Authority(onlyAllowAdmin = true)
    public AjaxVO rejectDrawings(@RequestBody RejectDrawingsSearch rejectDrawingsSearch){
        if(rejectDrawingsSearch == null){
            return AjaxVO.returnFailMsg("提现记录为空");
        }
        UserPO userPO = getUser();
        drawingsService.updateDrawingsStatus(rejectDrawingsSearch.drawingsId,Integer.valueOf(DrawingsEnum.DRAWINGSUNAGREE.getCode()));
        drawingsService.updateDrawingsUpdateUser(rejectDrawingsSearch.drawingsId,userPO.getId());
        return AjaxVO.returnSuccMsg("拒绝完成");
    }


    @RequestMapping(value = "selectDrawingsPrice")
    @ApiOperation(value = "查询提现金额",httpMethod = "POST")
    @Authority(companyName = "mySearchList.drawCompanyId",auto = true)
    public AjaxVO selectDrawingsPrice(MySearchList mySearchList){
        Double price = drawingsService.selectDrawingsPrice(mySearchList.createMybaitsMapNoPage());
        if(price == null){
            price = 0d;
        }
        AjaxVO ajaxVO = AjaxVO.newAjax();
        ajaxVO.putData("drawingsPrice",price);
        return ajaxVO;
    }


    @RequestMapping(value = "selectCompanyReception")
    @ApiOperation(value = "查询网点报单",httpMethod = "POST")
    @Authority(companyName = "mySearchList.companyId",auto = true,isArray = true)
    public AjaxVO selectCompanyReception(MySearchList mySearchList){
        PageInfo<CompanyReceptionPO> companyReceptionPOPageInfo = drawingsService.selectCompanyReception(mySearchList);
        PageInfo<CompanyReceptionVO> companyReceptionVOPageInfo = PageConvertUtil.convertPage(companyReceptionPOPageInfo,CompanyReceptionVO.class);
        companyReceptionPOPageInfo = null;
        CompanyPO companyPO = null;
        //Map map = null;
        for(CompanyReceptionVO companyReceptionVO:companyReceptionVOPageInfo.getDataList()){
            if(companyReceptionVO.getCompanyId() != null){
                companyPO = companyService.selectCompanyById(companyReceptionVO.getCompanyId());
                if(companyPO != null){
                    companyReceptionVO.setCompanyName(companyPO.getName());
                }
            }
            if(companyReceptionVO.getCreateDate() != null){
                companyReceptionVO.setCreateDateLabel(WsStringUtils.dateToString(companyReceptionVO.getCreateDate(),WsStringUtils.CNSMALLTIMESTRING));
            }
            /*map = new HashMap();
            map.put("userPhone",companyReceptionVO.getUserPhone());
            map.put("childOrderCompanyId",companyReceptionVO.getCompanyId());
            map.put("childOrderStatus",new String[]{ChildOrderEnum.CHILDORDERMERCHANTAUDIT.getCode(),ChildOrderEnum.CHILDORDERQUALIFIED.getCode(),ChildOrderEnum.CHILDORDERPLATFORMAUDITFAIL.getCode()});
            Integer count = orderService.selectChildOrderCount(map);*/

        }
        AjaxVO ajaxVO = AjaxVO.newAjax();
        ajaxVO.putDataList(companyReceptionVOPageInfo);
        return ajaxVO;
    }


    @RequestMapping(value = "insertCompanyReception")
    @ApiOperation(value = "添加网点报表",httpMethod = "POST")
    @Authority
    public AjaxVO insertCompanyReception(@RequestBody InsertCompanyReceptionSearch insertCompanyReceptionSearch){
        if(insertCompanyReceptionSearch.getId() == null){
            return AjaxVO.returnFailMsg("ID为空");
        }
        CompanyReceptionPO companyReceptionPO = drawingsService.selectCompanyReceptionById(insertCompanyReceptionSearch.getId());
        WsBeanUtis.copyField(insertCompanyReceptionSearch,companyReceptionPO);
        companyReceptionPO.setReceptionStatus(1);
        drawingsService.updateCompanyReception(companyReceptionPO);
        return AjaxVO.returnSuccMsg("添加成功");
    }




    @RequestMapping(value = "commitCompanyReceptions")
    @ApiOperation(value = "提交报销单审核",httpMethod = "POST")
    @Authority(companyName = "commitCompanyReceptionSearch.companyId")
    public AjaxVO commitCompanyReception(@RequestBody CommitCompanyReceptionSearch commitCompanyReceptionSearch){
        if(commitCompanyReceptionSearch.getDrawingsId() == null){
            return AjaxVO.returnFailMsg("报单ID为空");
        }
        DrawingsPO drawingsPO = drawingsService.selectDrawingsById(commitCompanyReceptionSearch.drawingsId);
        if(drawingsPO == null){
            return AjaxVO.returnFailMsg("报单不存在");
        }
        if(!drawingsPO.getDrawStatus().toString().equals(DrawingsEnum.CLAIM.getCode())){
            return AjaxVO.returnFailMsg("不是报销单");
        }
        if(!commitCompanyReceptionSearch.getCompanyId().equals(drawingsPO.getDrawCompanyId())){
            return AjaxVO.returnFailMsg("报销单不属于当前商家");
        }
        Map map = new HashMap();
        map.put("receptionStatus",0);
        MySearchList mySearchList = new MySearchList();
        mySearchList.add("receptionStatus", JpaDataHandle.Operator.EQ,0);
        List<CompanyReceptionPO> companyReceptionPOS = drawingsService.selectCompanyReceptionAll(mySearchList);
        if(!(companyReceptionPOS == null || companyReceptionPOS.size() == 0)){
            return AjaxVO.returnFailMsg("还有报单未填写");
        }
        map.put("receptionStatus",1);
        map.put("drawingsId",drawingsPO.getId());
        Double userPrice = drawingsService.selectReceptionUserPrice(map);
        Double allPrice = drawingsService.selectReceptionAllPrice(map);
        Double receptionPrice = drawingsService.selectReceptionReceptionPrice(map);
        drawingsPO.setDrawPrice(allPrice);
        drawingsPO.setDrawUserPrice(userPrice);
        drawingsPO.setDrawAgencyPrice(receptionPrice);
        UserPO userPO = getUser();
        drawingsPO.setDrawCreateUser(userPO.getId());
        drawingsPO.setDrawStatus(Integer.parseInt(DrawingsEnum.DRAWINGSINSERT.getCode()));
        drawingsService.updateDrawings(drawingsPO);
        return AjaxVO.returnSuccMsg("提交成功");
    }


    @RequestMapping(value = "selectCompanySummary")
    @ApiOperation(value = "查询客单分析",httpMethod = "POST")
    @Authority(companyName = "mySearchList.companyId",auto = true)
    public AjaxVO selectCompanySummary(MySearchList mySearchList){
        PageInfo<CompanySummaryPO> companySummaryPOPageInfo = drawingsService.selectComapnySummary(mySearchList);
        Map map = mySearchList.createMybaitsMapNoPage();
        Integer userNumAll = drawingsService.selectCompanySummaryUserNumAll(map);
        Integer orderNumAll = drawingsService.selectCompanySummaryOrderNumAll(map);
        Double userPriceAll = drawingsService.selectCompanySummaryUserpriceAll(map);
        Double orderPriceAll = drawingsService.selectCompanySummaryOrderPriceAll(map);
        Double agentPriceAll = drawingsService.selectCompanySummaryAgentPriceAll(map);
        AjaxVO ajaxVO = AjaxVO.newAjax();
        ajaxVO.putDataList(companySummaryPOPageInfo);
        ajaxVO.putData("userNumAll",userNumAll);
        ajaxVO.putData("orderNumAll",orderNumAll);
        ajaxVO.putData("userPriceAll",userPriceAll);
        ajaxVO.putData("orderPriceAll",orderPriceAll);
        ajaxVO.putData("agentPriceAll",agentPriceAll);
        return ajaxVO;
    }
}
