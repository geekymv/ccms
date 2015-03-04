<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp"%>   
    
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>时间统计</title>
	<%@ include file="/WEB-INF/jsp/inc/style.jsp"%>

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
			  <li><a href="${pageContext.request.contextPath }/stu/index">首页</a></li>
			  <li class="active">时间统计</li>
			</ol>
			
			<div style="width: 900px; height: 50px;margin-left: 100px;">
			<form class="form-inline">
			  <div class="form-group">
			    <p class="form-control-static">
			   		选择学年：
			    </p>
			  </div>
			  <div class="form-group">
			     <select class="form-control" id="select">
				  </select>
			  </div>
			  <button type="button" class="btn btn-primary" id="query">查询</button>
			</form>
			</div>
								
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
			   		<!-- 
			   	  <c:forEach items="${itemVOs }" var="itemVO" varStatus="status">
			      <tr>
			         <td>${itemVO.activityType.name }</td>
			         <td>${itemVO.finishedDuration }小时</td>
			         <td>${itemVO.duration }小时</td>
			         <c:if test="${status.count == 1 }">
			         <td rowspan="${fn:length(itemVOs) }" style="vertical-align: middle;color: blue; font-size: 16px;">
			         	等待审核
			         </td>
			         </c:if>	
			      </tr>
			      </c:forEach>	
			       -->
			   </tbody>
			</table>
					
					
			<!--  
			<c:choose>
				<c:when test="${empty itemVOs}">
					<span style="color: red; margin-left: 500px;">还未报名活动！</span>	
				</c:when>
				<c:otherwise>
					<div style="width: 900px; height: 50px;margin-left: 100px;">
					<form class="form-inline">
					  <div class="form-group">
					    <p class="form-control-static">
					   		选择学年：
					    </p>
					  </div>
					  <div class="form-group">
					     <select class="form-control" id="select">
						  </select>
					  </div>
					  <button type="button" class="btn btn-default" id="query">查询</button>
					</form>
					</div>
								
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
					   	  <c:forEach items="${itemVOs }" var="itemVO" varStatus="status">
					      <tr>
					         <td>${itemVO.activityType.name }</td>
					         <td>${itemVO.finishedDuration }小时</td>
					         <td>${itemVO.duration }小时</td>
					         <c:if test="${status.count == 1 }">
					         <td rowspan="${fn:length(itemVOs) }" style="vertical-align: middle;color: blue; font-size: 16px;">
					         	等待审核
					         </td>
					         </c:if>	
					      </tr>
					      </c:forEach>	
					   </tbody>
					</table>
				</c:otherwise>
			</c:choose>
			-->
		</div>
	</div>

	<script src="<c:url value='/resources/scripts/time_counter.js'/>"></script>
  </body>
</html>

    