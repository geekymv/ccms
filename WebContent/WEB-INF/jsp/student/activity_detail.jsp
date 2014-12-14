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
    <title>欢迎访问公益活动时间认证系统</title>

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
			   <thead>
			      <tr>
			         <th>活动名称</th>
			         <th>发布单位</th>
			         <th>活动对象</th>
			         <th>发布时间</th>
			         <th>活动类型</th>
			         <th>活动时长</th>
			         <th>查看</th>
			         <th>报名</th>
			      </tr>
			   </thead>
			   <tbody>
			   	  <c:forEach items="${activities }" var="activity">
			      <tr>
			         <td>${activity.name }</td>
			         <td>${activity.college.name }</td>
			         <td>${activity.actObject }</td>
			         <td><fmt:formatDate value="${activity.publishTime }" pattern="yyyy年MM月dd日"/> </td>
			         <td>${activity.actType.name }</td>
			         <td>${activity.duration }小时</td>
			         <td><a href="activity/detail/${activity.id }">查看</a></td>
			         <td>报名</td>
			      </tr>
			      </c:forEach>		
			   </tbody>
			</table>
		</div>
	</div>
	
    <script src="${pageContext.request.contextPath }/resources/js/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>

    