<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String path = request.getSession().getServletContext().getContextPath();
    String port=request.getServerPort()==80?"":":"+request.getServerPort();
    String basePath = request.getScheme()+"://"+request.getServerName()+port+path+"/";%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title></title>
    <%@ include file="../include.jsp"%>
</head>

<body>
<div class="ibox-content">
   <form class="form-horizontal" method="post" id="activityEditForm">
       <input type = "hidden" name = "sysModelId" <c:if test="${vehicle!=null}">value="${vehicle.sysModelId }"</c:if>>
       <%--<div class="form-group">
           <label class="col-sm-2 control-label">车辆图片：</label>
           <div class="col-sm-9">
               <input type="hidden" name="imgUrl" id="imgUrl"  <c:if test="${vehicle!=null}"> value="${vehicle.imgUrl}"</c:if>>
               <div img-area-id="imgUrl">
                   <c:if test="${vehicle!=null}">
                       <a class="img-area"><img src="${vehicle.imgUrl}"><span onclick="uploadDel(this,'imgUrl')">x</span></a>
                   </c:if>
                   <a class="img-area-btn" onclick="uploadImg(1,'imgUrl')"></a>
               </div>
           </div>
       </div>--%>
       <div class="form-group">
           <label class="col-sm-2 control-label">商品轮播图：</label>
           <div class="col-sm-9">
               <input type="hidden" name="imgUrl" id="productImgs" value="${vehicle.imgUrl}">
               <div img-area-id="productImgs">
                   <c:if test="${!add}">
                       <c:forTokens items="${vehicle.imgUrl}" delims="," var="ft">
                           <a class="img-area"><img src="${ft}"><span onclick="uploadDel(this,'productImgs')">x</span></a>
                       </c:forTokens>
                   </c:if>
                   <a class="img-area-btn" onclick="uploadImg(9,'productImgs')"></a>
               </div>
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">销售名称：</label>
           <div class="col-sm-9">
               <input type="text" name="sellName"  <c:if test="${vehicle!=null}">value="${vehicle.sellName }"</c:if>   class="form-control" placeholder="销售名称">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">销售版本：</label>
           <div class="col-sm-9">
               <input type="text" name="sellEdition"  <c:if test="${vehicle!=null}">value="${vehicle.sellEdition }"</c:if>   class="form-control" placeholder="销售版本">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">停产年份：</label>
           <div class="col-sm-9">
               <input type="number" name="noproduceYear"  <c:if test="${vehicle!=null}">value="${vehicle.noproduceYear }"</c:if>   class="form-control" placeholder="停产年份">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">生产状态：</label>
           <div class="col-sm-9">
               <input type="text" name="produceStatus"  <c:if test="${vehicle!=null}">value="${vehicle.produceStatus }"</c:if>   class="form-control" placeholder="生产状态">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">指导价格：</label>
           <div class="col-sm-9">
               <input type="text" name="guidePrice"  <c:if test="${vehicle!=null}">value="${vehicle.guidePrice }"</c:if>   class="form-control" placeholder="指导价格">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">上市年份：</label>
           <div class="col-sm-9">
               <input type="text" name="ipoYear"  <c:if test="${vehicle!=null}">value="${vehicle.ipoYear }"</c:if>   class="form-control" placeholder="上市年份">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">上市月份：</label>
           <div class="col-sm-9">
               <input type="text" name="ipoMonth"  <c:if test="${vehicle!=null}">value="${vehicle.ipoMonth }"</c:if>   class="form-control" placeholder="上市月份">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">车型ID：</label>
           <div class="col-sm-9">
               <input type="number" name="modeId"  <c:if test="${vehicle!=null}">value="${vehicle.modeId }"</c:if>   class="form-control" placeholder="车型ID">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">销售状态：</label>
           <div class="col-sm-9">
               <input type="text" name="sellStatus"  <c:if test="${vehicle!=null}">value="${vehicle.sellStatus }"</c:if>   class="form-control" placeholder="销售状态">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">车型代码：</label>
           <div class="col-sm-9">
               <input type="text" name="modelCode"  <c:if test="${vehicle!=null}">value="${vehicle.modelCode }"</c:if>   class="form-control" placeholder="车型代码">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">品牌：</label>
           <div class="col-sm-9">
               <input type="text" name="brand"  <c:if test="${vehicle!=null}">value="${vehicle.brand }"</c:if>   class="form-control" placeholder="品牌">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">车系：</label>
           <div class="col-sm-9">
               <input type="text" name="chexi"  <c:if test="${vehicle!=null}">value="${vehicle.chexi }"</c:if>   class="form-control" placeholder="车系">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">车型：</label>
           <div class="col-sm-9">
               <input type="text" name="carModel"  <c:if test="${vehicle!=null}">value="${vehicle.carModel }"</c:if>   class="form-control" placeholder="车型">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">车辆颜色：</label>
           <div class="col-sm-9">
               <input type="text" name="colour"  <c:if test="${vehicle!=null}">value="${vehicle.colour }"</c:if>   class="form-control" placeholder="车辆颜色">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">生产年份：</label>
           <div class="col-sm-9">
               <input type="text" name="produceYear"  <c:if test="${vehicle!=null}">value="${vehicle.produceYear }"</c:if>   class="form-control" placeholder="生产年份">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">年款：</label>
           <div class="col-sm-9">
               <input type="text"  name="carYear"  <c:if test="${vehicle!=null}">value="${vehicle.carYear }"</c:if>   class="form-control" placeholder="年款">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">国别：</label>
           <div class="col-sm-9">
               <input type="text" name="country"  <c:if test="${vehicle!=null}">value="${vehicle.country }"</c:if>   class="form-control" placeholder="国别">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">国产合资进口：</label>
           <div class="col-sm-9">
               <input type="text" name="gcJoint"  <c:if test="${vehicle!=null}">value="${vehicle.gcJoint }"</c:if>   class="form-control" placeholder="国产合资进口">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">厂家名称：</label>
           <div class="col-sm-9">
               <input type="text" name="cjName"  <c:if test="${vehicle!=null}">value="${vehicle.cjName }"</c:if>   class="form-control" placeholder="厂家名称">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">环保标准：</label>
           <div class="col-sm-9">
               <input type="text" name="hbStandard"  <c:if test="${vehicle!=null}">value="${vehicle.hbStandard }"</c:if>   class="form-control" placeholder="环保标准">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">综合工况油耗：</label>
           <div class="col-sm-9">
               <input type="text" name="overallFuelConsumption"  <c:if test="${vehicle!=null}">value="${vehicle.overallFuelConsumption }"</c:if>   class="form-control" placeholder="综合工况油耗">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">市区工况油耗：</label>
           <div class="col-sm-9">
               <input type="text" name="cityFuelConsumption"  <c:if test="${vehicle!=null}">value="${vehicle.cityFuelConsumption }"</c:if>   class="form-control" placeholder="市区工况油耗">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">市郊工况油耗：</label>
           <div class="col-sm-9">
               <input type="text" name="suburbsFuelConsumption"  <c:if test="${vehicle!=null}">value="${vehicle.suburbsFuelConsumption }"</c:if>   class="form-control" placeholder="市郊工况油耗">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">加速时间：</label>
           <div class="col-sm-9">
               <input type="text" name="accelerationTime"  <c:if test="${vehicle!=null}">value="${vehicle.accelerationTime }"</c:if>   class="form-control" placeholder="加速时间">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">最高车速：</label>
           <div class="col-sm-9">
               <input type="text" name="maxSpeed"  <c:if test="${vehicle!=null}">value="${vehicle.maxSpeed }"</c:if>   class="form-control" placeholder="最高车速">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">车辆类型：</label>
           <div class="col-sm-9">
               <input type="text" name="carType"  <c:if test="${vehicle!=null}">value="${vehicle.carType }"</c:if>   class="form-control" placeholder="车辆类型">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">级别：</label>
           <div class="col-sm-9">
               <input type="text" name="carLevel"  <c:if test="${vehicle!=null}">value="${vehicle.carLevel }"</c:if>   class="form-control" placeholder="级别">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">发动机型号：</label>
           <div class="col-sm-9">
               <input type="text" name="engineModel"  <c:if test="${vehicle!=null}">value="${vehicle.engineModel }"</c:if>   class="form-control" placeholder="发动机型号">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">气缸容积：</label>
           <div class="col-sm-9">
               <input type="text" name="displacement"  <c:if test="${vehicle!=null}">value="${vehicle.displacement }"</c:if>   class="form-control" placeholder="气缸容积">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">排量升：</label>
           <div class="col-sm-9">
               <input type="text" name="discharge"  <c:if test="${vehicle!=null}">value="${vehicle.discharge }"</c:if>   class="form-control" placeholder="排量升">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">进气形式：</label>
           <div class="col-sm-9">
               <input type="text" name="jinqiType"  <c:if test="${vehicle!=null}">value="${vehicle.jinqiType }"</c:if>   class="form-control" placeholder="进气形式">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">燃油类型：</label>
           <div class="col-sm-9">
               <input type="text" name="fuelType"  <c:if test="${vehicle!=null}">value="${vehicle.fuelType }"</c:if>   class="form-control" placeholder="燃油类型">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">燃油标号：</label>
           <div class="col-sm-9">
               <input type="text" name="fuelNo"  <c:if test="${vehicle!=null}">value="${vehicle.fuelNo }"</c:if>   class="form-control" placeholder="燃油标号">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">最大马力Ps：</label>
           <div class="col-sm-9">
               <input type="text" name="maxHorsepower"  <c:if test="${vehicle!=null}">value="${vehicle.maxHorsepower }"</c:if>   class="form-control" placeholder="最大马力Ps">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">最大功率值：</label>
           <div class="col-sm-9">
               <input type="text" name="maxPower"  <c:if test="${vehicle!=null}">value="${vehicle.maxPower }"</c:if>   class="form-control" placeholder="最大功率值">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">最大功率转速：</label>
           <div class="col-sm-9">
               <input type="text" name="maxPowerSpeed"  <c:if test="${vehicle!=null}">value="${vehicle.maxPowerSpeed }"</c:if>   class="form-control" placeholder="最大功率转速">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">最大扭矩值：</label>
           <div class="col-sm-9">
               <input type="text" name="maxTorque"  <c:if test="${vehicle!=null}">value="${vehicle.maxTorque }"</c:if>   class="form-control" placeholder="最大扭矩值">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">最大扭矩转速：</label>
           <div class="col-sm-9">
               <input type="text" name="maxTorqueSpeed"  <c:if test="${vehicle!=null}">value="${vehicle.maxTorqueSpeed }"</c:if>   class="form-control" placeholder="最大扭矩转速">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">气缸排列形式：</label>
           <div class="col-sm-9">
               <input type="text" name="displacementType"  <c:if test="${vehicle!=null}">value="${vehicle.displacementType }"</c:if>   class="form-control" placeholder="气缸排列形式">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">气缸数：</label>
           <div class="col-sm-9">
               <input type="text" name="displacementNumber"  <c:if test="${vehicle!=null}">value="${vehicle.displacementNumber }"</c:if>   class="form-control" placeholder="气缸数">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">每缸气门数：</label>
           <div class="col-sm-9">
               <input type="text" name="mgqmNumber"  <c:if test="${vehicle!=null}">value="${vehicle.mgqmNumber }"</c:if>   class="form-control" placeholder="每缸气门数">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">压缩比：</label>
           <div class="col-sm-9">
               <input type="text" name="squeezingRatio"  <c:if test="${vehicle!=null}">value="${vehicle.squeezingRatio }"</c:if>   class="form-control" placeholder="压缩比">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">供油方式：</label>
           <div class="col-sm-9">
               <input type="text" name="supplyMode"  <c:if test="${vehicle!=null}">value="${vehicle.supplyMode }"</c:if>   class="form-control" placeholder="供油方式">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">变速箱类型：</label>
           <div class="col-sm-9">
               <input type="text" name="gearboxType"  <c:if test="${vehicle!=null}">value="${vehicle.gearboxType }"</c:if>   class="form-control" placeholder="变速箱类型">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">变速箱描述：</label>
           <div class="col-sm-9">
               <input type="text" name="gearboxDescribe"  <c:if test="${vehicle!=null}">value="${vehicle.gearboxDescribe }"</c:if>   class="form-control" placeholder="变速箱描述">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">档位数：</label>
           <div class="col-sm-9">
               <input type="text" name="gearNumber"  <c:if test="${vehicle!=null}">value="${vehicle.gearNumber }"</c:if>   class="form-control" placeholder="档位数">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">前制动器类型：</label>
           <div class="col-sm-9">
               <input type="text" name="frontBrakeType"  <c:if test="${vehicle!=null}">value="${vehicle.frontBrakeType }"</c:if>   class="form-control" placeholder="前制动器类型">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">后制动器类型：</label>
           <div class="col-sm-9">
               <input type="text" name="behindBrakeType"  <c:if test="${vehicle!=null}">value="${vehicle.behindBrakeType }"</c:if>   class="form-control" placeholder="后制动器类型">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">前悬挂类型：</label>
           <div class="col-sm-9">
               <input type="text" name="frontSuspensionType"  <c:if test="${vehicle!=null}">value="${vehicle.frontSuspensionType }"</c:if>   class="form-control" placeholder="前悬挂类型">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">后悬挂类型：</label>
           <div class="col-sm-9">
               <input type="text" name="behindSuspensionType"  <c:if test="${vehicle!=null}">value="${vehicle.behindSuspensionType }"</c:if>   class="form-control" placeholder="后悬挂类型">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">转向机形式：</label>
           <div class="col-sm-9">
               <input type="text" name="steerMachineType"  <c:if test="${vehicle!=null}">value="${vehicle.steerMachineType }"</c:if>   class="form-control" placeholder="转向机形式">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">助力类型：</label>
           <div class="col-sm-9">
               <input type="text" name="assistanceType"  <c:if test="${vehicle!=null}">value="${vehicle.assistanceType }"</c:if>   class="form-control" placeholder="助力类型">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">最小离地间隙：</label>
           <div class="col-sm-9">
               <input type="text" name="minGroundClearance"  <c:if test="${vehicle!=null}">value="${vehicle.minGroundClearance }"</c:if>   class="form-control" placeholder="最小离地间隙">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">最小转弯半径：</label>
           <div class="col-sm-9">
               <input type="text" name="minTurningRadius"  <c:if test="${vehicle!=null}">value="${vehicle.minTurningRadius }"</c:if>   class="form-control" placeholder="最小转弯半径">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">发动机位置：</label>
           <div class="col-sm-9">
               <input type="text" name="enginePosition"  <c:if test="${vehicle!=null}">value="${vehicle.enginePosition }"</c:if>   class="form-control" placeholder="发动机位置">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">驱动方式：</label>
           <div class="col-sm-9">
               <input type="text" name="drivingMeans"  <c:if test="${vehicle!=null}">value="${vehicle.drivingMeans }"</c:if>   class="form-control" placeholder="驱动方式">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">驱动形式：</label>
           <div class="col-sm-9">
               <input type="text" name="drivingStyle"  <c:if test="${vehicle!=null}">value="${vehicle.drivingStyle }"</c:if>   class="form-control" placeholder="驱动形式">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">可变悬挂：</label>
           <div class="col-sm-9">
               <input type="text" name="isVariableSuspension"  <c:if test="${vehicle!=null}">value="${vehicle.isVariableSuspension }"</c:if>   class="form-control" placeholder="可变悬挂">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">空气悬挂：</label>
           <div class="col-sm-9">
               <input type="text" name="isAirSuspension"  <c:if test="${vehicle!=null}">value="${vehicle.isAirSuspension }"</c:if>   class="form-control" placeholder="空气悬挂">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">可变转向比：</label>
           <div class="col-sm-9">
               <input type="text" name="isVaribaleSteerRatio"  <c:if test="${vehicle!=null}">value="${vehicle.isVaribaleSteerRatio }"</c:if>   class="form-control" placeholder="可变转向比">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">并线辅助：</label>
           <div class="col-sm-9">
               <input type="text" name="isParallelAuxiliary"  <c:if test="${vehicle!=null}">value="${vehicle.isParallelAuxiliary }"</c:if>   class="form-control" placeholder="并线辅助">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">主动刹车：</label>
           <div class="col-sm-9">
               <input type="text" name="isActiveBraking"  <c:if test="${vehicle!=null}">value="${vehicle.isActiveBraking }"</c:if>   class="form-control" placeholder="主动刹车">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">主动转向系统：</label>
           <div class="col-sm-9">
               <input type="text" name="isActiveSteerSystem"  <c:if test="${vehicle!=null}">value="${vehicle.isActiveSteerSystem }"</c:if>   class="form-control" placeholder="主动转向系统">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">车身型式：</label>
           <div class="col-sm-9">
               <input type="text" name="bodyStyle"  <c:if test="${vehicle!=null}">value="${vehicle.bodyStyle }"</c:if>   class="form-control" placeholder="车身型式">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">高：</label>
           <div class="col-sm-9">
               <input type="text" step="0.01"  name="carLength"  <c:if test="${vehicle!=null}">value="${vehicle.carLength }"</c:if>   class="form-control" placeholder="高">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">宽：</label>
           <div class="col-sm-9">
               <input type="text" step="0.01"  name="carWidth"  <c:if test="${vehicle!=null}">value="${vehicle.carWidth }"</c:if>   class="form-control" placeholder="宽">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">高：</label>
           <div class="col-sm-9">
               <input type="text" step="0.01"  name="carHeight"  <c:if test="${vehicle!=null}">value="${vehicle.carHeight }"</c:if>   class="form-control" placeholder="高">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">轴距：</label>
           <div class="col-sm-9">
               <input type="text" name="wheelbase"  <c:if test="${vehicle!=null}">value="${vehicle.wheelbase }"</c:if>   class="form-control" placeholder="轴距">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">前轮距：</label>
           <div class="col-sm-9">
               <input type="text" step="0.01"  name="trackFront"  <c:if test="${vehicle!=null}">value="${vehicle.trackFront }"</c:if>   class="form-control" placeholder="前轮距">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">后轮距：</label>
           <div class="col-sm-9">
               <input type="text" step="0.01"  name="trackRear"  <c:if test="${vehicle!=null}">value="${vehicle.trackRear }"</c:if>   class="form-control" placeholder="后轮距">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">整备质量：</label>
           <div class="col-sm-9">
               <input type="text" step="0.01"  name="loadWeight"  <c:if test="${vehicle!=null}">value="${vehicle.loadWeight }"</c:if>   class="form-control" placeholder="整备质量">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">满载质量：</label>
           <div class="col-sm-9">
               <input type="text" step="0.01"  name="fullLoadWeight"  <c:if test="${vehicle!=null}">value="${vehicle.fullLoadWeight }"</c:if>   class="form-control" placeholder="满载质量">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">邮箱容积：</label>
           <div class="col-sm-9">
               <input type="text" step="0.01"  name="fluidTankVolume"  <c:if test="${vehicle!=null}">value="${vehicle.fluidTankVolume }"</c:if>   class="form-control" placeholder="邮箱容积">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">行李箱容积：</label>
           <div class="col-sm-9">
               <input type="text" step="0.01"  name="luggageVolume"  <c:if test="${vehicle!=null}">value="${vehicle.luggageVolume }"</c:if>   class="form-control" placeholder="行李箱容积">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">车门数：</label>
           <div class="col-sm-9">
               <input type="text"   name="doorNumber"  <c:if test="${vehicle!=null}">value="${vehicle.doorNumber }"</c:if>   class="form-control" placeholder="车门数">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">座位数：</label>
           <div class="col-sm-9">
               <input type="text"   name="seatNumber"  <c:if test="${vehicle!=null}">value="${vehicle.seatNumber }"</c:if>   class="form-control" placeholder="座位数">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">前轮胎规格：</label>
           <div class="col-sm-9">
               <input type="text" name="frontTireSize"  <c:if test="${vehicle!=null}">value="${vehicle.frontTireSize }"</c:if>   class="form-control" placeholder="前轮胎规格">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">后轮胎规格：</label>
           <div class="col-sm-9">
               <input type="text" name="rearTireSize"  <c:if test="${vehicle!=null}">value="${vehicle.rearTireSize }"</c:if>   class="form-control" placeholder="后轮胎规格">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">前轮毂规格：</label>
           <div class="col-sm-9">
               <input type="text" name="frontHubSize"  <c:if test="${vehicle!=null}">value="${vehicle.frontHubSize }"</c:if>   class="form-control" placeholder="前轮毂规格">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">后轮毂规格：</label>
           <div class="col-sm-9">
               <input type="text" name="rearHubSize"  <c:if test="${vehicle!=null}">value="${vehicle.rearHubSize }"</c:if>   class="form-control" placeholder="后轮毂规格">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">轮毂材料：</label>
           <div class="col-sm-9">
               <input type="text" name="hubMaterial"  <c:if test="${vehicle!=null}">value="${vehicle.hubMaterial }"</c:if>   class="form-control" placeholder="轮毂材料">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">备胎规格：</label>
           <div class="col-sm-9">
               <input type="text" name="spareTireSize"  <c:if test="${vehicle!=null}">value="${vehicle.spareTireSize }"</c:if>   class="form-control" placeholder="备胎规格">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">驾驶座安全气囊：</label>
           <div class="col-sm-9">
               <input type="text" name="isDriveAirbag"  <c:if test="${vehicle!=null}">value="${vehicle.isDriveAirbag }"</c:if>   class="form-control" placeholder="驾驶座安全气囊">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">副驾驶安全气囊：</label>
           <div class="col-sm-9">
               <input type="text" name="isCopilotAirbag"  <c:if test="${vehicle!=null}">value="${vehicle.isCopilotAirbag }"</c:if>   class="form-control" placeholder="副驾驶安全气囊">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">前排侧气囊：</label>
           <div class="col-sm-9">
               <input type="text" name="isFrontSidebag"  <c:if test="${vehicle!=null}">value="${vehicle.isFrontSidebag }"</c:if>   class="form-control" placeholder="前排侧气囊">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">后排侧气囊：</label>
           <div class="col-sm-9">
               <input type="text" name="isRearSidebag"  <c:if test="${vehicle!=null}">value="${vehicle.isRearSidebag }"</c:if>   class="form-control" placeholder="后排侧气囊">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">前排头部气囊(气帘)：</label>
           <div class="col-sm-9">
               <input type="text" name="isFrontHeadGasbag"  <c:if test="${vehicle!=null}">value="${vehicle.isFrontHeadGasbag }"</c:if>   class="form-control" placeholder="前排头部气囊(气帘)">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">后排头部气囊(气帘)：</label>
           <div class="col-sm-9">
               <input type="text" name="isRearHeadGasbag"  <c:if test="${vehicle!=null}">value="${vehicle.isRearHeadGasbag }"</c:if>   class="form-control" placeholder="后排头部气囊(气帘)">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">膝部气囊：</label>
           <div class="col-sm-9">
               <input type="text" name="isKneeGasbag"  <c:if test="${vehicle!=null}">value="${vehicle.isKneeGasbag }"</c:if>   class="form-control" placeholder="膝部气囊">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">胎压监测装置：</label>
           <div class="col-sm-9">
               <input type="text" name="isTpmsMachine"  <c:if test="${vehicle!=null}">value="${vehicle.isTpmsMachine }"</c:if>   class="form-control" placeholder="胎压监测装置">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">零胎压继续行驶：</label>
           <div class="col-sm-9">
               <input type="text" name="isDriveNotirePressure"  <c:if test="${vehicle!=null}">value="${vehicle.isDriveNotirePressure }"</c:if>   class="form-control" placeholder="零胎压继续行驶">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">安全带未系提示：</label>
           <div class="col-sm-9">
               <input type="text" name="isSeatBeltRemind"  <c:if test="${vehicle!=null}">value="${vehicle.isSeatBeltRemind }"</c:if>   class="form-control" placeholder="安全带未系提示">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">ISO FIX儿童座椅接口：</label>
           <div class="col-sm-9">
               <input type="text" name="isIsofixChildseatJoint"  <c:if test="${vehicle!=null}">value="${vehicle.isIsofixChildseatJoint }"</c:if>   class="form-control" placeholder="ISO FIX儿童座椅接口">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">LATCH座椅接口：</label>
           <div class="col-sm-9">
               <input type="text" name="isLatchSeatJoint"  <c:if test="${vehicle!=null}">value="${vehicle.isLatchSeatJoint }"</c:if>   class="form-control" placeholder="LATCH座椅接口">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">发动机电子防盗：</label>
           <div class="col-sm-9">
               <input type="text" name="isEngineEas"  <c:if test="${vehicle!=null}">value="${vehicle.isEngineEas }"</c:if>   class="form-control" placeholder="发动机电子防盗">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">中控锁：</label>
           <div class="col-sm-9">
               <input type="text" name="isCentralControlledLock"  <c:if test="${vehicle!=null}">value="${vehicle.isCentralControlledLock }"</c:if>   class="form-control" placeholder="中控锁">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">遥控钥匙：</label>
           <div class="col-sm-9">
               <input type="text" name="isTelecontrolKey"  <c:if test="${vehicle!=null}">value="${vehicle.isTelecontrolKey }"</c:if>   class="form-control" placeholder="遥控钥匙">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">无钥匙启动系统：</label>
           <div class="col-sm-9">
               <input type="text" name="isNokeyStartSystem"  <c:if test="${vehicle!=null}">value="${vehicle.isNokeyStartSystem }"</c:if>   class="form-control" placeholder="无钥匙启动系统">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">ABS防抱死：</label>
           <div class="col-sm-9">
               <input type="text" name="isAbsAntilock"  <c:if test="${vehicle!=null}">value="${vehicle.isAbsAntilock }"</c:if>   class="form-control" placeholder="ABS防抱死">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">自动泊车入位：</label>
           <div class="col-sm-9">
               <input type="text" name="isAutomaticParking"  <c:if test="${vehicle!=null}">value="${vehicle.isAutomaticParking }"</c:if>   class="form-control" placeholder="自动泊车入位">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">夜视系统：</label>
           <div class="col-sm-9">
               <input type="text" name="isNightVisionSystem"  <c:if test="${vehicle!=null}">value="${vehicle.isNightVisionSystem }"</c:if>   class="form-control" placeholder="夜视系统">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">定速巡航：</label>
           <div class="col-sm-9">
               <input type="text" name="isCruiseSpeed"  <c:if test="${vehicle!=null}">value="${vehicle.isCruiseSpeed }"</c:if>   class="form-control" placeholder="定速巡航">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">泊车辅助：</label>
           <div class="col-sm-9">
               <input type="text" name="isAuxiliaryParking"  <c:if test="${vehicle!=null}">value="${vehicle.isAuxiliaryParking }"</c:if>   class="form-control" placeholder="泊车辅助">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">倒车视频影像：</label>
           <div class="col-sm-9">
               <input type="text" name="isReverseVideo"  <c:if test="${vehicle!=null}">value="${vehicle.isReverseVideo }"</c:if>   class="form-control" placeholder="倒车视频影像">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">制动力分配(EBD/CBC等)：</label>
           <div class="col-sm-9">
               <input type="text" name="isBrakeForceDistribution"  <c:if test="${vehicle!=null}">value="${vehicle.isBrakeForceDistribution }"</c:if>   class="form-control" placeholder="制动力分配(EBD/CBC等)">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">刹车辅助(EBA/BAS/BA等)：</label>
           <div class="col-sm-9">
               <input type="text" name="isAuxiliaryBrake"  <c:if test="${vehicle!=null}">value="${vehicle.isAuxiliaryBrake }"</c:if>   class="form-control" placeholder="刹车辅助(EBA/BAS/BA等)">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">牵引力控制(ASR/TCS/TRC等)：</label>
           <div class="col-sm-9">
               <input type="text" name="isTractionControl"  <c:if test="${vehicle!=null}">value="${vehicle.isTractionControl }"</c:if>   class="form-control" placeholder="牵引力控制(ASR/TCS/TRC等)">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">车身稳定控制(ESP/DSC/VSC等)：</label>
           <div class="col-sm-9">
               <input type="text" name="isVehicleStabilityControl"  <c:if test="${vehicle!=null}">value="${vehicle.isVehicleStabilityControl }"</c:if>   class="form-control" placeholder="车身稳定控制(ESP/DSC/VSC等)">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">自动驻车;上坡辅助：</label>
           <div class="col-sm-9">
               <input type="text" name="isAutoParkBrake"  <c:if test="${vehicle!=null}">value="${vehicle.isAutoParkBrake }"</c:if>   class="form-control" placeholder="自动驻车;上坡辅助">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">陡坡缓降：</label>
           <div class="col-sm-9">
               <input type="text" name="isBluffDescending"  <c:if test="${vehicle!=null}">value="${vehicle.isBluffDescending }"</c:if>   class="form-control" placeholder="陡坡缓降">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">真皮方向盘：</label>
           <div class="col-sm-9">
               <input type="text" name="isDermisSteeringWheel"  <c:if test="${vehicle!=null}">value="${vehicle.isDermisSteeringWheel }"</c:if>   class="form-control" placeholder="真皮方向盘">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">方向盘上下调节：</label>
           <div class="col-sm-9">
               <input type="text" name="isWheelUpdownControl"  <c:if test="${vehicle!=null}">value="${vehicle.isWheelUpdownControl }"</c:if>   class="form-control" placeholder="方向盘上下调节">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">方向盘前后调节：</label>
           <div class="col-sm-9">
               <input type="text" name="isWheelBehindafterControl"  <c:if test="${vehicle!=null}">value="${vehicle.isWheelBehindafterControl }"</c:if>   class="form-control" placeholder="方向盘前后调节">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">方向盘电动调节：</label>
           <div class="col-sm-9">
               <input type="text" name="isWheelAutoControl"  <c:if test="${vehicle!=null}">value="${vehicle.isWheelAutoControl }"</c:if>   class="form-control" placeholder="方向盘电动调节">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">多功能方向盘：</label>
           <div class="col-sm-9">
               <input type="text" name="isNultiFunctionWheel"  <c:if test="${vehicle!=null}">value="${vehicle.isNultiFunctionWheel }"</c:if>   class="form-control" placeholder="多功能方向盘">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">方向盘换挡：</label>
           <div class="col-sm-9">
               <input type="text" name="isWheelShift"  <c:if test="${vehicle!=null}">value="${vehicle.isWheelShift }"</c:if>   class="form-control" placeholder="方向盘换挡">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">真皮座椅：</label>
           <div class="col-sm-9">
               <input type="text" name="isDermisSeat"  <c:if test="${vehicle!=null}">value="${vehicle.isDermisSeat }"</c:if>   class="form-control" placeholder="真皮座椅">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">运动座椅：</label>
           <div class="col-sm-9">
               <input type="text" name="isExerciseSeat"  <c:if test="${vehicle!=null}">value="${vehicle.isExerciseSeat }"</c:if>   class="form-control" placeholder="运动座椅">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">座椅高低调节：</label>
           <div class="col-sm-9">
               <input type="text" name="isSeatControlHeight"  <c:if test="${vehicle!=null}">value="${vehicle.isSeatControlHeight }"</c:if>   class="form-control" placeholder="座椅高低调节">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">腰部支撑调节：</label>
           <div class="col-sm-9">
               <input type="text" name="isWaistSupportControl"  <c:if test="${vehicle!=null}">value="${vehicle.isWaistSupportControl }"</c:if>   class="form-control" placeholder="腰部支撑调节">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">肩部支撑调节：</label>
           <div class="col-sm-9">
               <input type="text" name="isShoulderSupportControl"  <c:if test="${vehicle!=null}">value="${vehicle.isShoulderSupportControl }"</c:if>   class="form-control" placeholder="肩部支撑调节">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">驾驶座座椅电动调节：</label>
           <div class="col-sm-9">
               <input type="text" name="isDriveSeatEcontrol"  <c:if test="${vehicle!=null}">value="${vehicle.isDriveSeatEcontrol }"</c:if>   class="form-control" placeholder="驾驶座座椅电动调节">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">副驾驶座座椅电动调节：</label>
           <div class="col-sm-9">
               <input type="text" name="isCoseatEcontrol"  <c:if test="${vehicle!=null}">value="${vehicle.isCoseatEcontrol }"</c:if>   class="form-control" placeholder="副驾驶座座椅电动调节">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">第二排靠背角度调节：</label>
           <div class="col-sm-9">
               <input type="text" name="isSeconeSeatAngleAdjust"  <c:if test="${vehicle!=null}">value="${vehicle.isSeconeSeatAngleAdjust }"</c:if>   class="form-control" placeholder="第二排靠背角度调节">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">第二排座椅移动：</label>
           <div class="col-sm-9">
               <input type="text" name="isSeconeSeatMovement"  <c:if test="${vehicle!=null}">value="${vehicle.isSeconeSeatMovement }"</c:if>   class="form-control" placeholder="第二排座椅移动">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">后排座椅电动调节：</label>
           <div class="col-sm-9">
               <input type="text" name="isRearSeatEcontrol"  <c:if test="${vehicle!=null}">value="${vehicle.isRearSeatEcontrol }"</c:if>   class="form-control" placeholder="后排座椅电动调节">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">电动座椅记忆：</label>
           <div class="col-sm-9">
               <input type="text" name="isEseatMemory"  <c:if test="${vehicle!=null}">value="${vehicle.isEseatMemory }"</c:if>   class="form-control" placeholder="电动座椅记忆">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">前排座椅加热：</label>
           <div class="col-sm-9">
               <input type="text" name="isFrontSeatHeating"  <c:if test="${vehicle!=null}">value="${vehicle.isFrontSeatHeating }"</c:if>   class="form-control" placeholder="前排座椅加热">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">后排座椅加热：</label>
           <div class="col-sm-9">
               <input type="text" name="isRearSeatHeating"  <c:if test="${vehicle!=null}">value="${vehicle.isRearSeatHeating }"</c:if>   class="form-control" placeholder="后排座椅加热">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">座椅通风：</label>
           <div class="col-sm-9">
               <input type="text" name="isSeatVentilation"  <c:if test="${vehicle!=null}">value="${vehicle.isSeatVentilation }"</c:if>   class="form-control" placeholder="座椅通风">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">座椅按摩：</label>
           <div class="col-sm-9">
               <input type="text" name="isSeatMassage"  <c:if test="${vehicle!=null}">value="${vehicle.isSeatMassage }"</c:if>   class="form-control" placeholder="座椅按摩">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">后排座椅整体放倒：</label>
           <div class="col-sm-9">
               <input type="text" name="isRearSeatAllDrop"  <c:if test="${vehicle!=null}">value="${vehicle.isRearSeatAllDrop }"</c:if>   class="form-control" placeholder="后排座椅整体放倒">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">后排座椅比例放倒：</label>
           <div class="col-sm-9">
               <input type="text" name="isRearSeatRatioDrop"  <c:if test="${vehicle!=null}">value="${vehicle.isRearSeatRatioDrop }"</c:if>   class="form-control" placeholder="后排座椅比例放倒">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">第三排座椅：</label>
           <div class="col-sm-9">
               <input type="text" name="isThirdSeat"  <c:if test="${vehicle!=null}">value="${vehicle.isThirdSeat }"</c:if>   class="form-control" placeholder="第三排座椅">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">前座中央扶手：</label>
           <div class="col-sm-9">
               <input type="text" name="isFrontSeatArmrest"  <c:if test="${vehicle!=null}">value="${vehicle.isFrontSeatArmrest }"</c:if>   class="form-control" placeholder="前座中央扶手">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">后座中央扶手：</label>
           <div class="col-sm-9">
               <input type="text" name="isRearSeatArmrest"  <c:if test="${vehicle!=null}">value="${vehicle.isRearSeatArmrest }"</c:if>   class="form-control" placeholder="后座中央扶手">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">后排杯架：</label>
           <div class="col-sm-9">
               <input type="text" name="isBackCupStand"  <c:if test="${vehicle!=null}">value="${vehicle.isBackCupStand }"</c:if>   class="form-control" placeholder="后排杯架">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">车内氛围灯：</label>
           <div class="col-sm-9">
               <input type="text" name="isInsideAtmosphereLight"  <c:if test="${vehicle!=null}">value="${vehicle.isInsideAtmosphereLight }"</c:if>   class="form-control" placeholder="车内氛围灯">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">后风挡遮阳帘：</label>
           <div class="col-sm-9">
               <input type="text" name="isBackSunBlind"  <c:if test="${vehicle!=null}">value="${vehicle.isBackSunBlind }"</c:if>   class="form-control" placeholder="后风挡遮阳帘">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">后排侧遮阳帘：</label>
           <div class="col-sm-9">
               <input type="text" name="isRearSideSunBlind"  <c:if test="${vehicle!=null}">value="${vehicle.isRearSideSunBlind }"</c:if>   class="form-control" placeholder="后排侧遮阳帘">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">遮阳板化妆镜：</label>
           <div class="col-sm-9">
               <input type="text" name="isAwnindMirror"  <c:if test="${vehicle!=null}">value="${vehicle.isAwnindMirror }"</c:if>   class="form-control" placeholder="遮阳板化妆镜">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">行车电脑显示屏：</label>
           <div class="col-sm-9">
               <input type="text" name="isDriveComputerDisplay"  <c:if test="${vehicle!=null}">value="${vehicle.isDriveComputerDisplay }"</c:if>   class="form-control" placeholder="行车电脑显示屏">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">外接音源接口(AUX/USB/iPod等)：</label>
           <div class="col-sm-9">
               <input type="text" name="isOutSoundInterface"  <c:if test="${vehicle!=null}">value="${vehicle.isOutSoundInterface }"</c:if>   class="form-control" placeholder="外接音源接口(AUX/USB/iPod等)">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">音频支持MP3：</label>
           <div class="col-sm-9">
               <input type="text" name="isAudioSupportMp3"  <c:if test="${vehicle!=null}">value="${vehicle.isAudioSupportMp3 }"</c:if>   class="form-control" placeholder="音频支持MP3">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">单碟CD：</label>
           <div class="col-sm-9">
               <input type="text" name="isSinglePlateCd"  <c:if test="${vehicle!=null}">value="${vehicle.isSinglePlateCd }"</c:if>   class="form-control" placeholder="单碟CD">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">多碟CD：</label>
           <div class="col-sm-9">
               <input type="text" name="isManyPlateCd"  <c:if test="${vehicle!=null}">value="${vehicle.isManyPlateCd }"</c:if>   class="form-control" placeholder="多碟CD">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">虚拟多碟CD：</label>
           <div class="col-sm-9">
               <input type="text" name="isVirtualManyPlateCd"  <c:if test="${vehicle!=null}">value="${vehicle.isVirtualManyPlateCd }"</c:if>   class="form-control" placeholder="虚拟多碟CD">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">单碟DVD：</label>
           <div class="col-sm-9">
               <input type="text" name="isSinglePlateDvd"  <c:if test="${vehicle!=null}">value="${vehicle.isSinglePlateDvd }"</c:if>   class="form-control" placeholder="单碟DVD">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">多碟DVD：</label>
           <div class="col-sm-9">
               <input type="text" name="isManyPlateDvd"  <c:if test="${vehicle!=null}">value="${vehicle.isManyPlateDvd }"</c:if>   class="form-control" placeholder="多碟DVD">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">扬声器数量：</label>
           <div class="col-sm-9">
               <input type="text" name="isLoudspeakerNumber"  <c:if test="${vehicle!=null}">value="${vehicle.isLoudspeakerNumber }"</c:if>   class="form-control" placeholder="扬声器数量">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">空调：</label>
           <div class="col-sm-9">
               <input type="text" name="isAirAonditioner"  <c:if test="${vehicle!=null}">value="${vehicle.isAirAonditioner }"</c:if>   class="form-control" placeholder="空调">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">自动空调：</label>
           <div class="col-sm-9">
               <input type="text" name="isAutoAirAonditioner"  <c:if test="${vehicle!=null}">value="${vehicle.isAutoAirAonditioner }"</c:if>   class="form-control" placeholder="自动空调">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">后排独立空调：</label>
           <div class="col-sm-9">
               <input type="text" name="isBackAirAonditioner"  <c:if test="${vehicle!=null}">value="${vehicle.isBackAirAonditioner }"</c:if>   class="form-control" placeholder="后排独立空调">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">后座出风口：</label>
           <div class="col-sm-9">
               <input type="text" name="isRearSeatOutlet"  <c:if test="${vehicle!=null}">value="${vehicle.isRearSeatOutlet }"</c:if>   class="form-control" placeholder="后座出风口">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">温度分区控制：</label>
           <div class="col-sm-9">
               <input type="text" name="isTempDistrubControl"  <c:if test="${vehicle!=null}">value="${vehicle.isTempDistrubControl }"</c:if>   class="form-control" placeholder="温度分区控制">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">空气调节/花粉过滤：</label>
           <div class="col-sm-9">
               <input type="text" name="isAirCondictioning"  <c:if test="${vehicle!=null}">value="${vehicle.isAirCondictioning }"</c:if>   class="form-control" placeholder="空气调节/花粉过滤">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">车载冰箱：</label>
           <div class="col-sm-9">
               <input type="text" name="isCarRefrigerator"  <c:if test="${vehicle!=null}">value="${vehicle.isCarRefrigerator }"</c:if>   class="form-control" placeholder="车载冰箱">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">HUD抬头数字显示：</label>
           <div class="col-sm-9">
               <input type="text" name="isHudNumberDisplay"  <c:if test="${vehicle!=null}">value="${vehicle.isHudNumberDisplay }"</c:if>   class="form-control" placeholder="HUD抬头数字显示">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">GPS导航：</label>
           <div class="col-sm-9">
               <input type="text" name="isGpsNavigation"  <c:if test="${vehicle!=null}">value="${vehicle.isGpsNavigation }"</c:if>   class="form-control" placeholder="GPS导航">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">定位互动服务：</label>
           <div class="col-sm-9">
               <input type="text" name="isLocateInteractiveService"  <c:if test="${vehicle!=null}">value="${vehicle.isLocateInteractiveService }"</c:if>   class="form-control" placeholder="定位互动服务">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">中控台彩色大屏：</label>
           <div class="col-sm-9">
               <input type="text" name="isCentralControlScreen"  <c:if test="${vehicle!=null}">value="${vehicle.isCentralControlScreen }"</c:if>   class="form-control" placeholder="中控台彩色大屏">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">人机交互系统：</label>
           <div class="col-sm-9">
               <input type="text" name="isHumanComputerSystem"  <c:if test="${vehicle!=null}">value="${vehicle.isHumanComputerSystem }"</c:if>   class="form-control" placeholder="人机交互系统">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">内置硬盘：</label>
           <div class="col-sm-9">
               <input type="text" name="isInsideHarddisc"  <c:if test="${vehicle!=null}">value="${vehicle.isInsideHarddisc }"</c:if>   class="form-control" placeholder="内置硬盘">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">蓝牙;车载电话：</label>
           <div class="col-sm-9">
               <input type="text" name="isBluetoothCarphone"  <c:if test="${vehicle!=null}">value="${vehicle.isBluetoothCarphone }"</c:if>   class="form-control" placeholder="蓝牙;车载电话">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">车载电视：</label>
           <div class="col-sm-9">
               <input type="text" name="isCarTv"  <c:if test="${vehicle!=null}">value="${vehicle.isCarTv }"</c:if>   class="form-control" placeholder="车载电视">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">后排液晶屏：</label>
           <div class="col-sm-9">
               <input type="text" name="isRearScreen"  <c:if test="${vehicle!=null}">value="${vehicle.isRearScreen }"</c:if>   class="form-control" placeholder="后排液晶屏">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">中控液晶屏分屏显示：</label>
           <div class="col-sm-9">
               <input type="text" name="isCentralScreenDivdisplay"  <c:if test="${vehicle!=null}">value="${vehicle.isCentralScreenDivdisplay }"</c:if>   class="form-control" placeholder="中控液晶屏分屏显示">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">自适应巡航：</label>
           <div class="col-sm-9">
               <input type="text" name="isAdaptiveCruiseControl"  <c:if test="${vehicle!=null}">value="${vehicle.isAdaptiveCruiseControl }"</c:if>   class="form-control" placeholder="自适应巡航">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">全景摄像头：</label>
           <div class="col-sm-9">
               <input type="text" name="isAllsideCamera"  <c:if test="${vehicle!=null}">value="${vehicle.isAllsideCamera }"</c:if>   class="form-control" placeholder="全景摄像头">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">倒车雷达：</label>
           <div class="col-sm-9">
               <input type="text" name="isReverseRadar"  <c:if test="${vehicle!=null}">value="${vehicle.isReverseRadar }"</c:if>   class="form-control" placeholder="倒车雷达">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">车载信息服务：</label>
           <div class="col-sm-9">
               <input type="text" name="isTelematics"  <c:if test="${vehicle!=null}">value="${vehicle.isTelematics }"</c:if>   class="form-control" placeholder="车载信息服务">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">电动后备箱：</label>
           <div class="col-sm-9">
               <input type="text" name="isPowerBackBox"  <c:if test="${vehicle!=null}">value="${vehicle.isPowerBackBox }"</c:if>   class="form-control" placeholder="电动后备箱">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">运动外观套件：</label>
           <div class="col-sm-9">
               <input type="text" name="isExerciseOutSuite"  <c:if test="${vehicle!=null}">value="${vehicle.isExerciseOutSuite }"</c:if>   class="form-control" placeholder="运动外观套件">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">电动吸合门：</label>
           <div class="col-sm-9">
               <input type="text" name="isElectricDoor"  <c:if test="${vehicle!=null}">value="${vehicle.isElectricDoor }"</c:if>   class="form-control" placeholder="电动吸合门">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">电动天窗：</label>
           <div class="col-sm-9">
               <input type="text" name="isElectricWindow"  <c:if test="${vehicle!=null}">value="${vehicle.isElectricWindow }"</c:if>   class="form-control" placeholder="电动天窗">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">全景天窗：</label>
           <div class="col-sm-9">
               <input type="text" name="isFullWindow"  <c:if test="${vehicle!=null}">value="${vehicle.isFullWindow }"</c:if>   class="form-control" placeholder="全景天窗">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">氙气大灯：</label>
           <div class="col-sm-9">
               <input type="text" name="isXenonLight"  <c:if test="${vehicle!=null}">value="${vehicle.isXenonLight }"</c:if>   class="form-control" placeholder="氙气大灯">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">LED大灯：</label>
           <div class="col-sm-9">
               <input type="text" name="isLedLight"  <c:if test="${vehicle!=null}">value="${vehicle.isLedLight }"</c:if>   class="form-control" placeholder="LED大灯">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">日间行车灯：</label>
           <div class="col-sm-9">
               <input type="text" name="isDaylightDriveLight"  <c:if test="${vehicle!=null}">value="${vehicle.isDaylightDriveLight }"</c:if>   class="form-control" placeholder="日间行车灯">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">自动头灯：</label>
           <div class="col-sm-9">
               <input type="text" name="isAutoHeadLight"  <c:if test="${vehicle!=null}">value="${vehicle.isAutoHeadLight }"</c:if>   class="form-control" placeholder="自动头灯">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">转向头灯：</label>
           <div class="col-sm-9">
               <input type="text" name="isSteerHeadLight"  <c:if test="${vehicle!=null}">value="${vehicle.isSteerHeadLight }"</c:if>   class="form-control" placeholder="转向头灯">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">前雾灯：</label>
           <div class="col-sm-9">
               <input type="text" name="isFogLamp"  <c:if test="${vehicle!=null}">value="${vehicle.isFogLamp }"</c:if>   class="form-control" placeholder="前雾灯">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">大灯高度可调：</label>
           <div class="col-sm-9">
               <input type="text" name="isLightHeightAdjust"  <c:if test="${vehicle!=null}">value="${vehicle.isLightHeightAdjust }"</c:if>   class="form-control" placeholder="大灯高度可调">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">大灯清洗装置：</label>
           <div class="col-sm-9">
               <input type="text" name="isLightCleanMachine"  <c:if test="${vehicle!=null}">value="${vehicle.isLightCleanMachine }"</c:if>   class="form-control" placeholder="大灯清洗装置">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">前电动车窗：</label>
           <div class="col-sm-9">
               <input type="text" name="isFrontElectricWindow"  <c:if test="${vehicle!=null}">value="${vehicle.isFrontElectricWindow }"</c:if>   class="form-control" placeholder="前电动车窗">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">后电动车窗：</label>
           <div class="col-sm-9">
               <input type="text" name="isRearElectricWindow"  <c:if test="${vehicle!=null}">value="${vehicle.isRearElectricWindow }"</c:if>   class="form-control" placeholder="后电动车窗">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">车窗防夹手功能：</label>
           <div class="col-sm-9">
               <input type="text" name="isWindowClampProof"  <c:if test="${vehicle!=null}">value="${vehicle.isWindowClampProof }"</c:if>   class="form-control" placeholder="车窗防夹手功能">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">隔热玻璃：</label>
           <div class="col-sm-9">
               <input type="text" name="isHeatInsulatingGlass"  <c:if test="${vehicle!=null}">value="${vehicle.isHeatInsulatingGlass }"</c:if>   class="form-control" placeholder="隔热玻璃">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">后视镜电动调节：</label>
           <div class="col-sm-9">
               <input type="text" name="isRearviewMirrorAdjust"  <c:if test="${vehicle!=null}">value="${vehicle.isRearviewMirrorAdjust }"</c:if>   class="form-control" placeholder="后视镜电动调节">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">后视镜加热：</label>
           <div class="col-sm-9">
               <input type="text" name="isRearviewMirrorHeat"  <c:if test="${vehicle!=null}">value="${vehicle.isRearviewMirrorHeat }"</c:if>   class="form-control" placeholder="后视镜加热">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">后视镜自动防眩目：</label>
           <div class="col-sm-9">
               <input type="text" name="isRearviewMirrorAntidazzle"  <c:if test="${vehicle!=null}">value="${vehicle.isRearviewMirrorAntidazzle }"</c:if>   class="form-control" placeholder="后视镜自动防眩目">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">后视镜电动折叠：</label>
           <div class="col-sm-9">
               <input type="text" name="isRearviewMirrorEfold"  <c:if test="${vehicle!=null}">value="${vehicle.isRearviewMirrorEfold }"</c:if>   class="form-control" placeholder="后视镜电动折叠">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">后视镜记忆：</label>
           <div class="col-sm-9">
               <input type="text" name="isRearviewMirrorMemory"  <c:if test="${vehicle!=null}">value="${vehicle.isRearviewMirrorMemory }"</c:if>   class="form-control" placeholder="后视镜记忆">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">后雨刷：</label>
           <div class="col-sm-9">
               <input type="text" name="isRearWiper"  <c:if test="${vehicle!=null}">value="${vehicle.isRearWiper }"</c:if>   class="form-control" placeholder="后雨刷">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">感应雨刷：</label>
           <div class="col-sm-9">
               <input type="text" name="isInductionWiper"  <c:if test="${vehicle!=null}">value="${vehicle.isInductionWiper }"</c:if>   class="form-control" placeholder="感应雨刷">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">车辆识别码：</label>
           <div class="col-sm-9">
               <input type="text" name="carIdentifyNumber"  <c:if test="${vehicle!=null}">value="${vehicle.carIdentifyNumber }"</c:if>   class="form-control" placeholder="车辆识别码">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">备注：</label>
           <div class="col-sm-9">
               <input type="text" name="remark"  <c:if test="${vehicle!=null}">value="${vehicle.remark }"</c:if>   class="form-control" placeholder="备注">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">品牌码：</label>
           <div class="col-sm-9">
               <input type="text" name="brandCode"  <c:if test="${vehicle!=null}">value="${vehicle.brandCode }"</c:if>   class="form-control" placeholder="品牌码">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">车系码：</label>
           <div class="col-sm-9">
               <input type="text" name="familyCode"  <c:if test="${vehicle!=null}">value="${vehicle.familyCode }"</c:if>   class="form-control" placeholder="车系码">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">0:合资,1:国产,2:进口：</label>
           <div class="col-sm-9">
               <input type="number"  name="produceptnCode"  <c:if test="${vehicle!=null}">value="${vehicle.produceptnCode }"</c:if>   class="form-control" placeholder="0:合资,1:国产,2:进口">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">0:未指定,1:手动,2:自动,3:手自一体：</label>
           <div class="col-sm-9">
               <input type="number"  name="gearboxTypeCode"  <c:if test="${vehicle!=null}">value="${vehicle.gearboxTypeCode }"</c:if>   class="form-control" placeholder="0:未指定,1:手动,2:自动,3:手自一体">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">唯一车系码：</label>
           <div class="col-sm-9">
               <input type="text" name="familyCar"  <c:if test="${vehicle!=null}">value="${vehicle.familyCar }"</c:if>   class="form-control" placeholder="唯一车系码">
           </div>
       </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">ISENABLE：</label>
           <div class="col-sm-9">
               <input type="text" name="isEnable"  <c:if test="${vehicle!=null}">value="${vehicle.isEnable }"</c:if>   class="form-control" placeholder="ISENABLE">
           </div>
       </div>

       <div class="form-group">
            <label class="col-sm-2 control-label">其他信息：</label>
            <div class="col-sm-9">
                <c:if test="${vehicle.createDate!=null}">
                <p class="form-control-static">创建时间：<fmt:formatDate value="${vehicle.createDate }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></p>
                </c:if>
                <c:if test="${vehicle.modifyDate!=null}">
                <p class="form-control-static">最后一次修改时间：<fmt:formatDate value="${vehicle.modifyDate }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></p>
                </c:if>
                <c:if test="${vehicle.createUser!=null}">
                <p class="form-control-static">创建管理员：${vehicle.createUser.adminName }</p>
                </c:if>
                <c:if test="${vehicle.modifyUser!=null}">
                <p class="form-control-static">最后修改管理员：${vehicle.modifyUser.adminName }</p>
                </c:if>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-3">
               <c:choose>

                    <c:when test="${vehicle==null}">
                        <button type="submit" class="btn btn-info btn-block">创建</button>
                    </c:when>

                    <c:otherwise>
                        <input type="hidden" name="id" value="${vehicle.sysModelId }">
                        <button type="submit" class="btn btn-info btn-block">修改</button>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>
    </form>
</div>

<script type="text/javascript">
    $(function(){
        $("#activityEditForm").bootstrapValidator(/*{
            fields: {
                name: {
                    validators: {
                        notEmpty: {
                            message: '活动名称不能为空不能为空'
                        },
                        stringLength:{
                            max : 64,
                            message : '最多64个字符'
                        }
                    }
                },
                toUrl:{
                  validators:{
                      notEmpty:{
                          message:'活动地址不能为空'
                      }
                  }
                },
                startTime: {
                    validators: {
                        notEmpty: {
                            message: '活动开始时间不能为空'
                        },
                        regexp: {
                            regexp: /^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])\s+(20|21|22|23|[0-1]\d):[0-5]\d:[0-5]\d$/,
                            message: '请输入正确的日期（日期格式为：年年年年-月月-日日 时时:分分:秒秒）。'
                        }
                    }
                },
                endTime: {
                    validators: {
                        notEmpty: {
                            message: '活动结束时间不能为空'
                        },
                        regexp: {
                            regexp: /^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])\s+(20|21|22|23|[0-1]\d):[0-5]\d:[0-5]\d$/,
                            message: '请输入正确的日期（日期格式为：年年年年-月月-日日 时时:分分:秒秒）。'
                        }
                    }
                },
                status:{
                    validator:{
                        notEmpty:{
                            message:'活动类型不能为空'
                        }
                    }
                }
            }
        }*/).on('success.form.bv', function(e) {
            e.preventDefault();
            if($("#imgUrl").val()==""){
                toast(2, "", "请上传图片");
                $("button[type=submit]").removeAttr("disabled");
                return;
            }
            var inputs = new Array();
            inputs = $("[type='number']");
            for(var i = 0; i < inputs.length;i++){
                if(inputs[i].value==null||inputs[i].value<0){
                    toast(2, "", inputs[i].placeholder+"数据小于零");
                    return;
                }
            }
           /* inputs = $("[type='text']");
            for(var i = 0; i < inputs.length;i++){
                if(inputs[i].value==null||inputs[i].value==""){
                    toast(2, "", inputs[i].placeholder+"数据为空");
                    return;
                }
            }*/
            var $form = $(e.target);
            Ajax.ajax({
                url: '${ctx}/admin/vehicle/updateOrInsertVehicle.do',
                type:'post',
                params: $form.serialize(),
                success: function(data) {
                    if(data.code==0) {
                        showMsg(data.msg,1,function(){parent.location.href=parent.location.href;});
                    } else {showMsg(data.msg,2);}
                }
            });
        });
    });
</script>
</body>
</html>
