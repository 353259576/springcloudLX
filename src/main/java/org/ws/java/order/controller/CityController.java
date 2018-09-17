package org.ws.java.order.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.ws.java.order.constants.AjaxFlag;
import org.ws.java.order.constants.CityEnum;
import org.ws.java.order.controller.search.citycontroller.SelectCitySearch;
import org.ws.java.order.controller.search.citycontroller.SelectDistrictSearch;
import org.ws.java.order.model.po.CityPO;
import org.ws.java.order.model.vo.AjaxVO;
import org.ws.java.order.service.CityService;

import java.util.List;

@RestController
@RequestMapping("order/city/")
@Api("城市信息获取")
public class CityController extends BaseController {

    @Autowired
    private CityService cityService;

    @ApiOperation(value = "查询全国所有的省",httpMethod = "POST")
    @RequestMapping(value = "selectProvince")
    @Cacheable(cacheNames = "selectProvince")
    public AjaxVO selectProvince(){
        List<CityPO> list = cityService.selectCityByDeep(CityEnum.PROVINCE.getCode());
        AjaxVO ajaxVO = new AjaxVO();
        ajaxVO.putDataList(list);
        return ajaxVO;
    }


    @ApiOperation(value = "根据省查询市",httpMethod = "POST")
    //@ApiImplicitParam(name = "id", value = "1", defaultValue = "1",required = true, dataType = "Long")
    @RequestMapping(value = "selectCity")
    @Cacheable(cacheNames = "selectCity",key = "'selectCity'+#selectCitySearch.id")
    public AjaxVO selectCity(@RequestBody SelectCitySearch selectCitySearch){
        if(selectCitySearch.id == null){
            AjaxVO ajaxVO = new AjaxVO();
            ajaxVO.setFlag(AjaxFlag.FAIL);
            ajaxVO.setMsg("城市名称为空");
            return ajaxVO;
        }
        List<CityPO> list = cityService.selectCityByPid(selectCitySearch.id, CityEnum.CITY.getCode());
        AjaxVO ajaxVO = new AjaxVO();
        ajaxVO.putDataList(list);
        return ajaxVO;
    }

    @ApiOperation(value = "根据市查询区",httpMethod = "POST")
    //@ApiImplicitParam(name = "id", value = "1",defaultValue = "1",required = true, dataType = "Long")
    @RequestMapping(value = "selectDistrict")
    @Cacheable(cacheNames = "selectDistrict",key = "'selectDistrict'+#selectDistrictSearch.id")
    public AjaxVO selectDistrict(@RequestBody SelectDistrictSearch selectDistrictSearch){
        if(selectDistrictSearch.id == null){
            AjaxVO ajaxVO = new AjaxVO();
            ajaxVO.setFlag(AjaxFlag.FAIL);
            ajaxVO.setMsg("区名称为空");
            return ajaxVO;
        }
        List<CityPO> list = cityService.selectCityByPid(selectDistrictSearch.id, CityEnum.DISTRICT.getCode());
        AjaxVO ajaxVO = new AjaxVO();
        ajaxVO.putDataList(list);
        return ajaxVO;
    }


}
