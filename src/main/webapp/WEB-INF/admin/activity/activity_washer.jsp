<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="com.jf.system.Constant,com.jf.system.SystemUtil,java.util.Date"%>
<% String path = request.getContextPath();
    String port=request.getServerPort()==80?"":":"+request.getServerPort();
    String basePath = request.getScheme()+"://"+request.getServerName()+port+path+"/";%>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>玻璃水-活动专区</title>
<link href="/static/theme/activity/css/mui.min.css" rel="stylesheet"/>
<link href="/static/theme/activity/css/style.css" rel="stylesheet"/>
<script src="/static/theme/activity/js/jquery-1.10.2.min.js"></script>
</head>
<body>
<header class="mui-bar mui-bar-nav header  fp-auto-height" id="mui-index"  style="position: fixed; top: 0;left: 0;right: 0; ">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" style="color: #3bc16a;"></a>
    <h1 class="mui-title">玻璃水-活动专区</h1>
</header>	
<div class="mui-content"  id="dowebok">
<div class="mui-action-back mui-car section section1"  >
<div class="mui-car-article" id="mui-car-article" >
    <section class="vedio" id="myTab_Content0">
    	<div class="mui-col-xs-12 washer_b" ><img src="/static/theme/activity/images/warcher.png"></div>
        <ul class="mui-table-view" id="ul" style=" overflow: hidden;">
            <c:forEach items="${list}" var="v" varStatus="vs">
            <li class="mui-table-view-cell mui-media">
                    <img class="mui-media-object mui-pull-left" src="${v.productImg}">
                    <div class="mui-media-body">
                        <p>${v.vendor.vendorName}</p>
                        <div class="car_other mui-col-xs-12">
                        	<div class="car_other_fl fl mui-col-xs-6">
                        		<%--<div class="car_fl_p3"><span class="mui-ellipsis">最近已售出<em class="sold">3</em>件</span></div>--%>
                        		<div class="car_fl_p3">
                        			<span>库存:<i class="stock">200</i>&nbsp;件</span>
                        		</div>                        		
                        	</div>
                        	<div class="car_other_frr fl mui-col-xs-3"><span><sub>￥</sub><i class="price">1</i></span><span><sub><s>${v.normalPrice}</s></sub></span></div>
                        	<div class="car_other_cn fr mui-col-xs-3" onclick="wash(this)" id="${v.id}">购买</div>
                        </div>
                        <p class="mui-ellipsis ">
                        	<a href="http://api.map.baidu.com/marker?location='${v.vendor.vendorLat},${v.vendor.vendorLon}'&amp;title=${v.vendor.vendorName}&amp;content=${v.vendor.vendorAddrDetail}&amp;output=html" class="vf">
                                  <span class="mui-col-xs-9 mui-ellipsis fl"><i class="mui-icon mui-icon-location"></i>${v.vendor.vendorAddrDetail}</span></a>
                        	  <span class="fr mui-col-xs-3 mui_km" class="dislocation"><c:set value="${v.vendor.dist}" var="z"></c:set><c:choose><c:when test="${z > 10000}"><fmt:formatNumber value="${z/1000}" pattern="0.0"></fmt:formatNumber>千米</c:when><c:otherwise> ${z}米</c:otherwise></c:choose></span>
                        </p>
                    </div>
            </li>
            </c:forEach>

        </ul>
        <!--当前坐标点位置-->
        <input type="hidden" id="latitude" value="">
        <input type="hidden" id="longitude" value="">
    </section>
    </div>
</div>
</div>
<script>
if(navigator.geolocation){  
    navigator.geolocation.getCurrentPosition(function(pos){  
        var latitude = pos.coords.latitude;
        var longitude = pos.coords.longitude;  
        document.getElementById("latitude").value=latitude;
    document.getElementById("longitude").value=longitude;
//  console.log(latitude+","+longitude)
//   alert(latitude+","+longitude)
    });  
 } 
$(document).ready(function(){
  if($(".stock").text()==0){
      $(".car_other_cn").css("background","#ccc");
      $(".car_other_cn").removeAttr("onclick");
   }
});
//支付
function wash(obj){
 var productId=obj.id;
 var productName=$(obj).parent().parent().children("p").eq(0).text();  
 var productPrice=$(obj).parent().children("div").eq(1).children("span").eq(0).children("i").text();  
 var a=wash1(productId,productPrice,productName)
}
function wash1(productId,productPrice,productName){
  android.washer2(productId,productPrice,productName);
  console.log(productId+","+productPrice+","+productName);
}
</script>
<script>

</script>
</body>
</html>
