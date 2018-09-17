<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String path = request.getContextPath();
    String port=request.getServerPort()==80?"":":"+request.getServerPort();
    String basePath = request.getScheme()+"://"+request.getServerName()+port+path+"/";%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title></title>
    <%@ include file="../include.jsp"%>
    <%--<script>
        function activityTitle() {

        }
        $(document).ready(function () {
            
        });
    </script>--%>
</head>

<body>
<div class="ibox-content">
   <form class="form-horizontal" method="post" id="activityEditForm">
       <input type = "hidden" name = "id" <c:if test="${activity!=null}">value="${activity.id }"</c:if>>
        <div class="form-group">
            <label class="col-sm-2 control-label">活动名称：</label>
            <div class="col-sm-9">
                <input type="text" name="name"  <c:if test="${activity!=null}">value="${activity.name }"</c:if>   class="form-control" placeholder="标题">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">图片：</label>
            <div class="col-sm-9">
                <input type="hidden" name="imgUrl" id="imgUrl"  <c:if test="${activity!=null}"> value="${activity.imgUrl}"</c:if>>
                <div img-area-id="imgUrl">
                    <c:if test="${activity!=null}">
                        <a class="img-area"><img src="${activity.imgUrl}"><span onclick="uploadDel(this,'imgUrl')">x</span></a>
                    </c:if>
                    <a class="img-area-btn" onclick="uploadImg(1,'imgUrl')"></a>
                </div>
            </div>
        </div>
       <div class="form-group">
           <label class="col-sm-2 control-label">活动地址：</label>
           <div class="col-sm-9">
               <input type="text" name="toUrl"  <c:if test="${activity!=null}">value="${activity.toUrl}"</c:if>  class="form-control" placeholder="活动地址">
           </div>
       </div>
       <fmt:formatDate value="${activity.startTime }" pattern="yyyy-MM-dd HH:mm:ss" var="st"></fmt:formatDate>
       <fmt:formatDate value="${activity.endTime }" pattern="yyyy-MM-dd HH:mm:ss" var="et"></fmt:formatDate>
        <div class="form-group">
            <label class="col-sm-2 control-label">活动开始时间：</label>
            <div class="col-sm-9">
                <input type="text" name="startTime"  <c:if test="${activity!=null}">value="${st }"</c:if>  class="form-control" placeholder="活动开始时间">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">活动结束时间：</label>
            <div class="col-sm-9">
                <input type="text" name="endTime"  <c:if test="${activity!=null}">value="${et }"</c:if>  class="form-control" placeholder="活动结束时间">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">活动类型：</label>
            <div class="col-sm-9">
                <input type="text" name="status"  <c:if test="${activity!=null}">value="${activity.status }"</c:if>  class="form-control" placeholder="活动类型">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">其他信息：</label>
            <div class="col-sm-9">
                <c:if test="${activity.createTime!=null}">
                <p class="form-control-static">创建时间：<fmt:formatDate value="${activity.createTime }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></p>
                </c:if>
                <c:if test="${activity.updateTime!=null}">
                <p class="form-control-static">最后一次修改时间：<fmt:formatDate value="${activity.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></p>
                </c:if>
                <c:if test="${activity.createUser!=null}">
                <p class="form-control-static">创建管理员：${activity.createUser.adminName }</p>
                </c:if>
                <c:if test="${activity.updateUser!=null}">
                <p class="form-control-static">最后修改管理员：${activity.updateUser.adminName }</p>
                </c:if>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-3">
               <c:choose>

                    <c:when test="${activity==null}">
                        <button type="submit" class="btn btn-info btn-block">创建</button>
                    </c:when>

                    <c:otherwise>
                        <input type="hidden" name="id" value="${activity.id }">
                        <button type="submit" class="btn btn-info btn-block">修改</button>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>
    </form>
</div>

<script type="text/javascript">
    $(function(){
        $("#activityEditForm").bootstrapValidator({
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
                /*bannerSort: {
                    validators: {
                        regexp: {
                            regexp: /^(0|[1-9][0-9]*)$/,
                            message: '请输入正整数'
                        }
                    }
                }*/
            }
        }).on('success.form.bv', function(e) {
            e.preventDefault();
            if($("#imgUrl").val()==""){
                toast(2, "", "请上传图片");
                $("button[type=submit]").removeAttr("disabled");
                return;
            }
            var $form = $(e.target);
            Ajax.ajax({
                url: '${ctx}/admin/activity/insertOrUpdateActivity.do',
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
