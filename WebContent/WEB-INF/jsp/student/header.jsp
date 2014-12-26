<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".login").click(function(){
			// 显示登录模态框
			$("#myModal").modal('show');
		});
		
		$("#login").click(function(){
			var account = $("#account").val();
			var password = $("#password").val();
			
			if(!account || !password) {
				$(".error").html("用户名或密码不能为空！");
				return;
			}
			
			$.ajax({
				url: "${pageContext.request.contextPath }/stu/login",
				type: "POST",
				data: {"account": account, "password": password},
				dataType: "text",
				success: function(data){
					if(data == "success"){
						$("#myModal").modal('hide');
						window.location.reload(); // 刷新当前页面
					}else if(data == "fail"){
						$(".error").html("用户名或密码错误！");
					}
				}
			});
			
		});
		
		
		$("#logout").click(function(){
			$.ajax({
				url: "${pageContext.request.contextPath }/stu/logout",
				type: "POST",
				dataType: "text",
				success: function(data){
					alert(data);
					window.location.href="index"; 
				}
			});
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
						欢迎${user.name }
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
						<a href="http://qgzx.ahau.edu.cn/qgzx/" target="_blank">
							<img src="${pageContext.request.contextPath }/resources/images/about_qg.png" title="关于勤管" />
						</a>
					</li>
					<li>
						<a href="#">
						<img src="${pageContext.request.contextPath }/resources/images/question.png" title="问题解答" />
						</a>
					</li>
					<li>
						<a href="hkjs/gyhk.html" target="_blank">
						<img src="${pageContext.request.contextPath }/resources/images/team.png" title="开发团队" />
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
				<li><a href="${pageContext.request.contextPath }/index" target="_parent">首页</a></li>
				<li><a href="${pageContext.request.contextPath }/stu/myactivities" target="_parent">我的公益活动</a></li>
				<li><a href="sjtj.html" target="_parent">时间统计</a></li>
				<li><a href="${pageContext.request.contextPath }/stu/${user.num }/infocenter" target="_parent">账号管理</a></li>
				<li><a href="${pageContext.request.contextPath }" target="_parent">活动公告</a></li>

				<li><a href="" target="_parent">文档下载</a></li>
				<div class="clear"> </div>
			</ul>
		</div>
	  </div>
	</div>
	
	<!-- 用户登录 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog" style="width: 400px; margin-top: 200px">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">
	        <span aria-hidden="true">&times;</span>
	        <span class="sr-only">Close</span></button>
	        <h4 class="modal-title" id="myModalLabel">用户登录</h4>
	      </div>
	      <div class="modal-body">
			<form class="form-horizontal" role="form">
			  <div class="form-group">
			    <label for="account" class="col-sm-2 control-label">账号</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="account" name="account" placeholder="请输入账号"/>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="password" class="col-sm-2 control-label">密码</label>
			    <div class="col-sm-10">
			      <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码"/>
			    </div>
			  </div>
			  <div class="form-group">
			  	<div class='col-sm-10 col-sm-offset-2 error' style="color: red;">
			  	</div>
			  </div>
			  
			  <!-- 
			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			      <div class="checkbox">
			        <label>
			          <input type="checkbox">下次自动登录
			        </label>
			      </div>
			    </div>
			  </div>
			   -->	
			</form>

	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="login">登录</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	      </div>
	    </div>
	  </div>
	</div>

</body>
</html>