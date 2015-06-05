<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp"%>   

<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>活动公告详情</title>
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
    		font-family: "微软雅黑";
    	}
    	
    	th {
    		text-align: center;
    	}
    	
    	td {
    		text-align: left;
    	}
    </style>
    
  </head>
  <body>
	<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="row">
			<ol class="breadcrumb">
			  <li><a href="${pageContext.request.contextPath }/stu/index">首页</a></li>
			  <li><a href="${pageContext.request.contextPath }/stu/index">活动公告</a></li>
			  <li class="active">公告详情</li>
			</ol>
			<table class="table table-bordered table-hover table-condensed table-responsive" style="width: 500px;">
				<tr>
			    	<th>活动名称</th> <td>${activity.name }</td>
			    </tr>  
			    <tr>
			        <th>发布单位</th> <td>${activity.college.name }</td>
			    </tr>
			    <tr>
			    	<th>发布时间</th> <td id='publishTime'></td>
			    </tr>    
			    <tr>
			    	<th>活动对象</th> <td>${activity.actObject }</td>
			    </tr>  
			    <tr>
			    	<th>活动时间</th> <td>${activity.dateTime }</td>
			    </tr> 
			    <tr>
			    	<th>活动类型</th> <td>${activity.actType.name }</td>
			    </tr> 
			    <tr>
			    	<th>活动地点</th> <td>${activity.location }</td>
			    </tr> 
			    <tr>
			    	<th>活动加分时长</th> <td>${activity.duration }小时</td>
			    </tr> 
		      	<tr>
		        	<th>参与人数</th> <td>${activity.number }人</td>
		      	</tr>  
		      	<tr>
		        	<th>联系人</th> <td>${activity.contact }</td>
		      	</tr> 
		      	<tr>
		        	<th>联系方式</th> <td>${activity.phone }</td>
		      	</tr> 
		      	<tr>
		        	<th>报名截止日期</th> <td id='endDate'></td>
		      	</tr> 
		      	<tr>
		        	<th colspan="2" style="text-align: left;">活动目的：${activity.aim }</th>
		      	</tr> 
		      	<tr>
		        	<th colspan="2" style="text-align: left;">活动内容：${activity.content }</th>
		      	</tr> 
		      	
		      	<tr>
		      		<th colspan="2" id='apply_activity'>
		      			<c:if test="${isApplyed == 'isApplyed' }">
		      				<span style="color:blue;">已报名</span>
			      			<button class="btn btn-primary" id="cancel">取消报名</button>
		      			</c:if>
		      			<c:if test="${isApplyed == 'unApply' }">
		      				<button class="btn btn-primary" id="apply">我要报名</button>
		      			</c:if>
		      		</th>
		      	</tr>
		      	 	
			</table>
		</div>
	</div>
    <script type="text/javascript">
		$(function(){
			var publishTime = '${activity.publishTime }';
			$('#publishTime').html(formatterDate(publishTime));
			
			var endDate = '${activity.endDate }';
			$('#endDate').html(formatterDate(endDate));
			
			// 报名活动
			$("#apply").click(function(){
				$.ajax({
					url: contextPath+"/stu/apply",
					type: "post",
					data: {"id": '${activity.id}'},	
					dataType: "text",
					success: function(data){
						if(data == 'overflow') {
							alert('你来晚了！人数已满...');
						}else if(data == "success") {
							alert("报名成功！");
							window.location.reload();	// 刷新当前页面
						}else if(data == 'fail') {
							alert('报名失败！');
						}
					}
				});
			});		
			
			// 取消报名
			$('#cancel').click(function(){
				$.post(contextPath+"/stu/cancelActivity", {'activityId': '${activity.id }'}).done(function(msg){
					if(msg == 'end') {
						layer.msg('报名已截止！不能取消...');
					}else if(msg == 'success'){
						layer.msg('取消成功！');
						window.location.reload();
					}
					
					
				});
			});
			
			// 判断报名是否截止
			$.post(contextPath+"/stu/isPastDue", {'actId': '${activity.id}'}).done(function(msg){
				if(msg == 'isPastDue') {
					$('#apply').hide();
					$('#apply_activity').html('<span style="color: red;">报名截止</span>');
				}
			}).fail(function(){
				
			});
			
		});    	
    	
    </script>
  </body>
</html>























    