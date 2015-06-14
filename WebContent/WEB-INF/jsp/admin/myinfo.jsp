<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>我的资料</title>
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
    	padding-top: 5px;
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
	            <li>基本管理 <span class="separator"></span></li>
	            <li>个人资料</li>
	            
	            <%--
	            <li class="right">
	                <a href="" data-toggle="dropdown" class="dropdown-toggle"><i class="icon-tint"></i> Color Skins</a>
	                <ul class="dropdown-menu pull-right skin-color">
	                    <li><a href="default">Default</a></li>
	                    <li><a href="navyblue">Navy Blue</a></li>
	                    <li><a href="palegreen">Pale Green</a></li>
	                    <li><a href="red">Red</a></li>
	                    <li><a href="green">Green</a></li>
	                    <li><a href="brown">Brown</a></li>
	                </ul>
	            </li>
	             --%>
        	</ul>
        	<div class="maincontent">
        	<div class="maincontentinner">
            <div class="widget">
                <h4 class="widgettitle">我的资料</h4>
                <div class="widgetcontent">
                    <form id="form1" class="stdform">
                            <div class="par control-group my-par">
                                <label class="control-label" for="account">账号</label>
                                <div class="controls div-top">
                                	${college.account }
                                	<input type="hidden" name="id" id="id" value="${college.id }" class="input-large" />
                                </div>
                            </div>
                            <div class="par control-group my-par">
                                <label class="control-label" for="password">登录密码</label>
                                <div class="controls">
                                	<input type="password" name="password" id="password" class="input-large" />
                                	<span class="tips">若不改密码，不用填写！</span>
                                </div>
                            </div>
                            <div class="par control-group my-par">
	                                <label class="control-label" for="repassword">密码确认</label>
                                <div class="controls">
                                	<input type="password" name="repassword" id="repassword" class="input-large" />
                                </div>
                            </div>
                            <div class="control-group my-par">
                                    <label class="control-label" for="name">名称</label>
                                <div class="controls" id="col_name">
                                	<input type="text" name="name" value="${college.name }" id="name" class="input-large" />
                                </div>
                            </div>
                            
                            <div class="par control-group my-par">
                                    <label class="control-label" for="phone">电话号码<span class="tips">*</span></label>
                                <div class="controls">
                                	<input type="text" name="phone" value="${college.phone }" id="phone" class="input-large" />
                                </div>
                            </div>
                            
                            <div class="par control-group my-par">
                                    <label class="control-label" for="contact">联系人<span class="tips">*</span></label>
                                <div class="controls">
                                	<input type="text" name="contact" value="${college.contact }" id="contact" class="input-large" />
                                </div>
                            </div>
                            <div class="par control-group">
                                    <label class="control-label" for="address">地址<span class="tips">*</span></label>
                                <div class="controls">
	                                <textarea cols="10" rows="3" name="address" class="input-large" id="address">${college.address }</textarea>
	                            </div> 
                            </div>
                                                    
                            <p class="stdformbutton">
                                    <button type="button" class="btn btn-primary" onclick="updateMyInfo();">更新</button>
                            </p>
                    </form>
                </div><!--widgetcontent-->
            </div><!--widget-->
            </div>
            </div>      
		</div>
	</div><!--end of mainwrapper-->

	<script src="<c:url value='/resources/scripts/college.js'/>"></script>
	<script type="text/javascript">
		$(function() {
			var authority = '${user.authority}';
			if(authority == 0) {	// 普通用工单位
				$('#col_name').addClass('controls div-top')
				$('#col_name').html('${college.name }');
			}
			
		});
	
	</script>

</body>
</html>    




