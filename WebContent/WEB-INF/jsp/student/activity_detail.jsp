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
    	
    	span.td_title {
    		font-weight: bold;
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
			<table class="table table-bordered table-hover table-condensed table-responsive" style="width: 700px; text-align: left;">
				<tr>
			    	<td colspan="2">
			    		<span class="td_title">活动名称：</span>${activity.name }
			    		<input type="hidden" id="activityId" value="${activity.id }"/>
			    	</td>
			    </tr>  
			    <tr>
			        <td colspan="2"><span class="td_title">发布单位：</span>${activity.college.name }</td>
			    </tr>
			    <tr>
			    	<td colspan="2" id="actObject"><span class="td_title">活动对象：</span>${activity.actObject }</td>
			    </tr>  
			    <tr>
			    	<td colspan="2" ><span class="td_title">活动时间：</span>${activity.dateTime }</td>
			    </tr> 
			    <tr>
			    	<td colspan="2"><span class="td_title">活动类型：</span>${activity.actType.name }、${activity.secondLevel.name }，&nbsp;&nbsp;<span class="td_title">活动加分时长：</span>${activity.duration }小时</td>
			    </tr> 
			    <tr>
			    	<td><span class="td_title">活动地点：</span>${activity.location }</td>
			    </tr> 
		      	<tr>
		        	<td><span class="td_title">参与人数：</span>${activity.number }人</td>
		      	</tr>  
		      	<tr>
		        	<td><span class="td_title">联系人：</span>${activity.contact }，&nbsp;&nbsp;<span class="td_title">联系方式：</span>${activity.phone }</td>
		      	</tr> 
		      	<tr>
		        	<td id='endDate'></td>
		      	</tr> 
		      	<tr>
		        	<td colspan="2" style="text-align: left;"><span class="td_title">活动目的：</span>${activity.aim }</td>
		      	</tr> 
		      	<tr>
		        	<td colspan="2" style="text-align: left;"><span class="td_title">活动内容：</span>${activity.content }</td>
		      	</tr> 
		      	 <tr>
			    	<td colspan="2" id='publishTime'></td>
			    </tr>
		      	
		      	<tr>
		      		<td colspan="2" id='apply_activity' style="text-align: center;">
		      			<c:if test="${isApplyed == 'isApplyed' }">
		      				<span style="color:blue;">已报名</span>
			      			<button class="btn btn-primary" id="cancel">取消报名</button>
		      			</c:if>
		      			<c:if test="${isApplyed == 'unApply' }">
		      				<button class="btn btn-primary" id="apply">我要报名</button>
		      			</c:if>
		      		</td>
		      	</tr>
		      	<tr id="comment_tip">
		      		<td colspan="2" style="text-align: left;">
		      			<span class="td_title">评论</span>
		      		</td>
		      	</tr>
		      	<tr id="comment_tr">
		      		<td colspan="2">
		      			<textarea cols="30" rows="3" name="content" id="content" style="width: 800px;"></textarea>
		      		</td>
		      	</tr>
		      	<tr id="comment_btn">
		      		<td colspan="2" style="text-align: right;">
		      			<button class="btn btn-success" id="pub_comment">发表评论</button>
		      		</td>
		      	</tr>
			</table>
			
			<div id="comment_list" style="border: 1px solid #ccc; width: 700px; margin-left: 235px;" >
	      	</div>
	      	<div id="load_div" style="width: 700px; margin-left: 185px; text-align: center;" >
	      		<button id="load_more" class="btn btn-primary">更多评论</button>
	      	</div>
	      	
		</div>
	</div>
	
    <script type="text/javascript">
    	var pageIndex = 0;
    	
		$(function(){
			var publishTime = '${activity.publishTime }';
			$('#publishTime').html('<span class="td_title">发布时间：</span>'+formatterDate(publishTime));
			
			var endDate = '${activity.endDate }';
			$('#endDate').html('<span class="td_title">报名截止时间：</span>'+formatterDate(endDate));
			
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
			
			$('#actObject').html('<span class="td_title">活动对象：</span>'+newActObject);
			
			// 判断是否可以评论
			if($('#is_comment').val() == 'comment') {
				$('#comment_tr').show();
				$('#comment_list').show();
				$('#comment_btn').show();
				$('#comment_tip').show();
				$('#load_div').show();
			}else {
				$('#comment_tr').hide();
				$('#comment_list').hide();
				$('#comment_btn').hide();
				$('#comment_tip').hide();
				$('#load_div').hide();
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
						}else if(data == 'overtimes') {
							alert('该类活动你已参加过2次！');
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
				var content = content_editor.html();
				if($.trim(content) == '') {
					alert('内容不能为空！');
					return;
				}
				if(content.length > 500) {
					alert('评论内容不能超过500字！');
					return;
				}
				
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
					alert('服务器端错误！');
				});		
			});
			
			
			commentList();
			
			// 加载更多评论列表
			$('#load_more').click(function(){
				pageIndex++;
				commentList();
			});
		});    	
		
		// 加载评论列表
		function commentList() {
			$.post(contextPath+"/comment/pager", {'pageIndex': pageIndex, 'activityId': $('#activityId').val()}).done(function(data){
				var comments = data.datas;
				var len = comments.length;
				var html = '';
				
				if(len == 0) {
					$('#load_more').hide();
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
								/*
								+ '<div class="answer"><a style="javascript:void(0);">回复</a></div>'	
								*/
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























    