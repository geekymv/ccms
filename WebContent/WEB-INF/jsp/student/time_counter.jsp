<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager" %>     
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>时间统计</title>

    <link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
   <style type="text/css">
    	table {
    		margin: 0 auto;
    	}
    	td, th {
    		font-family: "微软雅黑";
    		text-align: center;
    	}
  </style>
  </head>
  <body>
	<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="row">
			<ol class="breadcrumb">
			  <li><a href="${pageContext.request.contextPath }/stu/index">首页</a></li>
			  <li class="active">时间统计</li>
			</ol>
			
			<c:choose>
				<c:when test="${empty itemVOs}">
					<span style="color: red; margin-left: 500px;">还未报名活动！</span>	
				</c:when>
				<c:otherwise>
					<table class="table table-bordered table-hover table-condensed table-responsive">
					   <thead>
					      <tr>
					         <th>活动类型</th>
					         <th>已完成时长</th>
					         <th>应完成时长</th>
					         <th>年度考核</th>
					      </tr>
					   </thead>
					   <tbody>
					   	  <c:forEach items="${itemVOs }" var="itemVO">
					      <tr>
					         <td>${itemVO.activityType.name }</td>
					         <td>${itemVO.totalDuration }</td>
					         <td>${itemVO.actualDuration }</td>
					         <td>年度考核</td>
					         <%--
					         <td>
					         	<c:choose>
					         		<c:when test="${item.audit == 1 }">
						         		<span class="glyphicon glyphicon-ok-circle"></span> 认证通过
					         		</c:when>
					         		<c:when test="${item.audit == -1 }">
					         			<span class="glyphicon glyphicon-remove-circle" style="color: red"></span> 认证未通过
					         		</c:when>
									<c:otherwise>
										<span class="glyphicon glyphicon-ban-circle" style="color: blue"></span> 等待认证
									</c:otherwise>
					         	</c:choose>
					         </td>
					          --%>
					      </tr>
					      </c:forEach>		
					   </tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	
    <script src="${pageContext.request.contextPath }/resources/js/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>

    