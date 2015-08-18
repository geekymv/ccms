<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp"%>

<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>受助等级</title>
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
    	tr th {
    		font-family: "微软雅黑";
			text-align: center;
    	}
    	tr td {
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
			  <li class="active">受助等级</li>
			</ol>
			<input type="hidden" name="num" id="stu_num" value="${user.num }"/>
			
			<table class="table table-bordered table-hover table-condensed table-responsive">
				<thead>
			      <tr>
			         <th>学号</th>
			         <th>年份</th>
			         <th>受助等级</th>
			      </tr>
			   	</thead>
			   	<tbody id="myranks">
			   	</tbody>
			</table>
			
		</div>
	</div>
    
    <script type="text/javascript" src="${ctx}/resources/scripts/ui/student/student.js"></script>
  </body>
</html>























    