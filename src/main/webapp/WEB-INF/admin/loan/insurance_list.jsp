<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String path = request.getContextPath();
    String port = request.getServerPort() == 80 ? "" : ":" + request.getServerPort();
    String basePath = request.getScheme() + "://" + request.getServerName() + port + path + "/";%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title></title>
    <%@ include file="../include.jsp" %>
</head>

<body class="gray-bg">

<div class="row">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <div class="row">
                    <div class="col-sm-12">
                        <form action="admin/loan/insuranceList.do" method="post" class="form-inline" id="queryForm">
                            <label> 用户名/手机号:<input type="text" name="keywords" value="${keywords }"
                                                   class="form-control input-sm"></label>
                            <label> 车牌号:<input type="text" name="plate" value="${plate }" class="form-control input-sm"></label>
                            <label> 联系电话:<input type="text" name="mobilePhone" value="${mobilePhone }"
                                                class="form-control input-sm"></label>
                            <label>
                                状态:<select class="form-control input-sm" name="insState">
                                <option value="0" ${0 eq status?'selected':'' }>拒绝</option>
                                <option value="0" ${1 eq status?'selected':'' }>申请成功</option>
                                <option value="1" ${2 eq status?'selected':'' }>保险保单</option>
                                <option value="2" ${3 eq status?'selected':'' }>确认投保</option>
                                <option value="2" ${4 eq status?'selected':'' }>投保成功</option>
                            </select>
                            </label>
                            <button type="submit" class="btn btn-sm btn-info"><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                </div>
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr role="row">
                        <th>序号</th>
                        <th>用户名</th>
                        <th>单号</th>
                        <th>驾驶证</th>
                        <th>驾驶证正面</th>
                        <th>驾驶证反面</th>
                        <th>行驶证正面</th>
                        <th>行驶证反面</th>
                        <th>车型</th>
                        <th>真实姓名</th>
                        <th>身份证号码</th>
                        <th>联系电话</th>
                        <th>所在地</th>
                        <th>车龄</th>
                        <th>是否挂牌</th>
                        <th>状态</th>
                        <th>创建时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pagination.list }" var="v" varStatus="vs">
                        <tr>
                            <td>${vs.index+1 }</td>
                            <td>${v.user.userName }</td>
                            <td>${v.insNum} <input type="hidden" value="${v.insNum}" id="${v.id}"></td>
                            <td>${v.plate}</td>
                            <td><img data-open="img" src="${v.driverLicenseFront }" width="60"></td>
                            <td><img data-open="img" src="${v.driverLicenseBack }" width="60"></td>
                            <td><img data-open="img" src="${v.xingLicenseFront }" width="60"></td>
                            <td><img data-open="img" src="${v.xingLicenseBack }" width="60"></td>
                            <td>${v.carName }</td>
                            <td>${v.realname }</td>
                            <td>${v.idcard }</td>
                            <td>${v.mobilePhone }</td>
                            <td>${v.carAddr }</td>
                            <td>${v.carAge}</td>
                            <td>${v.listing?'是':'否'}</td>
                            <td>
                                    <%--<option value="" ${empty status?'selected':'' }>全部</option>--%>
                                <option value="0" ${0 eq status?'selected':'' }>拒绝</option>
                                <option value="0" ${1 eq status?'selected':'' }>申请成功</option>
                                <option value="1" ${2 eq status?'selected':'' }>保险保单</option>
                                <option value="2" ${3 eq status?'selected':'' }>确认投保</option>
                                <option value="2" ${4 eq status?'selected':'' }>投保成功</option>
                            </td>
                            <td><fmt:formatDate value="${v.createTime }"
                                                pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                            <td>
                                <c:if test="${v.insState != 4}">
                                    <a class="btn btn-sm btn-circle btn-info" title="审核"
                                       onclick="audit(${v.id},${v.status})"
                                       data-toggle="tooltip" data-placement="top"><i class="fa fa-legal"></i></a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-sm-4">

                    </div>
                    <div class="col-sm-8">
                        <div class="pagination-ul">
                            <mytag:Pagination pagination="${pagination}" queryForm="queryForm"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="layer-win layer-edit">
    <form class="form-horizontal" id="apprForm">
        <div class="form-group">
            <label class="col-sm-3 control-label">选项：</label>
            <div class="col-sm-9">
                <div class="radio radio-info radio-inline">
                    <input type="radio" id="r0" value="0" name="stateIn">
                    <label for="r0">拒绝</label>
                </div>
                <div class="radio radio-info radio-inline">
                    <input type="radio" id="r1" value="1" name="stateIn">
                    <!--<label for="r1">申请成功 </label>-->
                    <label for="r1" id="car">[添加用户信息] </label>
                </div>
                <div class="radio radio-info radio-inline">
                    <input type="radio" id="r2" value="2" name="stateIn">
                    <label for="r2">保险报单</label>
                </div>
                <div class="radio radio-info radio-inline">
                    <input type="radio" id="r3" value="3" name="stateIn">
                    <label for="r3">确认报单</label>
                </div>
                <div class="radio radio-info radio-inline">
                    <input type="radio" id="r4" value="4" name="stateIn">
                    <label for="r4">投保成功</label>
                </div>
            </div>
        </div>
        <input type="hidden"   name="insNumState" id="insNumState">
        <input type="hidden"   name="inf" id="inf">
    </form>
    <div class="form-group car-button" style="display:none">
        <div class="col-sm-offset-5 col-sm-6">
            <button type="button" class="btn btn-primary" id="btn-car-button">确定</button>
        </div>
    </div>
</div>
<!--车主信息-->
<div class="layer-win layer-car-userid  layer-car-name" style="width:650px;  height:auto; margin:0 auto;">
    <form class="form-horizontal" id="carid">
        <div class="form-group">
            <label class="col-sm-12 " style="font-weight:bold">车主信息:</label>

            <div class="col-sm-12">
                <div class="col-sm-6 ">
                    <label class="radio-info col-sm-offset-2">车主姓名</label>
                    <input type="text" id="realname" value="" name="realname">
                </div>
                <div class="col-sm-6 radio-info">
                    <label class="radio-info col-sm-offset-2" style="text-align">车&nbsp;架&nbsp;&nbsp;号</label>
                    <input type="text" id="carjiaCode" value="" name="carjiaCode">
                </div>
                <div class="col-sm-6 radio-info">
                    <label class="radio-info col-sm-offset-2">识&nbsp;别&nbsp;&nbsp;码</label>
                    <input type="text" id="shibieCode" value="" name="shibieCode">
                </div>
                <div class="col-sm-6 radio-info">
                    <label class="control-label col-sm-offset-2">发动机号</label>
                    <input type="text" id="fadongjiNum" value="" name="fadongjiNum">
                </div>
                <div class="col-sm-6 radio-info">
                    <label class="radio-info col-sm-offset-2">注册日期</label>
                    <input type="date" id="registrationDate" value="" name="registrationDate">
                </div>
                <div class="col-sm-6 radio-info">
                    <label class="control-label col-sm-offset-2">驾驶证号</label>
                    <input type="text" id="jiashiCode" value="" name="jiashiCode">
                </div>
                <div class="col-sm-6 radio-info">
                    <label class="control-label col-sm-offset-2">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 注</label>
                    <input type="text" id="remark" value="" name="remark">
                    <input type="hidden" id="state" value="" name="state">
                    <input type="hidden" id="insNum" name="insNum">
                    <input type="hidden" id="incarname" name="incarname">
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-6">
                <button type="button" class="btn btn-primary" id="btn-car-save">确定</button>
            </div>
        </div>
    </form>
</div>
<!--车辆损失险-->
<style>.layer-insurance label {
    width: 120px;
    text-align: justify;
}</style>
<div class="layer-win layer-car-userid  layer-insurance" style="width:750px;  height:auto; margin:0 auto;">
    <form class="form-horizontal" id="car-insurance">
        <div class="form-group">
        <!-- 交强险账单 -->
            <label class="col-sm-12 " style="font-weight:bold">交强险账单:</label>
            <div class="col-sm-12">
                <div class="col-sm-6 ">
                    <label class="radio-info ">期保日期</label>
                    <input type="date" id="guaranteeDate" value="" name="guaranteeDate" class="input">
                </div>
                <div class="col-sm-6 radio-info">
                    <label class="radio-info " style="text-align">开始日期</label>
                    <input type="date" id="comStartDate" value="" name="comStartDate" class="input">
                </div>
                <div class="col-sm-6 radio-info">
                    <label class="radio-info " style="text-align">结束日期</label>
                    <input type="date" id="comEndDate" value="" name="comEndDate" class="input">
                </div>
                <div class="col-sm-6 radio-info">
                    <label class="radio-info " style="text-align">车船费</label>
                    <input type="text" id="fare" value="" name="fare" class="input">
                </div>
                <div class="col-sm-6 radio-info">
                    <label class="radio-info " style="text-align">车船费费用</label>
                    <input type="text" id="farefee" value="" name="farefee" class="input">
                </div>
                <div class="col-sm-6 radio-info">
                    <label class="radio-info " style="text-align">交强险保费</label>
                    <input type="text" id="compulsoryInsurance" value="" name="compulsoryInsurance" class="input">
                </div>
                <div class="col-sm-6 radio-info">
                    <label class="radio-info " style="text-align">交强险保额</label>
                    <input type="text" id="compulsoryInsurancefee" value="" name="compulsoryInsurancefee" class="input">
                </div>
            </div>
<!-- 商业保险账单 -->
            <label class="col-sm-12 " style="font-weight:bold">商业保险账单:</label>
            <div class="col-sm-12">
                <div class="col-sm-6 ">
                    <label class="radio-info ">车辆损失险</label>
                    <input type="text" id="vehicleDamageFee" value="" name="vehicleDamageFee" class="input">
                </div>
                <div class="col-sm-6 radio-info">
                    <label class="radio-info " style="text-align">第三方责任险</label>
                    <input type="text" id="thirdPartyLiabilityFee" value="" name="thirdPartyLiabilityFee" class="input">
                </div>
                <div class="col-sm-6 radio-info">
                    <label class="radio-info ">保险公司选择</label>
                    <select id="insuranceId" name="insuranceId">
                        <option value="10001">安邦保险</option>
                        <option value="10002">中国人保</option>
                        <option value="10003">平安保险</option>
                    </select>
                </div>
                <div class="col-sm-6 radio-info">
                    <label class="radio-info ">抢盗险</label>
                    <input type="text" id="robberyFee" value="" name="robberyFee" class="input">
                </div>
                <div class="col-sm-6 radio-info">
                    <label class="radio-info ">司机座位责任险</label>
                    <input type="text" id="driverSeatLiabilityFee" value="" name="driverSeatLiabilityFee" class="input">
                </div>
                <div class="col-sm-6 radio-info">
                    <label class="radio-info ">司机座位责任险</label>
                    <input type="text" id="passengerSeatLiabilityFee" value="" name="passengerSeatLiabilityFee"
                           class="input">
                </div>
                <div class="col-sm-6 radio-info">
                    <label class="radio-info ">自燃损失险</label>
                    <input type="text" id="riskSpontaneousFee" value="" name="riskSpontaneousFee" class="input">
                </div>
                <div class="col-sm-6 radio-info">
                    <label class="radio-info ">玻璃单独损失险</label>
                    <input type="text" id="riskGlassFee" value="" name="riskGlassFee" class="input">
                </div>
                <div class="col-sm-6 radio-info">
                    <label class="radio-info ">划痕险</label>
                    <input type="text" id="riskScratchFee" value="" name="riskScratchFee" class="input">
                </div>
                <div class="col-sm-6 radio-info">
                    <label class="radio-info ">涉水险</label>
                    <input type="text" id="riskWadingFee" value="" name="riskWadingFee" class="input">
                </div>
                <div class="col-sm-6 radio-info">
                    <label class="radio-info">找不到第三方特约险</label>
                    <input type="text" id="notThirdFee" value="" name="notThirdFee" class="input">
                </div>
                <div class="col-sm-6 radio-info">
                    <label class="radio-info">全部不计免赔险</label>
                    <input type="text" id="allDeductibleFee" value="" name="allDeductibleFee" class="input">
                </div>
                <div class="col-sm-6 radio-info">
                    <label class="radio-info">生效开始时间</label>
                    <input type="date" id="startTime" value="" name="startTime">
                </div>
                <div class="col-sm-6 radio-info">
                    <label class="radio-info">生效结束时间</label>
                    <input type="date" id="endTime" value="" name="endTime">
                </div>
                <div class="col-sm-6 radio-info">
                    <label class="radio-info">商业险气保日期</label>
                    <input type="date" id="comGuaranteeDate" value="" name="comGuaranteeDate" class="input">
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-6">
                <input type="hidden" id="state1" value="" name="state">
                <input type=" hidden" id="insNum1" name="insNum">
                <button type="button" class="btn btn-primary" id="btn-insurance-save">确定</button>
            </div>
        </div>
    </form>
</div>


<script type="text/javascript">
    $(function () {
        //状态1
        $(":radio").click(function () {
            var intvalues = $('input[name="stateIn"]:checked').val();
            $("#state").val(intvalues);
            $("#state1").val(intvalues);
            //状态0
            if (intvalues== 0) {
                openLayerContent('车主信息', 500, 500, $(".layer-car-name"));
                var beizhu = document.getElementById("remark");
                beizhu.value = "必填选项";
                beizhu.style.color = "red";
                $(".car-button").hide();
                return;
            }
            //状态1
            if (intvalues== 1) {

            }
            //状态2
            if (intvalues == 2) {
                openLayerContent('保险列表', 500, 500, $(".layer-insurance"));
                return;
            }
            //状态3
            if (intvalues == 3) {
                $(".car-button").show();
            }
            //状态4
            if (intvalues == 4) {
                $(".car-button").show();
            }

        });
    });
    //验证字母数字
    function judgePass(password) {
        var regu = /^[0-9a-zA-Z]*$/g;
        var re = new RegExp(regu);
        if (re.test(password)) {
            return true;
        }
        else {
            return false;
        }
    }
    function audit(insId, state) {
        var insNum = document.getElementById(insId).value;
        $("#insNum").val(insNum);
        $("#insNum1").val(insNum);
        $("#insNumState").val(insNum);
        $('input:radio[value="' + state + '"]').attr('checked', true);
        openLayerContent('保险审核', 500, 300, $(".layer-edit"));
    }

    function judgePass1(password){
        var regu = /^[0-9]*$/;
        var re = new RegExp(regu);
        if (re.test(password)){
            return true;
        }
        else {
            return false;
        }
    }
    function judgePass2(password){
        var regu = /^(([1-9][0-9]*)|(([0]\.\d{1,2}|[1-9][0-9]*\.\d{1,2})))$/;
        var re = new RegExp(regu);
        if (re.test(password)){
            return true;
        }
        else {
            return false;
        }
    }
    car

    $("#car").click(function(){
        openLayerContent('车主信息', 500, 500, $(".layer-car-name"));
       $("#inf").val("1");
        $("#remark").val("");
        $(".car-button").hide();
        return;
    });
    $("#btn-insurance-save").click(function(){
        var guaranteeDate=document.getElementById('guaranteeDate').value;// 期保日期
        var comStartDate =document.getElementById('comStartDate').value; //开始日期
        var comEndDate =document.getElementById('comEndDate').value; //结束日期
        var fare =document.getElementById('fare').value; //车船费
        var farefee=document.getElementById('farefee').value; //车船费费用
        var compulsoryInsurance=document.getElementById('compulsoryInsurance').value; //交强险保费
        var compulsoryInsurancefee=document.getElementById('compulsoryInsurancefee').value; //交强险保额
        var vehicleDamageFee=document.getElementById('vehicleDamageFee').value; //车辆损失险
        var thirdPartyLiabilityFee=document.getElementById('thirdPartyLiabilityFee').value; //第三者责任险
        var insuranceId=document.getElementById('insuranceId').value; //保险公司
        var robberyFee=document.getElementById('robberyFee').value; //抢盗险
        var driverSeatLiabilityFee=document.getElementById('driverSeatLiabilityFee').value; //司机座位责任险
        var passengerSeatLiabilityFee=document.getElementById('passengerSeatLiabilityFee').value; //司机座位责任险
        var riskSpontaneousFee=document.getElementById('riskSpontaneousFee').value; //自燃损失险
        var riskGlassFee=document.getElementById('riskGlassFee').value; //玻璃单独损失险
        var riskScratchFee=document.getElementById('riskScratchFee').value; //划痕险
        var riskWadingFee=document.getElementById('riskWadingFee').value; //涉水险
        var notThirdFee=document.getElementById('notThirdFee').value; //找不到第三方特约险
        var allDeductibleFee=document.getElementById('allDeductibleFee').value; //全部不计免赔险
        var endTime=document.getElementById('endTime').value; //生效结束时间
        var startTime=document.getElementById('startTime').value; //生效开始时间
        var comGuaranteeDate=document.getElementById('comGuaranteeDate').value; //商业险气保日期
        var list=document.getElementsByClassName("input");
        //期保日期
        if(guaranteeDate==""){
            $(function(){
                setTimeout(function(){
                    alert("请输入期保日期")
                });
            });
            document.getElementById('guaranteeDate').focus();
            return false;
        }
        //开始日期
        if(comStartDate==""){
            $(function(){
                setTimeout(function(){
                    alert("请输入交强险开始日期")
                });
            });
            document.getElementById('comStartDate').focus();
            return false;
        }
        //结束日期
        if(comEndDate==""){
            $(function(){
                setTimeout(function(){
                    alert("请输入交强险结束日期")
                });
            });
            document.getElementById('comEndDate').focus();
            return false;
        }
        //车船费
        if(fare==''){
            $(function(){
                setTimeout(function(){
                    alert("请输入车船费")
                });
            });
            document.getElementById('fare').focus();
            return false;
        }
        else{
            if(!judgePass2(fare)){
                $(function(){
                    setTimeout(function(){
                        alert("请输入车船费,仅数字最多保留两位小数")
                    });
                });
                document.getElementById('fare').focus();
                return false;
            }
            else{
                setTimeout(function(){
                    return false;
                });
            }}
        //车船费费用
        if(farefee==''){
            $(function(){
                setTimeout(function(){
                    alert("请输入车船费费用")
                });
            });
            document.getElementById('farefee').focus();
            return false;
        }
        else{
            if(!judgePass2(farefee)){
                $(function(){
                    setTimeout(function(){
                        alert("请输入车船费费用,仅数字最多保留两位小数")
                    });
                });
                document.getElementById('farefee').focus();
                return false;
            }
            else{
                setTimeout(function(){
                    return false;
                });
            }}
        //交强险保费
        if(compulsoryInsurance==''){
            $(function(){
                setTimeout(function(){
                    alert("请输入交强险保费")
                });
            });
            document.getElementById('compulsoryInsurance').focus();
            return false;
        }
        else{
            if(!judgePass2(compulsoryInsurance)){
                $(function(){
                    setTimeout(function(){
                        alert("请输入交强险保费,仅数字最多保留两位小数")
                    });
                });
                document.getElementById('compulsoryInsurance').focus();
                return false;
            }
            else{
                setTimeout(function(){
                    return false;
                });
            }}
        //交强险保额
        if(compulsoryInsurancefee==''){
            $(function(){
                setTimeout(function(){
                    alert("请输入交强险保额")
                });
            });
            document.getElementById('compulsoryInsurancefee').focus();
            return false;
        }
        else{
            if(!judgePass2(compulsoryInsurancefee)){
                $(function(){
                    setTimeout(function(){
                        alert("请输入交强险保额,仅数字最多保留两位小数")
                    });
                });
                document.getElementById('compulsoryInsurancefee').focus();
                return false;
            }
            else{
                setTimeout(function(){
                    return false;
                });
            }}
//车辆损失险
        if(vehicleDamageFee==''){
            $(function(){
                setTimeout(function(){
                    alert("请输入车辆损失险")
                });
            });
            document.getElementById('vehicleDamageFee').focus();
            return false;
        }
        else{
            if(!judgePass1(vehicleDamageFee)){
                $(function(){
                    setTimeout(function(){
                        alert("请输入车辆损失险,仅数字")
                    });
                });
                document.getElementById('vehicleDamageFee').focus();
                return false;
            }
            else{
                setTimeout(function(){
                    return false;
                });
            }}
//第三者责任险
        if(thirdPartyLiabilityFee==''){
            $(function(){
                setTimeout(function(){
                    alert("请输入第三者责任险")
                });
            });
            document.getElementById('thirdPartyLiabilityFee').focus();
            return false;
        }
        else{
            if(!judgePass1(thirdPartyLiabilityFee)){
                $(function(){
                    setTimeout(function(){
                        alert("请输入第三者责任险,仅数字")
                    });
                });
                document.getElementById('thirdPartyLiabilityFee').focus();
                return false;
            }
            else{
                setTimeout(function(){
                    return false;
                });
            }}
//抢盗险
        if(robberyFee==''){
            $(function(){
                setTimeout(function(){
                    alert("请输入抢盗险")
                });
            });
            document.getElementById('robberyFee').focus();
            return false;
        }
        else{
            if(!judgePass1(robberyFee)){
                $(function(){
                    setTimeout(function(){
                        alert("请输入抢盗险,仅数字")
                    });
                });
                document.getElementById('robberyFee').focus();
                return false;
            }
            else{
                setTimeout(function(){
                    return false;
                });
            }}
//司机座位责任险
        if(driverSeatLiabilityFee==''){
            $(function(){
                setTimeout(function(){
                    alert("请输入司机座位责任险")
                });
            });
            document.getElementById('driverSeatLiabilityFee').focus();
            return false;
        }
        else{
            if(!judgePass1(driverSeatLiabilityFee)){
                $(function(){
                    setTimeout(function(){
                        alert("请输入司机座位责任险,仅数字")
                    });
                });
                document.getElementById('driverSeatLiabilityFee').focus();
                return false;
            }
            else{
                setTimeout(function(){
                    return false;
                });
            }}
//司机座位责任险
        if(passengerSeatLiabilityFee==''){
            $(function(){
                setTimeout(function(){
                    alert("请输入司机座位责任险")
                });
            });
            document.getElementById('passengerSeatLiabilityFee').focus();
            return false;
        }
        else{
            if(!judgePass1(passengerSeatLiabilityFee)){
                $(function(){
                    setTimeout(function(){
                        alert("请输入司机座位责任险,仅数字")
                    });
                });
                document.getElementById('passengerSeatLiabilityFee').focus();
                return false;
            }
            else{
                setTimeout(function(){
                    return false;
                });
            }}
//自燃损失险
        if(riskSpontaneousFee==''){
            $(function(){
                setTimeout(function(){
                    alert("请输入自燃损失险")
                });
            });
            document.getElementById('riskSpontaneousFee').focus();
            return false;
        }
        else{
            if(!judgePass1(riskSpontaneousFee)){
                $(function(){
                    setTimeout(function(){
                        alert("请输入自燃损失险,仅数字")
                    });
                });
                document.getElementById('riskSpontaneousFee').focus();
                return false;
            }
            else{
                setTimeout(function(){
                    return false;
                });
            }}
//玻璃单独损失险
        if(riskGlassFee==''){
            $(function(){
                setTimeout(function(){
                    alert("请输入玻璃单独损失险")
                });
            });
            document.getElementById('riskGlassFee').focus();
            return false;
        }
        else{
            if(!judgePass1(riskGlassFee)){
                $(function(){
                    setTimeout(function(){
                        alert("请输入玻璃单独损失险,仅数字")
                    });
                });
                document.getElementById('riskGlassFee').focus();
                return false;
            }
            else{
                setTimeout(function(){
                    return false;
                });
            }}
//划痕险
        if(riskScratchFee==''){
            $(function(){
                setTimeout(function(){
                    alert("请输入划痕险")
                });
            });
            document.getElementById('riskScratchFee').focus();
            return false;
        }
        else{
            if(!judgePass1(riskScratchFee)){
                $(function(){
                    setTimeout(function(){
                        alert("请输入划痕险,仅数字")
                    });
                });
                document.getElementById('riskScratchFee').focus();
                return false;
            }
            else{
                setTimeout(function(){
                    return false;
                });
            }}
//涉水险
        if(riskWadingFee==''){
            $(function(){
                setTimeout(function(){
                    alert("请输入涉水险")
                });
            });
            document.getElementById('riskWadingFee').focus();
            return false;
        }
        else{
            if(!judgePass1(riskWadingFee)){
                $(function(){
                    setTimeout(function(){
                        alert("请输入涉水险,仅数字")
                    });
                });
                document.getElementById('riskWadingFee').focus();
                return false;
            }
            else{
                setTimeout(function(){
                    return false;
                });
            }}
//找不到第三方特约险
        if(notThirdFee==''){
            $(function(){
                setTimeout(function(){
                    alert("请输入找不到第三方特约险")
                });
            });
            document.getElementById('notThirdFee').focus();
            return false;
        }
        else{
            if(!judgePass1(notThirdFee)){
                $(function(){
                    setTimeout(function(){
                        alert("请输入找不到第三方特约险,仅数字")
                    });
                });
                document.getElementById('notThirdFee').focus();
                return false;
            }
            else{
                setTimeout(function(){
                    return false;
                });
            }}
//全部不计免赔险
        if(allDeductibleFee==''){
            $(function(){
                setTimeout(function(){
                    alert("请输入全部不计免赔险")
                });
            });
            document.getElementById('allDeductibleFee').focus();
            return false;
        }
        else{
            if(!judgePass1(allDeductibleFee)){
                $(function(){
                    setTimeout(function(){
                        alert("请输入全部不计免赔险,仅数字")
                    });
                });
                document.getElementById('allDeductibleFee').focus();
                return false;
            }
            else{
                setTimeout(function(){
                    return false;
                });
            }}
//保险公司
        if(insuranceId==""){
            $(function(){
                setTimeout(function(){
                    alert("请选择保险公司")
                });
            });
            document.getElementById('insuranceId').focus();
            return false;
        }
//生效开始时间
        if(startTime==""){
            $(function(){
                setTimeout(function(){
                    alert("请输入生效开始时间")
                });
            });
            document.getElementById('startTime').focus();
            return false;
        }
//生效结束时间
        if(endTime==""){
            $(function(){
                setTimeout(function(){
                    alert("请输入生效结束时间")
                });
            });
            document.getElementById('endTime').focus();
            return false;
        }
//商业险气保日期options
        if(comGuaranteeDate==""){
            $(function(){
                setTimeout(function(){
                    alert("请输入商业险气保日期")
                });
            });
            document.getElementById('comGuaranteeDate').focus();
            return false;
        }
//选择保险
        if(insuranceId==""){
            $(function(){
                setTimeout(function(){
                    alert("请选择保险")
                });
            });
            document.getElementById('insuranceId').focus();
            return false;
        }
        Ajax.ajax({
            url: "admin/loan/insApprFee.do",
            params: $("#car-insurance").serialize(),
            success: function (data) {
                if (data.code == 0) {
                    showMsg(data.msg, 1, function () {
                        location.reload();
                    });
                } else {
                    showMsg(data.msg, 2);
                }
            }
        });
//结束
    });

    $("#btn-car-button").click(function(){
        Ajax.ajax({
            url: "admin/loan/insApprStateIn.do",
            params: $("#apprForm").serialize(),
            success: function (data) {
                if (data.code == 0) {
                        showMsg(data.msg, 1, function () {
                        location.reload();
                    });
                } else {
                    showMsg(data.msg, 2);
                }
            }
        });
//结束
    });


    $("#btn-car-save").click(function () {
        var realname = document.getElementById('realname').value;//姓名
        var carjiaCode = document.getElementById('carjiaCode').value; //车架号
        var shibieCode = document.getElementById('shibieCode').value; //识别码
        var fadongjiNum = document.getElementById('fadongjiNum').value; //发动机号
        var registrationDate = document.getElementById('registrationDate').value; //日期
        var jiashiCode = document.getElementById('jiashiCode').value; //驾驶证号
//姓名
        if (realname == "") {
            $(function () {
                setTimeout(function () {
                    alert("请输入姓名")
                });
            });
            document.getElementById('realname').focus();
            return false;
        }
//车架号
        if (carjiaCode == '') {
            $(function () {
                setTimeout(function () {
                    alert("请输入车架号")
                });
            });
            document.getElementById('carjiaCode').focus();
            return false;
        }
        else {
            if (!judgePass(carjiaCode)) {
                $(function () {
                    setTimeout(function () {
                        alert("请输入正确车架号,禁止中文输入")
                    });
                });
                document.getElementById('carjiaCode').focus();
                return false;
            }
            else {
                setTimeout(function () {
                    return false;
                });
            }
        }
//识别码
        if (shibieCode == '') {
            $(function () {
                setTimeout(function () {
                    alert("请输入识别码")
                });
            });
            document.getElementById('shibieCode').focus();
            return false;
        }
        else {
            if (!judgePass(shibieCode)) {
                $(function () {
                    setTimeout(function () {
                        alert("请输入正确识别码,禁止中文输入")
                    });
                });
                document.getElementById('shibieCode').focus();
                return false;
            }
            else {
                setTimeout(function () {
                    return false;
                });
            }
        }
//发动机号
        if (fadongjiNum == '') {
            $(function () {
                setTimeout(function () {
                    alert("请输入发动机号")
                });
            });
            document.getElementById('fadongjiNum').focus();
            return false;
        }
        else {
            if (!judgePass(fadongjiNum)) {
                $(function () {
                    setTimeout(function () {
                        alert("请输入正确发动机号,禁止中文输入")
                    });
                });
                document.getElementById('fadongjiNum').focus();
                return false;
            }
            else {
                setTimeout(function () {
                    return false;
                });
            }
        }
//日期
        if (registrationDate == "") {
            $(function () {
                setTimeout(function () {
                    alert("请输入日期")
                });
            });
            document.getElementById('registrationDate').focus();
            return false;
        }
//驾驶证号
        if (jiashiCode == '') {
            $(function () {
                setTimeout(function () {
                    alert("请输入驾驶证号")
                });
            });
            document.getElementById('jiashiCode').focus();
            return false;
        }
        else {
            if (!judgePass(jiashiCode)) {
                $(function () {
                    setTimeout(function () {
                        alert("请输入正确驾驶证号,禁止中文输入")
                    });
                });
                document.getElementById('jiashiCode').focus();
                return false;
            }
            else {
                setTimeout(function () {
                    return false;
                });
            }
        }
        Ajax.ajax({
            url: "admin/loan/insAppr.do",
            params: $("#carid").serialize(),
            success: function (data) {
                if (data.code == 0) {
                    showMsg(data.msg, 1, function () {
                        location.reload();
                    });
                } else {
                    showMsg(data.msg, 2);
                }
            }
        });
    });
</script>
</body>
</html>
