<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp"%>

<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>个人中心</title>
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
			text-align: right;
    	}
    	tr td {
    		margin-left: 20px;
    	}
    	
    	#tip {
    		color: blue;
    	}
    	
    	#td-submit {
    		text-align: center;
    	}
    	
    	.div-top {
    		margin-top: 5px;
    	}
    </style>
    
  </head>
  <body>
	<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="row">
			<ol class="breadcrumb">
			  <li><a href="${pageContext.request.contextPath }/stu/index">首页</a></li>
			  <li class="active">账号管理</li>
			</ol>
			<form class="form-horizontal" id="stuform">
			  <div class="form-group">
			    <label for="num" class="col-sm-4 control-label">学号：</label>
			    <div class="col-sm-3 div-top">
			     	${student.num }
			     	<input type="hidden" name="id" value="${student.id }"/>
			    	<input type="hidden" name="num" value="${student.num }"/>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="pwd" class="col-sm-4 control-label">登录密码：</label>
			    <div class="col-sm-3">
			      <input type="password" class="form-control" name="pwd" id="pwd" />
			    </div>
			    <div class="col-sm-3 div-top">
			    	<span id="tip">若不修改密码，不用填写</span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="num" class="col-sm-4 control-label">密码确认：</label>
			    <div class="col-sm-3">
			    	<input type="password" class="form-control" name="repwd" id="repwd" />
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="num" class="col-sm-4 control-label">姓名：</label>
			    <div class="col-sm-3">
			    	<input type="text" class="form-control" name="name" id="name" value="${student.name}" autofocus="autofocus" />
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="num" class="col-sm-4 control-label">性别：</label>
			    <div class="col-sm-3">
			    	<c:choose>
		        		<c:when test="${student.gender == '男'}">
		        			<label class="radio-inline">
							  <input type="radio" name="gender" value="男" checked="checked"> 男
							</label>
							<label class="radio-inline">
							  <input type="radio" name="gender" value="女"> 女
							</label>
		        		</c:when>
		        		<c:when test="${student.gender == '女'}">
		        			<label class="radio-inline">
							  <input type="radio" name="gender" value="男"> 男
							</label>
							<label class="radio-inline">
							  <input type="radio" name="gender" value="女" checked="checked"> 女
							</label>
		        		</c:when>
		        	</c:choose>
			    </div>
			  </div>
 
			  <div class="form-group">
			    <label for="num" class="col-sm-4 control-label">学院：</label>
			    <div class="col-sm-3">
			    	<select name="college.id" id="col_name" class="form-control">
		    			<c:forEach items="${colleges }" var="college">
		    			<c:choose>
		    				<c:when test="${college.id == student.college.id }">
		    					<option value="${college.id }" selected="selected">${college.name }</option>
		    				</c:when>
		    				<c:otherwise>
		    					<option value="${college.id }">${college.name }</option>
		    				</c:otherwise>
		    			</c:choose>
		    			</c:forEach>
		    		</select>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="num" class="col-sm-4 control-label">专业：</label>
			    <div class="col-sm-3">
			    	<select name="specialty.id" id="spe_id" class="form-control">
			    		<c:forEach items="${specialties }" var="specialty">
			    		<c:choose>
			    			<c:when test="${student.specialty.id == specialty.id}">
			    				<option value="${specialty.id }" selected="selected">${specialty.name }</option>
			    			</c:when>
			    			<c:otherwise>
				    			<option value="${specialty.id }">${specialty.name }</option>
			    			</c:otherwise>
			    		</c:choose>
			    		</c:forEach>
			    	</select>	
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="num" class="col-sm-4 control-label">联系电话：</label>
			    <div class="col-sm-3">
			    	<input type="text" class="form-control" name="phone" id="phone" value="${student.phone}" />
			    </div>
			  </div>
			 
			  <div class="form-group">
			    <label for="num" class="col-sm-4 control-label">邮箱：</label>
			    <div class="col-sm-3">
			    	<input type="text" class="form-control" name="email" id="email" value="${student.email }"/>
			    </div>
			  </div>
			 
			  <div class="form-group">
			    <label for="num" class="col-sm-4 control-label">QQ：</label>
			    <div class="col-sm-3">
			    	<input type="text" class="form-control" name="qq" id="qq" value="${student.qq }" />
			    </div>
			  </div>
			 
			 <div class="form-group">
			    <label for="num" class="col-sm-4 control-label">个人简介：</label>
			    <div class="col-sm-3">
			    	 <textarea class="form-control" name="introduce" id="introduce" rows="2">${student.introduce }</textarea>
			    </div>
			  </div>
			 
			  <div class="form-group">
			    <div class="col-sm-offset-4 col-sm-10">
			    	<button type="button"  class="btn btn-primary" id="submit">确认修改</button>
			    </div>
			  </div>
			</form>
		</div>
	</div>
    
    <script type="text/javascript">
		$(function(){
			/*改变学院，对应的专业改变*/
			$("#col_name").change(function(){
				var col_id = $("#col_name").val();
				$.ajax({
					url: "${pageContext.request.contextPath}/stu/getSpecialties",
					type: "post",
					data: {"collegeId": col_id},
					dataType: "json",
					success: function(data){
							var html = '<select name="specialty.id" id="spe_id">';
							if(data.length > 0){
								for(var i = 0; i < data.length; i++){
									var specialty = data[i];
									html += '<option value="'+specialty.id+'">' +specialty.name+ '</option>';
								}
							}else {
								html += '<option value="-1">没有专业供选择</option>';
							}
							html += "</select>";	
								
							$("#spe_id").html(html);	
					
					}						
				});
			});
			
			
			/*修改信息*/
			$("#submit").click(function(){
				var id = '${student.id }'; // 学生id
				var pwd = $("#pwd").val();
				var repwd = $("#repwd").val();
				
				if(pwd != repwd) {
					alert('密码不一致');
					return;
				}
				
				var col_id = $("#col_name").val(); // 学院id
				var spe_id = $("#spe_id").val(); // 专业id	
							
				var name = $.trim($("#name").val()); // 姓名
				if(name == '') {
					alert('姓名不能为空！');
					$("#name").focus();
					return;
				}
				
				var gender = $("input[name='gender']").val(); // 性别
				
				var phone = $("#phone").val();
				var reg = /^1\d{10}/;
				if(!reg.test(phone)) {
					alert('联系方式不合法！');
					$("#phone").focus();
					return;
				}
				
				var email = $("#email").val();
				var reg_email = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
				if(!reg_email.test(email)) {
					alert('邮箱格式不合法！');
					$("#email").focus();
					return;
				}
				
				var qq = $("#qq").val();
				if(qq.length > 11) {
					alert('qq不合法！');
					return;
				}
				
				var introduce = $("#introduce").val();
				if(introduce.length > 30) {
					alert('个人简介内容不能超过30字！');
					return;
				}
	
				var data = $("#stuform").serialize();
				data = decodeURIComponent(data,true); /* 解决中文乱码问题 */
				
				$.ajax({
					url: '${pageContext.request.contextPath}/stu/updateInfo',
					type: 'post',
					data: data,
					dataType: 'text',
					success: function(data){
						if(data == 'success') {
							alert('更新成功！');
						}else if (data == 'fail') {
							alert('更新失败！');
						}
						
						window.location.reload(); //刷新当前页面						
					}
				});
			});
		});    	
    	
    </script>
  </body>
</html>























    