package org.ws.java.order.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.ws.java.order.controller.search.dictcontroller.SelectDictByCodeAndTypeSearch;
import org.ws.java.order.controller.search.dictcontroller.SelectDictByTypeSearch;
import org.ws.java.order.model.po.DictPO;
import org.ws.java.order.model.vo.AjaxVO;
import org.ws.java.order.service.DictService;

import java.util.List;

@RestController
@RequestMapping("/order/dict")
@Api("用户字典表查询")
public class DictController {

    @Autowired
    private DictService dictService;


    @ApiOperation(value = "通过类型查询字典表",notes = "查询结果为数组类型",httpMethod = "POST")
    @RequestMapping("selectDictByType")
    public AjaxVO selectDictByType(@RequestBody SelectDictByTypeSearch selectDictByTypeSearch){
        if(StringUtils.isEmpty(selectDictByTypeSearch.type)){
            return AjaxVO.returnFailMsg("类型为空");
        }
        AjaxVO ajaxVO = AjaxVO.newAjax();
        List<DictPO> dictPOS = dictService.selectDictByType(selectDictByTypeSearch.type);
        ajaxVO.putDataList(dictPOS);
        return ajaxVO;
    }



    @RequestMapping("selectDictByCodeAndType")
    @ApiOperation(value = "查询字典表", notes = "定位字典",httpMethod = "POST")
    public AjaxVO selectDictByCodeAndType(@RequestBody SelectDictByCodeAndTypeSearch selectDictByCodeAndTypeSearch){
        if(StringUtils.isEmpty(selectDictByCodeAndTypeSearch.code)){
            return AjaxVO.returnFailMsg("字典识别码为空");
        }
        if(StringUtils.isEmpty(selectDictByCodeAndTypeSearch.type)){
            return AjaxVO.returnFailMsg("字典类型为空");
        }
        DictPO dictPO = dictService.selectDictByCodeAndType(selectDictByCodeAndTypeSearch.code,selectDictByCodeAndTypeSearch.type);
        AjaxVO ajaxVO = AjaxVO.newAjax();
        ajaxVO.putData("dict",dictPO);
        return ajaxVO;
    }
}
