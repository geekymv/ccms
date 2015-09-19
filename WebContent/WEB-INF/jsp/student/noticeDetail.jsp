<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp"%>   
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>通知公告详情</title>
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
			  <li class="active">公告详情</li>
			</ol>
			
			<input type="hidden" name="noticeId" id="noticeId" value="${id }" />
			<table class="table table-bordered table-hover table-condensed table-responsive" style="width: 700px; text-align: left;">
				<tr>
			    	<td colspan="2">
			    		<span class="td_title">标题：</span>
			    		<span id="title"></span>
			    	</td>
			    </tr>  
			    <tr>
			        <td colspan="2">
			        	<span class="td_title">内容：</span>
						<span id="content"></span>
			        </td>
			    </tr>
			    <tr>
			    	<td colspan="2" id="actObject">
				    	<span class="td_title">发布单位：</span>
						<span id="pubName"></span>
				    </td>
			    </tr>  
			    <tr>
			    	<td colspan="2" >
			    		<span class="td_title">发布时间：</span>
			    		<span id="pubTime"></span>
			    	</td>
			    </tr> 
			  
			</table>
		</div>
	</div>
	
    <script type="text/javascript">
		$(function() {
			$.post(contextPath+"/notice/detail", {'noticeId': $('#noticeId').val()}).done(function(d) {
				if(d) {
					$('#title').html(d.title);
					$('#content').html(d.content);
					$('#pubName').html(d.pubName);
					$('#pubTime').html(formatterDate(d.pubTime));
				}
				
			}).fail(function() {
			});			
		});    
    </script>
   
  </body>
</html>























    