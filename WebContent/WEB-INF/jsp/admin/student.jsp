<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>学生信息</title>
<%@ include file="/WEB-INF/jsp/inc/admin_style.jsp"%>

<style type="text/css">
	.my-par {
		height: 32px;
	}
	.tips {
   		color: red;
   		padding-left: 10px;
    }
    .div-top {
    	padding-top: 5px;
    }	
</style>

</head>
<body>
	<div class="mainwrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="leftpanel">
			<jsp:include page="leftmenu.jsp"></jsp:include>
		</div>
		<div class="rightpanel">
			<ul class="breadcrumbs">
	            <li><a href="${pageContext.request.contextPath }/admin"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
	            <li>学生管理 <span class="separator"></span></li>
	            <li>学生信息</li>
        	</ul>
        	<div class="maincontent">
        	<div class="maincontentinner">
            <div class="widget">
                <h4 class="widgettitle">学生信息</h4>
                <div class="widgetcontent">
                    <form id="form1" class="stdform">
                            <div class="par control-group my-par">
                                <label class="control-label" for="account">学号：</label>
                                <div class="controls div-top">
                                	${student.num }
                                	<input type="hidden" name="id" id="id" value="${student.id }" class="input-large" />
                                </div>
                            </div>
                            <div class="par control-group my-par">
                                <label class="control-label" for="password">登录密码：</label>
                                <div class="controls">
                                	<input type="password" name="password" id="password" class="input-large" />
                                	<span class="tips">若不改密码，不用填写！</span>
                                </div>
                            </div>
                            <div class="par control-group my-par">
	                            <label class="control-label" for="repassword">密码确认：</label>
                                <div class="controls">
                                	<input type="password" name="repassword" id="repassword" class="input-large" />
                                </div>
                            </div>
                            <div class="control-group my-par">
                                    <label class="control-label" for="name">姓名：</label>
                                <div class="controls">
                               	 <input type="text" name="name" id="name" class="input-large" value="${student.name }" />
                                </div>
                            </div>
                            
                            <div class="par control-group my-par">
                                    <label class="control-label" for="phone">性别：</label>
                                <div class="controls">
									${student.gender }
                                </div>
                            </div>
                            
                            <div class="par control-group my-par">
                                    <label class="control-label" for="contact">学院：</label>
                                <div class="controls div-top">
									${student.college.name }
                                </div>
                            </div>
                            <div class="par control-group">
                                <label class="control-label" for="address">专业：</label>
                                <div class="controls div-top">
									${student.specialty.name }
	                            </div> 
                            </div>
                            <div class="par control-group">
                                <label class="control-label" for="address">受助等级：</label>
                                <div class="controls div-top">
									${student.rank.name }
	                            </div> 
                            </div>
                            <div class="par control-group">
                                <label class="control-label" for="address">联系方式：</label>
                                <div class="controls div-top">
                                	<c:if test="${student.phone == null}">
                                		无
                                	</c:if>
									${student.phone }
	                            </div> 
                            </div>
                            <div class="par control-group">
                                <label class="control-label" for="address">邮箱：</label>
                                <div class="controls div-top">
                                	<c:if test="${student.email == null}">
                                		无
                                	</c:if>
                                	${student.email }
	                            </div> 
                            </div>
                            <div class="par control-group">
                                <label class="control-label" for="address">个人简介：</label>
                                <div class="controls div-top">
                                	<c:if test="${student.introduce == null}">
                                		无
                                	</c:if>
                                	${student.introduce }
	                            </div> 
                            </div>
                                                    
                            <p class="stdformbutton">
                                <button type="button" class="btn btn-primary" id="updateStudent">更新</button>
                            </p>
                    </form>
                </div><!--widgetcontent-->
            </div><!--widget-->
            </div>
            </div>      
		</div>
	</div><!--end of mainwrapper-->

	<script src="<c:url value='/resources/scripts/college.js'/>"></script>
	<script type="text/javascript">
		$(function() {
			// 更新学生信息
			$('#updateStudent').click(function() {
				var pwd = $('#password').val();
				var repwd = $('#repassword').val();
				var name = $('#name').val();
				
				if($.trim(pwd) != '') {
					if($.trim(repwd) == '') {
						alert('密码确认不能为空!');
						$('#repassword').focus();
						return;
					}
					if(repwd != pwd) {
						alert('密码不一致！');
						$('#repassword').focus();
						return;
					}
				}
				
				if($.trim(name) == '') {
					alert('姓名为必填项！');
					$('#name').focus();
					return;
				}
				
				var data = {
					'id': $('#id').val(),
					'pwd': pwd,
					'name': name
				};
				
				$.post(contextPath+"/admin/updateStudentInfo", data).done(function(msg) {
					if('success' == msg) {
						layer.msg('更新成功！');
					}else if('fail' == msg)	{
						layer.msg('更新失败！');
					} 	
				});

			});
		});
	</script>

</body>
</html>    




