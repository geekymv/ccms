<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>添加学生</title>
<%@ include file="/WEB-INF/jsp/inc/admin_style.jsp"%>

<style type="text/css">
	.my-par {
		height: 32px;
	}
	.tips {
   		color: red;
   		padding-left: 10px;
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
	            <li>添加学生</li>
        	</ul>
        	<div class="maincontent">
        	<div class="maincontentinner">
            <div class="widget">
                <h4 class="widgettitle">添加学生</h4>
                <div class="widgetcontent">
                    <form id="add_form" class="stdform" style="width: 600px;margin-left: 180px;">
                            <div class="par control-group my-par">
                                <label class="control-label" for="account">学号<span class="tips">*</span></label>
                                <div class="controls">
                                	<input type="text" name="num" id="num" autofocus="autofocus" class="input-large" />
                                </div>
                            </div>
                            <div class="control-group my-par">
                                <label class="control-label" for="name">姓名<span class="tips">*</span></label>
                                <div class="controls">
                                	<input type="text" name="name" id="name" class="input-large" />
                                </div>
                            </div>
                            <!-- 
                            <div class="par control-group my-par">
                                <label class="control-label" for="password">登录密码<span class="tips">*</span></label>
                                <div class="controls">
                                	<input type="password" name="pwd" id="password" class="input-large" />
                                </div>
                            </div>
                            <div class="par control-group my-par">
	                            <label class="control-label" for="repassword">密码确认<span class="tips">*</span></label>
                                <div class="controls">
                                	<input type="password" name="repassword" id="repassword" class="input-large" />
                                </div>
                            </div>
                             -->
                            
                            <div class="par control-group my-par">
	                            <label class="control-label" for="repassword">性别<span class="tips">*</span></label>
                                <div class="controls div-top">
                                	<input type="radio" name="gender" value="男" checked="checked"/> 男 &nbsp; &nbsp;
	                            	<input type="radio" name="gender" value="女" />女 &nbsp; &nbsp;
                                </div>
                            </div>
                           <p>
	                        	<label>专业<span class="tips">*</span></label>
	                        	<span class="formwrapper">
	                        		<select id="spec" name="specialty.id">
	                        		</select>
	                        	</span>
	                        </p>	
                            <p>
	                            <label>受助等级<span class="tips">*</span></label>
	                            <span class="formwrapper">
	                            	<select id="rank" name="rank.id">
	                            	</select>
	                            </span>
	                        </p>
                            <div class="par control-group my-par">
                                    <label class="control-label" for="phone">电话号码</label>
                                <div class="controls">
                                	<input type="text" name="phone" id="phone" class="input-large" />
                                </div>
                            </div>
                            <p class="stdformbutton">
                                    <button type="button" class="btn btn-primary" id="addStudent">添加</button>
                            </p>
                    </form>
                </div><!--widgetcontent-->
            </div><!--widget-->
            </div>
            </div>      
		</div>
	</div><!--end of mainwrapper-->
	
	<script type="text/javascript" src="${ctx }/resources/scripts/utils/util.js"></script>
	<script type="text/javascript">
		$(function() {
			// 根据学院id加载专业列表
			$.post(contextPath+"/getAllSpecialty", {'collegeId': '${user.id}'}).done(function(data) {
				var len = data.length;
				var html = '';
				for(var i = 0; i < len; i++) {
					var spec = data[i];
					html += '<option value="'+spec.id+'">'+spec.name+'</option>';	
				}
				$('#spec').html(html);
			});
			
			// 加载受助等级
			$.post(contextPath+"/getRanks").done(function(data) {
				var len = data.length;
				var html = '';
				for(var i = 0; i < len; i++) {
					var rank = data[i];
					html += '<option value="'+rank.id+'">'+rank.name+'</option>';	
				}
				$('#rank').html(html);
			});
			
			$('#num').blur(function() {
				var num = $('#num').val();
				if($.trim(num) == '') {
					$('#num').append('<span>学号不能为空！</span>')
					$('#num').focus();
					return;
				}
				$.post(contextPath+"/studentIsExist", {'num': num, 'year': ''}).done(function(msg) {
					if(msg == 'isexist') {	// 学号已存在
						alert('该学号在本学年已存在！');
						$('#num').select();
						$('#addStudent').attr('disabled', 'disabled');
						return;
					}else if(msg == 'notexist') {
						var $disabled = $("#addStudent").attr('disabled');
						if('undefined' == typeof($disabled)) {
						}else {
							$('#addStudent').removeAttr('disabled');
						}
					}
				});		
			});
			
			// 添加受助学生
			$('#addStudent').click(function() {
				// 数据验证
				var num = $('#num').val();
				var name = $('#name').val();
				var phone = $('#phone').val();
				
				if($.trim(phone) != '') {
					var reg_phone = /(^(\d{3,4}-)?\d{7,8})$|(1[0-9]{10})/;	// 电话号码与手机号码同时验证
					if(!reg_phone.test(phone)) {
						alert('电话号码不合法！');
						$('#phone').focus();
						return;
					}	
				}	
				
				var data = get_form_data('#add_form');
				$.post(contextPath+"/admin/addStudent", data).done(function(msg) {
					if('success' == msg) {
						alert('添加成功！');
						window.location.href = contextPath+'/admin/students';
					}else if('fail' == msg) {
						alert('添加失败！');
					}
				});
			});
		});	
	</script>

</body>
</html>    




