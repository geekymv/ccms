<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
<script type="text/javascript">
	$(function(){
		$("#logout").click(function(){
			var res = confirm("确定要退出么？");
			if(res){
				$.ajax({
					url: "${pageContext.request.contextPath }/logout",
					type: "POST",
					dataType: "text",
					success: function(data){
						window.location.href="${pageContext.request.contextPath }/"; 
					}
				});
			}			
		});
	});
</script>

</head>
<body>
	<div class="row">
	  <div class="top-header">
		<div class="wrap">
		  <div class="top-header-left">
			<p>0551--65786473</p>
		  </div>
		  <div class="right-left">
			<ul>
				<c:choose>
					<c:when test="${empty user }">
						<li class="sign">
						<a style="cursor: pointer;" class="login">登录</a>	
						</li>
					</c:when>
					<c:otherwise>
						当前用户：${user.name }
						<li class="logout"><a style="cursor: pointer;" id="logout">退出</a></li>
					</c:otherwise>
				</c:choose>
				
				
				
			</ul>
		  </div>
		  <div class="clear"> </div>
		</div>
	  </div>
	  <div class="main-header">
		<div class="wrap">
			<div class="logo">
				<img src="${pageContext.request.contextPath }/resources/images/logo.png" style="cursor: pointer;"/>
			</div>
			<div class="social-links">
				<ul>
					<li>
						<a title="勤工助学管理中心" href="http://qgzx.ahau.edu.cn/qgzx/" target="_blank">
							<img src="${pageContext.request.contextPath }/resources/images/about_qg.png" title="勤工助学管理中心" />
						</a>
					</li>
					<li>
						<a title="问题解答" href="javascript:void(0);" onclick="alert('攻城狮们正在努力开发中...')">
						<img src="${pageContext.request.contextPath }/resources/images/question.png" title="问题解答" />
						</a>
					</li>
					<li>
						<a title="嘿客科技传媒" href="http://hkkj.aliapp.com" target="_blank">
						<img src="${pageContext.request.contextPath }/resources/images/team.png" title="嘿客科技传媒" />
						</a>
					</li>
				</ul>
			</div>
			<div class="clear"> </div>
		</div>
	  </div>
			<div class="clear"> </div>
	  <div class="top-nav">
		<div class="warp">
			<ul>
				<li><a href="${pageContext.request.contextPath }/stu/index" target="_parent">首页</a></li>
				<li><a href="${pageContext.request.contextPath }/stu/myactivities" target="_parent">我的公益活动</a></li>
				<li><a href="${pageContext.request.contextPath }/stu/timeCounter" target="_parent">时间统计</a></li>
				<li><a href="${pageContext.request.contextPath }/stu/${user.num }/infocenter" target="_parent">账号管理</a></li>
				<li><a href="${pageContext.request.contextPath }/stu/index" target="_parent">活动公告</a></li>
				
				 <%--
				<li><a href="" target="_parent">文档下载</a></li>
				 --%>
				<div class="clear"> </div>
			</ul>
		</div>
	  </div>
	</div>
</body>
</html>