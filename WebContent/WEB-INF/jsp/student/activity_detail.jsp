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
    	th， td {
    		text-align: left;
    	}
    	
    	.user {
    		color: #9F9F9F;
    		margin-left: 10px;
    	}
    	
    	.answer {
    		text-align: right;
    		margin-right: 10px;
    		cursor: pointer;
    	}
    	
    	.pub_date {
    		display: block;
    		float: right;
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
			<input type="hidden" id="is_comment" value="${comment }"/>
			<table class="table table-bordered table-hover table-condensed table-responsive" style="width: 600px; text-align: left;">
				<tr>
			    	<th colspan="2">
			    		活动名称：${activity.name }
			    		<input type="hidden" id="activityId" value="${activity.id }"/>
			    	</th>
			    </tr>  
			    <tr>
			        <th colspan="2">发布单位：${activity.college.name }</th>
			    </tr>
			    <tr>
			    	<th colspan="2" id="actObject">活动对象：${activity.actObject }</th>
			    </tr>  
			    <tr>
			    	<th colspan="2" >活动时间：${activity.dateTime }</th>
			    </tr> 
			    <tr>
			    	<th colspan="2">活动类型：${activity.actType.name }，&nbsp;&nbsp;活动加分时长：${activity.duration }小时</th>
			    </tr> 
			    <tr>
			    	<th>活动地点：${activity.location }</th>
			    </tr> 
		      	<tr>
		        	<th>参与人数：${activity.number }人</th>
		      	</tr>  
		      	<tr>
		        	<th>联系人：${activity.contact }，&nbsp;&nbsp;联系方式：${activity.phone }</th>
		      	</tr> 
		      	<tr>
		        	<th id='endDate'></th>
		      	</tr> 
		      	<tr>
		        	<th colspan="2" style="text-align: left;">活动目的：${activity.aim }</th>
		      	</tr> 
		      	<tr>
		        	<th colspan="2" style="text-align: left;">活动内容：${activity.content }</th>
		      	</tr> 
		      	 <tr>
			    	<th colspan="2" id='publishTime'></th>
			    </tr>
		      	
		      	<tr>
		      		<th colspan="2" id='apply_activity' style="text-align: center;">
		      			<c:if test="${isApplyed == 'isApplyed' }">
		      				<span style="color:blue;">已报名</span>
			      			<button class="btn btn-primary" id="cancel">取消报名</button>
		      			</c:if>
		      			<c:if test="${isApplyed == 'unApply' }">
		      				<button class="btn btn-primary" id="apply">我要报名</button>
		      			</c:if>
		      		</th>
		      	</tr>
		      	<tr id="comment_tip">
		      		<th colspan="2" style="text-align: left;">
		      			评论
		      		</th>
		      	</tr>
		      	<tr id="comment_tr">
		      		<th colspan="2">
		      			<textarea cols="30" rows="3" name="content" id="content" style="width: 800px;"></textarea>
		      		</th>
		      	</tr>
		      	<tr id="comment_btn">
		      		<th colspan="2" style="text-align: right;">
		      			<button class="btn btn-success" id="pub_comment">发表评论</button>
		      		</th>
		      	</tr>
			</table>
			
			<div id="comment_list" style="border: 1px solid #ccc; width: 600px; margin-left: 285px;" >
	      	</div>
	      	<div style="width: 600px; margin-left: 285px; text-align: center;" >
	      		<button id="load_more" class="btn btn-primary">更多评论</button>
	      	</div>
	      	
		</div>
	</div>
	
    <script type="text/javascript">
    	var pageIndex = 0;
    	
		$(function(){
			var publishTime = '${activity.publishTime }';
			$('#publishTime').html('发布时间：'+formatterDate(publishTime));
			
			var endDate = '${activity.endDate }';
			$('#endDate').html('报名截止时间：'+formatterDate(endDate));
			
			// 活动对象
			var actObject = '${activity.actObject }';
			var newActObject = '';
			if(actObject == -1) {
				newActObject = '全校学生';
			}else {
				$.ajax({
					url: contextPath+"/getCollegeById",
					data: {'colId': actObject},
					type: 'POST',	
					async: false, // 同步
					dataType: 'json',
						success: function(data){
						newActObject = data.name + '学生';
					}
				});
			}
			
			$('#actObject').html('活动对象：'+newActObject);
			
			// 判断是否可以评论
			if($('#is_comment').val() == 'comment') {
				$('#comment_tr').show();
				$('#comment_list').show();
				$('#comment_btn').show();
				$('#comment_tip').show();
			}else {
				$('#comment_tr').hide();
				$('#comment_list').hide();
				$('#comment_btn').hide();
				$('#comment_tip').hide();
			}
			
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
				alert('服务器端错误！');
			});
			
			// 发表评论
			$('#pub_comment').click(function() {
				var data = {
					'objectId': $('#activityId').val(),
					'category': 1,
					'userId': '${user.id}',
					'content': content_editor.html()
				};	
				
				$.post(contextPath+"/comment/publish", data).done(function(msg){
					if(msg == 'success') {
						alert('评论成功！');
						window.location.reload();
					}
				}).fail(function(msg) {
					
				});		
			});
			
			commentList();
			
			// 加载评论列表
			$('#load_more').click(function(){
				pageIndex++;
				commentList();
			});
		
		});    	
		
		
		
		function commentList() {
			$.post(contextPath+"/comment/pager", {'pageIndex': pageIndex, 'activityId': $('#activityId').val()}).done(function(data){
				var comments = data.datas;
				var len = comments.length;
				
				var html = '';
				
				if(len == 0) {
					
				}else {
					if(len < 10) {
						$('#load_more').hide();
					}
					for(var i = 0; i < len; i++) {
						var comment = comments[i];
						html += '<div>'
								+'<div class="user">'
									+ '<span>'+comment.username+'('+comment.userId+')</span>'	
									+ '<span class="pub_date">'+formatterDate(comment.comDate)+'</span>'	
								+'</div>'
								+ '<div class="content">&nbsp;&nbsp;'+comment.content+'</div>'	
								+ '<div class="answer"><a style="javascript:void(0);">回复</a></div>'	
								+ '<hr/>'
							+ '</div>';
					}
				}
				$('#comment_list').append(html);
			});
		}
    	
    </script>
    
    <script src="${ctx}/resources/kindeditor/kindeditor-all-min.js"></script>
	<script src="${ctx}/resources/kindeditor/lang/zh-CN.js"></script>
    <!-- 添加评论 -->
   	<script>
	 	KindEditor.ready(function(K) {
	 		var control = {
	           	 	width : "100%", //编辑器的宽度为70%
	           	 	height: "180px",
	       			items:['source', '|', 'undo', 'redo', '|', 'preview', 'cut', 'copy', 'paste',
	      			        'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
	      			        'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
	      			        'superscript', 'clearhtml', '/', 'quickformat', 'selectall', '|', 
	      			        'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
	      			        'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 
	      			        'table', 'hr', 'fullscreen', 'emoticons'],
	      				resizeType : '1'
	      			};
	 	
           	window.content_editor = K.create('#content',control);
    	});
	 	
   </script>
  </body>
</html>























    