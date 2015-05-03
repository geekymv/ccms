<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>活动详情</title>
<%@ include file="/WEB-INF/jsp/inc/admin_style.jsp"%>

<style type="text/css">
	.my-par {
		height: 32px;
	}
	.tips {
   		color: red;
   		padding-left: 10px;
    }
    
    .div-top {
    	padding-top: 4px;
    }
    	
</style>

</head>
<body>
	<div class="mainwrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="leftpanel">
			<jsp:include page="leftmenu.jsp"></jsp:include>
		</div>
		<div class="rightpanel">
			<ul class="breadcrumbs">
	            <li><a href="${pageContext.request.contextPath }/admin"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
	            <li>活动管理 <span class="separator"></span></li>
	            <li>活动详情</li>
        	</ul>
        	<div class="maincontent">
        	<div class="maincontentinner">
            <div class="widget">
                <h4 class="widgettitle">活动详情</h4>
                <div class="widgetcontent">
                    <form id="form1" class="stdform">
                            <div class="par control-group my-par">
                                <label class="control-label" for="account">活动名称：</label>
                                <div class="controls div-top">
                                	${activity.name }
                                </div>
                            </div>
                            <div class="par control-group my-par">
                                <label class="control-label" for="password">发布单位：</label>
                                <div class="controls div-top">
                                	${activity.college.name }
                                </div>
                            </div>
                            <div class="par control-group my-par">
	                            <label class="control-label" for="repassword">发布时间：</label>
                                <div class="controls div-top" id='publishTime'>
                                </div>
                            </div>
                            <div class="control-group my-par">
                                <label class="control-label" for="name">活动对象：</label>
                                <div class="controls div-top">
									${activity.actObject }
                                </div>
                            </div>
                            
                            <div class="par control-group my-par">
                                    <label class="control-label" for="phone">活动时间：</label>
                                <div class="controls div-top">
                                	${activity.dateTime }
                                </div>
                            </div>
                            
                            <div class="par control-group my-par">
                                    <label class="control-label" for="contact">活动类型：</label>
                                <div class="controls div-top">
                  					${activity.actType.name }
                                </div>
                            </div>
                            <div class="par control-group">
                                    <label class="control-label" for="address">活动地点：</label>
                                <div class="controls div-top">
									${activity.location }
	                            </div> 
                            </div>
                             <div class="par control-group">
                                    <label class="control-label" for="address">活动加分时长：</label>
                                <div class="controls div-top">
									${activity.duration }小时
	                            </div> 
                            </div>
                             <div class="par control-group">
                                    <label class="control-label" for="address">参与人数：</label>
                                <div class="controls div-top">
									${activity.number }人
	                            </div> 
                            </div>
                             <div class="par control-group">
                                    <label class="control-label" for="address">联系人：</label>
                                <div class="controls div-top">
									${activity.contact }
	                            </div> 
                            </div>
                             <div class="par control-group">
                                    <label class="control-label" for="address">联系方式：</label>
                                <div class="controls div-top">
									${activity.phone }
	                            </div> 
                            </div>
                             <div class="par control-group">
                                    <label class="control-label" for="address">报名截止日期：</label>
                                <div class="controls div-top" id='endDate'>
	                            </div> 
                            </div>
                            <%--是管理员 --%>
                            <c:if test="${user.authority == 1 }">                        
                            <p class="stdformbutton">
                                <button type="button" class="btn btn-primary" onclick="audit(1)">通过</button>
                                &nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" onclick="audit(-1)">不通过</button>
                            </p>
                            </c:if>
                    </form>
                </div><!--widgetcontent-->
            </div><!--widget-->
            </div>
            </div>      
		</div>
	</div><!--end of mainwrapper-->
	
	<script type="text/javascript">
		jQuery(function(){
			var publishTime = '${activity.publishTime }';
			jQuery('#publishTime').html(formatterDate(publishTime));
			
			var endDate = '${activity.endDate }';
			jQuery('#endDate').html(formatterDate(endDate));
			
		});
		
		function audit(status) {
			jQuery.post(contextPath+"/admin/aduitActivity", 
					{'actId': '${activity.id}', "status": status}).done(function(msg){
				
				if(msg == 'success') {
					alert('操作成功！');
				}else if(msg == 'fail') {
					alert('操作失败！');
				}
						
			}).fail(function(){
				
			});
		}
	
	
	</script>

</body>
</html>    




