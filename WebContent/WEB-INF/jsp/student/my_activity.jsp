<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp"%>   
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>我的公益活动</title>
	<%@ include file="/WEB-INF/jsp/inc/style.jsp"%>

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
			  <li class="active">我的公益活动</li>
			</ol>
			
			<c:choose>
				<c:when test="${empty actItems}">
					<span style="color: red; margin-left: 500px;">还未报名活动！</span>	
				</c:when>
				<c:otherwise>
					<table class="table table-bordered table-hover table-condensed table-responsive">
					   <thead>
					      <tr>
					         <th>活动名称</th>
					         <th>发布时间</th>
					         <th>举办单位</th>
					         <th>活动时间</th>
					         <th>活动类型</th>
					         <th>活动时长</th>
					         <th>认证状态</th>
					      </tr>
					   </thead>
					   <tbody>
					   	  <c:forEach items="${actItems }" var="item">
					      <tr>
					         <td>
					         	<a href="${pageContext.request.contextPath }/stu/activity_detail/${item.activity.id}">
					         		${item.activity.name }
					         	</a>
					         </td>
					         <td><fmt:formatDate value="${item.activity.publishTime }" pattern="yyyy年MM月dd日"/></td>
					         <td>${item.activity.college.name }</td>
					         <td>${item.activity.dateTime }</td>
					         <td>${item.activity.actType.name }</td>
					         <td>${item.activity.duration }小时</td>
					         <td>
					         	<c:choose>
					         		<c:when test="${item.audit == 1 }">
						         		<span class="glyphicon glyphicon-ok-circle"></span> 通过
					         		</c:when>
					         		<c:when test="${item.audit == -1 }">
					         			<span class="glyphicon glyphicon-remove-circle" style="color: red"></span> 未通过
					         		</c:when>
									<c:otherwise>
										<span class="glyphicon glyphicon-ban-circle" style="color: blue"></span> 等待认证
									</c:otherwise>
					         	</c:choose>
					         </td>
					      </tr>
					      </c:forEach>		
					   </tbody>
					</table>
					<c:if test="${pager.totalPage > 1 }">					
					<div class="panel-footer">
		          		<!-- 
			          	分页显示
			          	maxPageItems:每页显示的行数，默认为10 
			          	maxIndexPages:在循环输出页码的时候，最大输出多少个页码，默认是10 
			           -->	
			          <nav style="text-align:center;">
					  <ul class="pagination">
					      <pg:pager url="${pageContext.request.contextPath }/index" items="${pager.totalRecord }" export="currentPageNumber=pageNumber" maxPageItems="3">  
							   <%--  <li><a>总记录数${pager.totalRecord }</a></li>
							    <li><a>总页数${pager.totalPage }</a></li>
							    <li><a>当前页${currentPageNumber }</a></li> --%>
							    
							    <c:if test="${currentPageNumber != 1 }">
							    <pg:first>
							    	<li><a href="${pageUrl}">首页</a></li>
							    </pg:first>  
							    </c:if>
		
							    <pg:prev>
							    	<li><a href="${pageUrl }">上一页</a></li>
							    </pg:prev>  
				
							   <pg:pages>  
						         <c:choose>  
						            <c:when test="${currentPageNumber eq pageNumber}">  
						             	<li class="active"><a>${pageNumber }</a></li>
						            </c:when>  
						            <c:otherwise>  
						           		 <li><a href="${pageUrl }">${pageNumber }</a></li>
						            </c:otherwise>  
						         </c:choose>  
						   	   </pg:pages>  
				
							    <pg:next>  
							        <li><a href="${pageUrl }">下一页</a></li>
							    </pg:next>  
							    
							    <c:if test="${currentPageNumber != pager.totalPage }">
							    <pg:last>  
							         <li><a href="${pageUrl }">尾页</a></li>  
							    </pg:last>  
							    </c:if> 
							</pg:pager>  
						</ul>
						</nav>
		            </div>
		            </c:if>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	

  </body>
</html>

    