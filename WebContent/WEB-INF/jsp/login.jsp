<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户登录</title>

    <link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/css/login.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
 <body>
	<!--导航条-->
	<nav class="navbar navbar-default" role="navigation">
		<div class="container">
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<!--导航-->
				<ul class="nav navbar-nav navbar-right">
					<%--
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">首页<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li>
								<a href="#">首页</a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="#">积分榜</a>
							</li>
							<li>
								<a href="#">新闻图片</a>
							</li>
							<li>
								<a href="#">...</a>
							</li>
						</ul>
					</li>
					 --%>
					<li>
						<a href="#" data-toggle="modal" data-target="#myModal2">开发团队</a>
					</li>
					<li>
						<a href="#">意见反馈</a>
					</li>
					<li>
						<a href="#" data-toggle="modal" data-target="#myModal">注册</a>
					</li>
				</ul>
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
	</nav>

	<!--注册模态表单
	<div class="modal fade reg-modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">用户注册</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<label class="col-sm-3 control-label">用户名</label>
							<div class="col-sm-7">
								<input type="text" class="form-control easyui-validatebox" data-options="required:true,validType:'minLength[0,10]',missingMessage:'你太短了！长度为1-10个字符',delay:200" placeholder="用户名作为登录帐号由数字和字母组成">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">设置密码</label>
							<div class="col-sm-7">
								<input type="password" class="form-control easyui-validatebox" data-options="required:true,validType:'password',missingMessage:'不填密码怎么登录？我书读得少你不要骗我'" placeholder="密码不少于六位">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" >确认密码</label>
							<div class="col-sm-7">
								<input type="password" class="form-control easyui-validatebox" data-options="required:true,validType:'password',missingMessage:'确认一下密码又不会怀孕！'" placeholder="再输入一遍密码">
							</div>
						</div>
						
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						取消
					</button>
					<button type="button" class="btn btn-primary">
						确认注册
					</button>
				</div>
			</div>
		</div>
	</div>
	-->
	
	<!-- banner -->
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="3000">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="${pageContext.request.contextPath }/resources/images/apic6146.jpg" alt="">
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath }/resources/images/apic6146.jpg" alt="">
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath }/resources/images/apic6146.jpg" alt="">
			</div>
		</div>
	</div>

	<div class="reg-bg"></div>
	<!--登录表单-->
	<div class="reg">
		<div class="page-header h3">
			<h3>用户登录</h3>
		</div>
		<form role="form" method="post">
			<div class="form-group">
				<label for="account">用户名</label>
				<input type="text" class="form-control" name="account" id="account" placeholder="输入您的用户名">
			</div>
			<div class="form-group">
				<label for="password">密码</label>
				<input type="password" class="form-control" name="password" id="password" placeholder="输入您的密码">
			</div>
			<div class="form-group">
				<div class="checkbox">
					<label><input type="checkbox">记住密码 </label>
					<label class="forget"><a href="#">忘记密码？</a></label>
				</div>
			</div>
			<button type="button" class="btn btn-primary sub-btn">登　　录</button>
		</form>
	</div>
	
    <script src="${pageContext.request.contextPath }/resources/scripts/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
		$(function(){
			$('.sub-btn').on('click', function(){
				var account = $("#account").val();
				var password = $("#password").val();
				
				$.ajax({
					url: 'login',
					type: 'post',
					data: {'account': account, 'password': password},
					dataType: 'text',
					success: function(data){
						if(data == 'student_success') {
							alert('学生登录成功！');
							window.location.href="${pageContext.request.contextPath }/stu/stu_success"
							
						}else if(data == 'college_success'){
							alert('College登录成功！');	
							window.location.href="${pageContext.request.contextPath }/admin/admin_success"
							
						}else if(data == 'errors'){
							alert('用户名或密码错误！');
						}
					}
				});
			});
		});
	</script>    
    
  </body>
</html>

























