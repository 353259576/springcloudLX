<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="com.jf.system.Constant,com.jf.system.SystemUtil,java.util.Date"%>
<% String path = request.getContextPath();
  String port=request.getServerPort()==80?"":":"+request.getServerPort();
  String basePath = request.getScheme()+"://"+request.getServerName()+port+path+"/";%>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
  <title>门店</title>
  <script src="/static/library/jquery/jquery-2.1.1.min.js"></script>
  <script src="/static/library/jquery/jquery.slimscroll.min.js"></script>
  <script src="/static/library/jquery/jquery.fullPage.min.js"></script>

  <link href="/static/theme/activity/css/jquery.fullPage.css" rel="stylesheet"/>
  <link href="/static/theme/activity/css/mui.min.css" rel="stylesheet"/>
  <link href="/static/theme/activity/css/style.css"  rel="stylesheet"/>
  <link rel="shortcut icon" href="/static/theme/default/images/favicon.ico"  rel="stylesheet"/>
  <link href="/static/theme/common/bootstrap.min.css" rel="stylesheet">
  <link href="/static/theme/common/global.css" rel="stylesheet">

  <script src="/static/library/plugins/layer/layer.js"></script>
  <script src="/static/theme/back/js/main.js"></script>
  <script src="/static/theme/common/global.js"></script>
  <script src="/static/theme/back/js/validator.js"></script>
  <script src="/static/library/bootstrap/bootstrap.min.js"></script>
  <script src="/static/library/bootstrap/bootstrapValidator.js"></script>
  <script src="/static/library/plugins/metisMenu/jquery.metisMenu.js"></script>
  <script src="/static/library/plugins/slimscroll/jquery.slimscroll.min.js"></script>
  <script src="/static/library/plugins/toastr/toastr.min.js"></script>
  <script src="/static/library/plugins/pace/pace.min.js"></script>
  <style>
    @font-face
    {
      font-family: PingFang SC Regular;
      src: url("PingFang SC Regular.ttf"),
    }
    div
    {
      font-family:PingFang SC Regular;
    }
  </style>
</head>
<!--移动端版本兼容 -->
<body>
<header class="mui-bar mui-bar-nav header  fp-auto-height" id="mui-index"  style="position: fixed; top: 0;left: 0;right: 0; display: none;">
  <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
  <h1 class="mui-title">门店</h1>
</header>
<div class="mui-content"  id="dowebok">
  <div class="mui-action-back mui-col-xs-12 map-jl-a  section" >
    <div class="mui-jl-top">最近门店</div>
    <div class="map-jl mui-col-xs-11  ">
      <div class="map-jl-head mui-col-xs-12" id="about_info">
        <img src="/static/theme/activity/images/img.jpg">
        <p><i class="mui-icon mui-icon-location" ></i>合肥政务新区天鹅湖路119号<br/><i class="mui-icon mui-icon-paperplane"></i>1.2km</p>
      </div>
      <div class="map-jl-lx mui-col-xs-12">
        <li class="mui-col-xs-6">
          <a class="mui-tab-item mui-active">
            <span class="mui-icon mui-icon-phone"></span>
            <span class="mui-tab-label">电话</span>
          </a>
        </li>
        <li class="mui-col-xs-6">
          <a class="mui-tab-item" id="wo">
            <span class="mui-icon mui-icon-compose"></span>
            <span class="mui-tab-label">买单</span>
          </a>
        </li>
      </div>
      <div class="mui-jl-foot">
        进入门店
      </div>
    </div>
  </div>
  <div class="mui-action-back mui-car section section1" id="mui-car" style="-webkit-overflow-scrolling: touch;">
    <div class="mui-content-ul mui-col-xs-12 " id="mui-content-ul">
      <div class="mui-content-li mui-col-xs-6">
        <span class="show1" id="map"><font id="c_map">全部区域</font><i class="triangle"></i></span>
      </div>
      <div class="mui-content-li mui-col-xs-6">
        <span class="show1" id="item"><font>服务项目</font><i class="triangle"></i></span>
      </div>
      <ul id="myTab" class=" myTab mui-col-xs-12" style="display: none;">
        <li id="all" data-region-id="all" class=""><span>全部区域</span></li>
        <li id="areashushan" data-region-id="1" class="" onclick ="queryByArea('areashushan')"><span>蜀山区</span></li>
        <li id="areabaohe" data-region-id="2"  onclick ="queryByArea('areabaohe')"><span>包河区</span></li>
        <li id="arealuyang" data-region-id="3"  onclick ="queryByArea('arealuyang')"><span>庐阳区</span></li>
        <li id="areayaohai" data-region-id="4"  onclick ="queryByArea('areayaohai')"><span>瑶海区</span></li>
        <li id="areazhengwu" data-region-id="5"  onclick ="queryByArea('areazhengwu')"><span>政务区</span></li>
        <li id="areajingkai" data-region-id="6" onclick ="queryByArea('areajingkai')"><span>经济技术开发区</span></li>
        <li id="areagaoxin" data-region-id="7"  onclick ="queryByArea('areagaoxin')"><span>高新区</span></li>
        <li id="areabinhu" data-region-id="8" onclick ="queryByArea('areabinhu')"><span>滨湖新区</span></li>
        <li id="areaxinzhan" data-region-id="9" onclick ="queryByArea('areaxinzhan')"><span>新站区</span></li>
      </ul>
      <ul id="myTab1" class=" myTab1 mui-col-xs-12" style="display: none;">
        <li id="li_id" >普洗</li>
        <li class="grey">精洗</li>
        <li class="grey">打蜡</li>
        <li class="grey">镀晶</li>
        <li class="grey">养护</li>
        <li class="grey">定位</li>
        <li class="grey">镀膜</li>
        <li class="grey">抛光</li>
        <li class="grey">做漆</li>
        <li class="grey">其它</li>
        <button class="normal" id="confirm">确认</button>
        <button class="normal" id="reset">重置</button>
      </ul>
    </div>
    <div class="mui-car-article" id="mui-car-article" style="-webkit-overflow-scrolling: touch;">
      <section class="vedio" id="myTab_Content0">
        <ul class="mui-table-view" id="ul" style="-webkit-overflow-scrolling:touch; height: 100%; overflow: hidden;">
          <c:forEach items="${pagination.list }" var="v" varStatus="vs">
          <li class="mui-table-view-cell mui-media">
            <a href="/activity/activityDetail.do?id=${v.vendor.id}">
              <img class="mui-media-object mui-pull-left" src="/static/theme/activity/images/tit14.jpg">
              <div class="mui-media-body">
                <p>${v.vendor.vendorName}</p>
                <div class="car_other mui-col-xs-12">
                  <div class="car_other_fl fl mui-col-xs-8">
                    <div class="car_fl_p1"><i><img src="/static/theme/activity/images/xx.png"></i></div>
                    <div class="car_fl_p2"><span>营业中</span><span class="mui-ellipsis">最近已售出<em>3</em></span></div>
                  </div>
                  <div class="car_other_fr fr mui-col-xs-4"><s>￥${v.normalPrice}</s><span>￥1</span></div>
                </div>
                <p class="mui-ellipsis ">
                    <span class="mui-col-xs-9 mui-ellipsis fl">
                      <i class="mui-icon mui-icon-location">
                         </i>${v.vendor.vendorAddrDetail}
                    </span>
                  <span class="fr" id="dislocation">${v.vendor.dist}米</span></p>
              </div>
            </a>
          </li>
          </c:forEach>
        </ul>
      </section>
      <section class="mui-col-xs-12 more">没有更多啦！</section>
      <div class="bg"></div>
    </div>
  </div>
</div>
<script>
  $(document).ready(function(){
    $.ajax({
      type: "GET",
      url: "ajax/message.json",
      dataType: "json",
      success: function(data){
//			data.mytab.forEach(function(item){
//			  var html = "";
//            {
//             html += "<li id="+item.id+" data-region-id="+item.id+">";
//             html += "<span>"+item.name+"</span>";
//             html +=  "</li>" ;
//            }
//            $("#myTab").append(html);
//			});
        data.list.forEach(function(item){
          var html = "";
          {
            html += "<li class='mui-table-view-cell mui-media'>";
            html += "<a href='"+item.href+"'>";
            html += "<img class='mui-media-object mui-pull-left' src='"+item.src+"'>";
            html += "<div class='mui-media-body'>"+item.name+"";
            html += "<p class='mui-ellipsis'>"+item.address+"</p>";
            html += "<p class='mui-ellipsis'><span class='mui-km'>"+item.km+"</span></p>";
            html += "</div>";
            html +=  "</a>" ;
            html +=  "</li>" ;
          }
          $("#ul").append(html);
        });
      }
    });
//	区域
    $("#map").click(function(){
      showPage(".myTab",".myTab1","#map");
      $.fn.fullpage.moveTo( 2 );
    });
//  项目
    $("#item").click(function(){
      showPage(".myTab1",".myTab","#item");
      $.fn.fullpage.moveTo( 2 );
    });
//  翻页
    $(function(){
      $('#dowebok').fullpage({
        scrollOverflow:true,
        scrollingSpeed:500
      });
    });
//选择地区
    $("#myTab").on('click','#myTab li',function(){
      $("#myTab ,.bg").hide();
      $("#myTab").removeClass('show');
      $(this).toggleClass("tab").siblings().removeClass('tab');
      var region=$(this).html();
      document.getElementById("c_map").innerHTML=region;
      $("#map").find(".triangle").removeClass('turn');
      $("#ul").empty();
      var districtId = $(this).attr("data-region-id");
      initPage(districtId);
    });
    function initPage(id){
      console.log(id);
      $.ajax({
        type: "GET",
        url: "ajax/message.json",
        dataType: "json",
        success: function(data){
          console.log(data[id]);
          var html = "";
          for(var i = 0; i< data[id].length; i++){
            html += "<li class='mui-table-view-cell mui-media'>";
            html += "<a href='"+data[id][i].href+"'>";
            html += "<img class='mui-media-object mui-pull-left' src='"+data[id][i].src+"'>";
            html += "<div class='mui-media-body'>"+data[id][i].name+"";
            html += "<p class='mui-ellipsis'>"+data[id][i].address+"</p>";
            html += "<p class='mui-ellipsis'><span class='mui-km'>"+data[id][i].km+"</span></p>";
            html += "</div>";
            html +=  "</a>" ;
            html +=  "</li>" ;
          }
          $("#ul").append(html);
        }
      });
    }
//选择项目
    $("#myTab1 li").click(function(){
      $(this).toggleClass("selected").siblings();
      document.getElementById("li_id").disabled = false;
    });
//重置
    $("#reset").click(function(){
      $("#myTab1 li").removeClass("selected");
    });
//确定项目
    $("#confirm").click(function(){
      var eles=document.getElementsByClassName("selected");
      for(var i=0;i < eles.length; i++)
      {
        console.log(eles[i].innerHTML);
      }
      $("#myTab1 ,.bg,#myTab").hide();
      $("#myTab1").removeClass('show');
      $("#item").find(".triangle").removeClass('turn');
    });
  });
  //区域项目下拉切换
  function showPage(param1,param2,param3){
    if($(param2).hasClass('show')){
      $(".bg").show();
    }else{
      $(".bg").toggle();
    }
    $(param3).find(".triangle").toggleClass('turn');
    $(param3).parent().parent().siblings().find(".triangle").removeClass('turn');
    if($(param1).siblings(param2).hasClass("show")){
      $(param2).removeClass('show');
      timer = setTimeout(function(){
        $(param1).addClass('show');
      });
    }else{
      $(param1).toggleClass('show');
    }
  }
</script>
<script type="text/javascript">
  //定位
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(pos) {
      var latitude = pos.coords.latitude;
      var longitude = pos.coords.longitude;
      var EARTH_RADIUS = 6378137.0;    //单位M
      var PI = Math.PI;
      function getRad(d){
        return d*PI/180.0;
      }
      function getGreatCircleDistance(lat1,lng1,lat2,lng2){
        var radLat1 = getRad(lat1);
        var radLat2 = getRad(lat2);
        var a = radLat1 - radLat2;
        var b = getRad(lng1) - getRad(lng2);
        var s = 2*Math.asin(Math.sqrt(Math.pow(Math.sin(a/2),2) + Math.cos(radLat1)*Math.cos(radLat2)*Math.pow(Math.sin(b/2),2)));
        s = s*EARTH_RADIUS;
        s = Math.round(s*10000)/10000.0;
        return s;
      }
      var res = getGreatCircleDistance(latitude,longitude,"31.81161","117.239888")/1000;
      document.getElementById("dislocation").innerHTML =res.toFixed(2)+"km";
    });
  }
  var d=new Date();
  var h=d.getHours();
  checkTime(h);
  function checkTime(h){
    if(h<7||h>22){
      $(".business").html("暂停营业");
      $(".business").css({"background":"#ccc","color":"#fff"})
    }
  }
  function queryByArea(id){
    var lon='';
    var lat='';
    $(location).attr('href', "/activity/queryByArea.do?id="+id+"&lon="+lon+"&lat="+lat);
  }
</script>
</body>
</html>
