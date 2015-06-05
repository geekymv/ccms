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
			
			<table class="table table-bordered table-hover table-condensed table-responsive">
			   <thead>
			      <tr>
			         <th>活动名称</th>
			         <th>发布时间</th>
			         <th>举办单位</th>
			         <th>活动时间</th>
			         <th>活动类型</th>
			         <th>认证时长</th>
			         <th>认证状态</th>
			      </tr>
			   </thead>
			   <tbody>
			   </tbody>
			</table>
			
		</div>
	</div>
	
	<script type="text/javascript">
		$(function(){
			$.post(contextPath+'/stu/myactivities').done(function(result){
				var len = result.length;
				if(len == 0) {
					$('thead').hide();
					$('tbody').html('<div style="text-align: center; color: blue">暂无数据！</div>');
				} else {
					$('thead').show();
					var html = "";
					for(var i = 0; i < len; i++) {
						var act = result[i];
						var audit = act.audit;
						if(audit == 1) {
							audit = '<span class="glyphicon glyphicon-ok-circle"></span> 认证通过，等待审核';
						}else if (audit == 0) {
							audit = '<span class="glyphicon glyphicon-ban-circle" style="color: blue"></span> 等待认证';
						}else if (audit == -1) {
							audit = '<span class="glyphicon glyphicon-remove-circle" style="color: red"></span> 未通过认证' 
							+ '(原因：'+act.reason+')';
						}else if(audit == 2) {
							audit = '<span class="glyphicon glyphicon glyphicon-leaf" style="color: orange"></span> 审核通过';
						}else if(audit == 3) {
							audit = '<span class="glyphicon glyphicon-remove-circle" style="color: red"></span> 未通过审核' 
								+ '(原因：'+act.reason+')';
						}		
						
						html += "<tr>"	
							+ "<td>"+ act.activity.name +"</td>"	
							+ "<td>"+ formatterDate(act.activity.publishTime) +"</td>"	
							+ "<td>"+ act.activity.college.name +"</td>"	
							+ "<td style='text-align: left;'>"+ act.activity.dateTime +"</td>"	
							+ "<td>"+ act.activity.actType.name +"</td>"	
							+ "<td>"+ act.activity.duration +"</td>"	
							+ "<td style='text-align: left;'>"+ audit +"</td>"	
							+ "</tr>";
					}
					
					$('tbody').html(html);
				}
			}).fail(function(msg){
				alert('服务器端错误！');				
			});
		});
	
	</script>
	

  </body>
</html>

    