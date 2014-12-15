<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>活动公告详情</title>

    <link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
	<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="row">
			<ol class="breadcrumb">
			  <li><a href="${pageContext.request.contextPath }">首页</a></li>
			  <li><a href="${pageContext.request.contextPath }">活动公告</a></li>
			  <li class="active">公告详情</li>
			</ol>
			<table class="table table-bordered table-hover table-condensed table-responsive">
				<tr>
			    	<td>活动名称</td> <td>${activity.name }</td>
			    </tr>  
			    <tr>
			        <td>发布单位</td> <td>${activity.college.name }</td>
			    </tr>
			    <tr>
			    	<td>发布时间</td> <td><fmt:formatDate value="${activity.publishTime }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
			    </tr>    
			    <tr>
			    	<td>活动对象</td> <td>${activity.actObject }</td>
			    </tr>  
			    <tr>
			    	<td>活动时间</td> <td>${activity.dateTime }</td>
			    </tr> 
			    <tr>
			    	<td>活动类型</td> <td>${activity.actType.name }</td>
			    </tr> 
			    <tr>
			    	<td>活动加分时长</td> <td>${activity.duration }小时</td>
			    </tr> 
		      	<tr>
		        	<td>参与人数</td> <td>${activity.number }人</td>
		      	</tr>  
		      	<tr>
		        	<td>联系人</td> <td>${activity.contact }人</td>
		      	</tr> 
		      	<tr>
		        	<td>联系方式</td> <td>${activity.phone }人</td>
		      	</tr> 
		      	<tr>
		        	<td>参与人数</td> <td>${activity.number }人</td>
		      	</tr> 
		      	<tr>
		        	<td>报名截止日期</td> <td><fmt:formatDate value="${activity.endDate }" pattern="yyyy-MM-dd"/></td>
		      	</tr> 
		      	 	
			</table>
		</div>
	</div>
	
    <script src="${pageContext.request.contextPath }/resources/js/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>

    