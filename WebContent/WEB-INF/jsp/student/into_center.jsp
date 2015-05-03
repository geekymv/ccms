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
    	
    	td span {
    		color: red;
    		padding-left: 10px;
    	}
    	
    	#td-submit {
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
			  <li class="active">账号管理</li>
			</ol>
			<form id="stuform">
			<table class="table table-bordered table-hover table-condensed table-responsive" style="width: 500px;">
				<tr>
			    	<th>学号</th> 
			    	<td>
			    		${student.num }
			    		<input type="hidden" name="id" value="${student.id }"/>
			    		<input type="hidden" name="num" value="${student.num }"/>
			    	</td>
			    </tr>  
			    <tr>
			        <th>登录密码</th> 
			        <td>
			        	<input type="password" name="pwd" id="pwd" />
			        	<span>若不修改密码，不用填写</span>
			        </td>
			    </tr>
			    <tr>
			        <th>密码确认</th> 
			        <td>
			        	<input type="password" name="repwd" id="repwd" />
			        </td>
			    </tr>
			    <tr>
			        <th>姓名</th> 
			        <td>
			        	<input type="text" name="name" id="name" value="${student.name}" autofocus="autofocus" />
			        	<span>*</span>
			        </td>
			    </tr>
			     <tr>
			        <th>性别</th> 
			        <td>
		        	<c:choose>
		        		<c:when test="${student.gender == '男'}">
		        			<input type="radio" name="gender" value="男" checked="checked"/> 男
		        			<input type="radio" name="gender" value="女"/> 女
		        		</c:when>
		        		<c:when test="${student.gender == '女'}">
		        			<input type="radio" name="gender" value="男"/> 男
		        			<input type="radio" name="gender" value="女"  checked="checked"/> 女
		        		</c:when>
		        	</c:choose>
			        </td>
			    </tr>
			    <tr>
			    	<th>学院</th> 
			    	<td>
		    		<select name="college.id" id="col_name">
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
		    		<span>*</span>
			    	</td>
			    </tr>    
			    <tr>
			    	<th>专业</th>
			    	<td>
			    	<select name="specialty.id" id="spe_id">
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
			    	<span>*</span>	
			    	</td>
			    </tr>  
			    <tr>
			    	<th>受助等级</th>
			    	<td>
			    		<input type="hidden" name="rank.id" value="${student.rank.id }" />
			    		${student.rank.name }
			    	
			    	</td>
			    </tr>
			    
			    <tr>
			    	<th>联系方式</th> 
			    	<td>
			    		<input type="text" name="phone" id="phone" value="${student.phone}" />
			    		<span>*</span>
			    	</td>
			    
			    </tr> 
			    <tr>
			    	<th>邮箱</th> 
			    	<td>
			    		<input type="text" name="email" id="email" value="${student.email }"/>
			    		<span>*</span>
			    	</td>
			    </tr> 
			    <tr>
			    	<th>QQ</th> 
			    	<td>
			    		<input type="text" name="qq" id="qq" value="${student.qq }" />
			    	</td>
			    </tr> 
			    <tr>
			    	<th>个人简介</th> 
			    	<td>
			    		<textarea name="introduce" id="introduce" rows="4" cols="22"><c:if test="${empty student.introduce }">暂无介绍...</c:if></textarea>
			    	</td>
			    </tr> 
			    
			    <tr>
			    	<td colspan="2" id="td-submit">
			    		<button type="button"  class="btn btn-primary" id="submit">确认修改</button>
			    	</td>
			    </tr>
			</table>
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
							
				var name = $("#name").val().trim(); // 姓名
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
				}
				
				var introduce = $("#introduce").val();
	
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























    