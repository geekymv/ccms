<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp"%>       
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>欢迎访问公益活动时间认证系统</title>
    <%@ include file="/WEB-INF/jsp/inc/style.jsp"%>
    
    

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <style type="text/css">
    	.pagination a {
		    cursor: pointer;
		    -moz-user-select: none;
		    -webkit-user-select: none;
		    -ms-user-select: none;
		    -khtml-user-select: none;
		    user-select: none;
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
			  <li class="active">活动公告</li>
			</ol>
			<div class="col-md-offset-3 col-md-8">
			<form class="form-inline">
			  <div class="form-group">
			    <input type="text" class="form-control" id="search" placeholder="请输入发布单位名称">
			  </div>
			  <div class="form-group">
               	 <select name="actTypeId" id="actType" class="form-control" style="width: 160px;">
             	</select>
              </div>
			  &nbsp;&nbsp;<button type="button" id="search_btn" class="btn btn-primary">查询</button>
			</form>
			</div>	
			
			<br/>
			<br/>
			<br/>
			
			<table class="table table-bordered table-hover table-condensed table-responsive">
				<thead>
			      <tr>
			         <th>活动名称</th>
			         <th>发布单位</th>
			         <th>活动对象</th>
			         <th>截止时间</th>
			         <th>活动类型</th>
			         <th>认证时长</th>
			         <th>查看活动详情</th>
			      </tr>
			   	</thead>
			   	<tbody id="t_body">
			   	</tbody>
			</table>
			
			<div class="panel-footer">
				<nav style="text-align: center;">
				    <ul id="page" class="pagination" data-first-btn-text="首页" data-last-btn-text="尾页"></ul>
				</nav>
            </div>
			
		</div>
	</div>

	<script type="text/javascript" src="${ctx }/resources/scripts/ui/student/index.js"></script>
	
  </body>
</html>

    