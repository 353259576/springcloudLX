package org.ws.java.order.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.ws.java.order.annotation.Authority;
import org.ws.java.order.annotation.MyLog;
import org.ws.java.order.constants.AjaxFlag;
import org.ws.java.order.constants.ChildOrderEnum;
import org.ws.java.order.constants.DrawingsEnum;
import org.ws.java.order.model.po.CompanyAccountPO;
import org.ws.java.order.model.po.CompanyPO;
import org.ws.java.order.model.po.DictPO;
import org.ws.java.order.model.po.UserPO;
import org.ws.java.order.model.vo.AjaxVO;
import org.ws.java.order.model.vo.CompanyVO;
import org.ws.java.order.model.vo.PageInfo;
import org.ws.java.order.model.vo.PageVO;
import org.ws.java.order.service.*;
import org.ws.java.order.utils.PageConvertUtil;
import org.ws.java.order.wsutils.DataBaseHandle.MySearchList;
import org.ws.java.order.wsutils.WsStringUtils;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("order/company")
@Api("公司操作")
public class CompanyController extends BaseController {
    @Autowired
    private CompanyService companyService;

    @Autowired
    private CityService cityService;

    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private DictService dictService;

    @Autowired
    private DrawingsService drawingsService;


    @RequestMapping(value = "insertCompany")
    @MyLog(name = "添加商家")
    @ApiOperation(value = "添加商家",notes = "添加商家，ID留空",httpMethod = "POST")
    @Transactional(rollbackFor = RuntimeException.class)
    @Authority(onlyAllowAdmin = true)
    public AjaxVO insertCompany(@RequestBody CompanyPO companyPO) {
        if(companyPO == null){
            return AjaxVO.returnFailMsg("传入信息为空");
        }
        companyPO.setId(null);
        if(StringUtils.isEmpty(companyPO.getName())){
            return AjaxVO.returnFailMsg("商家名称为空");
        }
        if(companyPO.getCityId() == null){
            return AjaxVO.returnFailMsg("城市为空");
        }
        if(StringUtils.isEmpty(companyPO.getAddress())){
            return AjaxVO.returnFailMsg("具体地址为空");
        }
        if(companyPO.getType() == null){
            return AjaxVO.returnFailMsg("商家类型为空");
        }
        if(StringUtils.isEmpty(companyPO.getLinkman())){
            return AjaxVO.returnFailMsg("联系人为空");
        }
        if(StringUtils.isEmpty(companyPO.getLinkphone())){
            return AjaxVO.returnFailMsg("联系方式为空");
        }
        List<CompanyPO> companyPOS = companyService.selectCompanyByName(companyPO.getName());
        if(!(companyPOS == null || companyPOS.isEmpty())){
            return AjaxVO.returnFailMsg("名称重复");
        }
        companyPO.setId(null);
        Long companyId = companyService.insertCompany(companyPO);
        CompanyAccountPO companyAccountPO = new CompanyAccountPO();
        companyAccountPO.setCompanyId(companyId);
        companyService.createCompanyAccount(companyAccountPO);
        return AjaxVO.returnSuccMsg("添加成功");
    }

    @RequestMapping(value = "selectCompany")
    @ApiOperation(value = "分页查询商家",httpMethod = "POST")
    @Authority(companyName = "mySearchList.id",auto = true)
    public AjaxVO selectCompany(MySearchList mySearchList, PageVO pageVO) {
        PageInfo<CompanyPO> companyPOPageInfo = companyService.selectCompany(mySearchList,pageVO);
        List<CompanyVO> companyVOS = new ArrayList<>();
        CompanyVO companyVO = null;
        UserPO userPO = null;
        Map map = null;
        for (CompanyPO c:companyPOPageInfo.getDataList()) {
            companyVO = new CompanyVO();
            BeanUtils.copyProperties(c,companyVO);
            if(c.getCreateDate() != null)
            companyVO.setCreateDateLabel(WsStringUtils.dateToString(c.getCreateDate(),WsStringUtils.LONGTIMESTRING));
            if(c.getCreateUser() != null){
                userPO = userService.selectUserById(c.getCreateUser());
                if(userPO != null){
                    companyVO.setCreateUserLabel(userPO.getUserRealName());
                }
            }
            if(c.getCityId() != null){
                companyVO.setCityIdLabel(cityService.getCityString(c.getCityId(),null));
            }

            map = new HashMap();
            map.put("childOrderStatus",new String[]{ChildOrderEnum.CHILDORDERQUALIFIED.getCode()});
            map.put("childOrderCompanyId",c.getId());
            Double price = orderService.selectChildOrderAgencyPrice(map);
            if(price == null){
                price = 0d;
            }

            map = new HashMap();
            map.put("drawCompanyId",c.getId());
            map.put("drawStatus", new String[]{DrawingsEnum.DRAWINGSAGREE.getCode()});
            Double drawingsPrice = drawingsService.selectDrawingsPrice(map);
            if(drawingsPrice == null){
                drawingsPrice = 0d;
            }


            companyVO.setPrice(price-drawingsPrice);

            if(companyVO.getType() != null){
                DictPO dictPO = dictService.selectDictByCodeAndType(companyVO.getType().toString(),"companytype");
                if(dictPO != null){
                    companyVO.setTypelabel(dictPO.getLabel());
                }

            }


            companyVO.setKey(companyVO.getId().toString());

            companyVO.setTitle(companyVO.getName());

            companyVOS.add(companyVO);
        }
        PageInfo<CompanyVO> companyVOPageInfo = PageConvertUtil.convertEmptyDataPage(companyPOPageInfo,CompanyVO.class);
        companyVOPageInfo.setDataList(companyVOS);
        AjaxVO ajaxVO = AjaxVO.newAjax(AjaxFlag.SUCC.code(),"查询成功");
        ajaxVO.putDataList(companyVOPageInfo);
        return ajaxVO;
    }

    @RequestMapping("updateCompany")
    @MyLog(name = "修改商家信息")
    @ApiOperation(value = "修改商家信息",httpMethod = "POST")
    @Authority(companyName = "companyPO.id")
    public AjaxVO updateCompany(@RequestBody CompanyPO companyPO) {
        if(companyPO == null){
            return AjaxVO.returnFailMsg("传入信息为空");
        }
        if(StringUtils.isEmpty(companyPO.getName())){
            return AjaxVO.returnFailMsg("商家名称为空");
        }
        if(companyPO.getCityId() == null){
            return AjaxVO.returnFailMsg("城市为空");
        }
        if(StringUtils.isEmpty(companyPO.getAddress())){
            return AjaxVO.returnFailMsg("具体地址为空");
        }
        if(companyPO.getType() == null){
            return AjaxVO.returnFailMsg("商家类型为空");
        }
        if(StringUtils.isEmpty(companyPO.getLinkman())){
            return AjaxVO.returnFailMsg("联系人为空");
        }
        if(StringUtils.isEmpty(companyPO.getLinkphone())){
            return AjaxVO.returnFailMsg("联系方式为空");
        }
        List<CompanyPO> companyPOS = companyService.selectCompanyByName(companyPO.getName());
        if(!(companyPOS == null || companyPOS.isEmpty())){
            return AjaxVO.returnFailMsg("名称重复");
        }
        companyPO.setCreateUser(null);
        companyPO.setCreateDate(null);
        companyService.updateCompany(companyPO);
        return AjaxVO.returnSuccMsg("修改成功");
    }

}
