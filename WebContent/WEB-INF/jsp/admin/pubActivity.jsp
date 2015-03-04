<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>发布活动</title>
<%@ include file="/WEB-INF/jsp/inc/admin_style.jsp"%>

<style type="text/css">
	.my-par {
		height: 32px;
	}
	.tips {
   		color: red;
   		padding-left: 10px;
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
	            <li>发布活动</li>
	            
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
                <h4 class="widgettitle">发布活动</h4>
                <div class="widgetcontent">
                    <form id="form1" class="stdform">
                    <table style="width: 850px;">
                    	<tr>
                    		<td>
	                    		<div class="par control-group my-par">
	                                <label class="control-label" for="name">
	                                	活动名称<span class="tips">*</span>
	                                </label>
	                                <div class="controls">
	                                	<input type="text" name="name" id="name" class="input-medium" />
	                                </div>
	                            </div>
                    		</td>
                    		<td>
	                    		<div class="par control-group my-par">
	                                <label class="control-label" for="dateTime">
	                                	活动时间<span class="tips">*</span>
	                                </label>
	                                <div class="controls">
	                                	<input type="text" name="dateTime" id="dateTime" class="input-medium" />
	                                </div>
	                            </div>
                    		</td>
                    	</tr>
                    	<tr>
                    		<td>
	                    		<div class="par control-group my-par">
	                                <label class="control-label" for="endDate">
	                                	报名截止日期<span class="tips">*</span>
	                                </label>
	                                <div class="controls">
	                                	<input type="text" name="endDate" id="endDate" class="input-medium" />
	                                </div>
	                            </div>
                    		</td>
                    		<td>
	                    		<div class="par control-group my-par">
	                                <label class="control-label" for="location">
	                                	活动地点<span class="tips">*</span>
	                                </label>
	                                <div class="controls">
	                                	<input type="text" name="location" id="location" class="input-medium" />
	                                </div>
	                            </div>
                    		</td>
                    	</tr>
                    	<tr>
                    		<td>
	                    		<div class="par control-group my-par">
	                                <label class="control-label" for="aim">
	                                	活动目的<span class="tips">*</span>
	                                </label>
	                                <div class="controls">
	                                	<input type="text" name="aim" id="aim" class="input-medium" />
	                                </div>
	                            </div>
                    		</td>
                    		<td>
	                    		<div class="par control-group my-par">
	                                <label class="control-label" for="content">
	                                	活动内容<span class="tips">*</span>
	                                </label>
	                                <div class="controls">
	                                	<input type="text" name="content" id="content" class="input-medium" />
	                                </div>
	                            </div>
                    		</td>
                    	</tr>
                    	<tr>
                    		<td>
	                    		<div class="par control-group my-par">
	                                <label class="control-label" for="actType">
	                                	加分类型<span class="tips">*</span>
	                                </label>
	                                <div class="controls">
	                                	 <select name="select" class="uniformselect" style="width: 160px;">
			                            	<option value="">Choose One</option>
			                                <option value="">Selection One</option>
			                                <option value="">Selection Two</option>
			                                <option value="">Selection Three</option>
			                                <option value="">Selection Four</option>
			                            </select>
	                                </div>
	                            </div>
                    		</td>
                    		<td>
	                    		<div class="par control-group my-par">
	                                <label class="control-label" for="duration">
	                                	加分时长<span class="tips">*</span>
	                                </label>
	                                <div class="controls">
	                                	<input type="text" name="duration" id="duration" class="input-small" />
	                                </div>
	                            </div>
                    		</td>
                    	</tr>
                    	<tr>
                    		<td>
	                    		<div class="par control-group my-par">
	                                <label class="control-label" for="actObject">
	                                	参与对象<span class="tips">*</span>
	                                </label>
	                                <div class="controls">
	                                	<input type="text" name="actObject" id="actObject" class="input-medium" />
	                                </div>
	                            </div>
                    		</td>
                    		<td>
	                    		<div class="par control-group my-par">
	                                <label class="control-label" for="number">
	                                	参与人数<span class="tips">*</span>
	                                </label>
	                                <div class="controls">
	                                	<input type="text" name="number" id="number" class="input-small" />
	                                </div>
	                            </div>
                    		</td>
                    	</tr>
                    	<tr>
                    		<td>
	                    		<div class="par control-group my-par">
	                                <label class="control-label" for="contact">
	                                	联系人<span class="tips">*</span>
	                                </label>
	                                <div class="controls">
	                                	<input type="text" name="contact" id="contact" class="input-medium" />
	                                </div>
	                            </div>
                    		</td>
                    		<td>
	                    		<div class="par control-group my-par">
	                                <label class="control-label" for="phone">
	                                	联系方式<span class="tips">*</span>
	                                </label>
	                                <div class="controls">
	                                	<input type="text" name="phone" id="phone" class="input-medium" />
	                                </div>
	                            </div>
                    		</td>
                    	</tr>
                    	<tr>
                    		<td>
	                    		<div class="par control-group my-par">
	                                <label class="control-label" for="assist">
	                                	协助人员<span class="tips">*</span>
	                                </label>
	                                <div class="controls">
	                                	<input type="text" name="assist" id="assist" class="input-medium" />
	                                </div>
	                            </div>
                    		</td>
                    		<td>
	                    		<div class="par control-group my-par">
	                                <label class="control-label" for="account">
	                                	活动名称<span class="tips">*</span>
	                                </label>
	                                <div class="controls">
	                                	<input type="text" name="name" id="name" class="input-medium" />
	                                </div>
	                            </div>
                    		</td>
                    	</tr>
                    
                    </table>
                      <p class="stdformbutton" style="margin-left: 400px;">
                      	<button type="button" class="btn btn-primary" onclick="pubActivity();">发布活动</button>
                      </p>
                    </form>
                </div><!--widgetcontent-->
            </div><!--widget-->
            </div>
            </div>      
		</div>
	</div><!--end of mainwrapper-->

	<script src="<c:url value='/resources/scripts/college.js'/>"></script>

</body>
</html>    




