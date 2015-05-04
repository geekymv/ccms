<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>添加用工单位</title>
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
	            <li>单位管理 <span class="separator"></span></li>
	            <li>添加单位</li>
        	</ul>
        	<div class="maincontent">
        	<div class="maincontentinner">
            <div class="widget">
                <h4 class="widgettitle">添加单位</h4>
                <div class="widgetcontent">
                    <form id="add_form" class="stdform" style="width: 600px;margin-left: 200px;">
                            <div class="par control-group my-par">
                                <label class="control-label" for="account">账号<span class="tips">*</span></label>
                                <div class="controls">
                                	<input type="text" name="account" id="account" autofocus="autofocus" class="input-large" />
                                </div>
                            </div>
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
                            <div class="control-group my-par">
                                    <label class="control-label" for="name">名称<span class="tips">*</span></label>
                                <div class="controls">
                                	<input type="text" name="name" value="${college.name }" id="name" class="input-large" />
                                </div>
                            </div>
                            
                            <p>
	                            <label>类别<span class="tips">*</span></label>
	                            <span class="formwrapper">
	                            	<input type="radio" name="colType" value="2"  checked="checked" />学院 &nbsp; &nbsp;
	                            	<input type="radio" name="colType" value="3" />用工单位 &nbsp; &nbsp;
	                            </span>
	                        </p>
                            
                            <div class="par control-group my-par">
                                    <label class="control-label" for="phone">电话号码<span class="tips">*</span></label>
                                <div class="controls">
                                	<input type="text" name="phone" value="${college.phone }" id="phone" class="input-large" />
                                </div>
                            </div>
                            
                            <div class="par control-group my-par">
                                    <label class="control-label" for="contact">联系人<span class="tips">*</span></label>
                                <div class="controls">
                                	<input type="text" name="contact" value="${college.contact }" id="contact" class="input-large" />
                                </div>
                            </div>
                            <div class="par control-group">
                                    <label class="control-label" for="address">地址<span class="tips">*</span></label>
                                <div class="controls">
	                                <textarea cols="10" rows="3" name="address" class="input-large" id="address">${college.address }</textarea>
	                            </div> 
                            </div>
                                                    
                            <p class="stdformbutton">
                                    <button type="button" class="btn btn-primary" onclick="addEmployer();">添加</button>
                            </p>
                    </form>
                </div><!--widgetcontent-->
            </div><!--widget-->
            </div>
            </div>      
		</div>
	</div><!--end of mainwrapper-->
	
	<script type="text/javascript">
		var $ = jQuery;
			
		// 添加用工单位	
		function addEmployer() {
			var account = $('#account').val();
			var password = $('#password').val();
			var repassword = $('#repassword').val();
			var name = $('#name').val();
			var phone = $('#phone').val();
			var contact = $('#contact').val();
			var address = $('#address').val();
			
			if(account.trim() == '') {
				alert('账号为必填项！');
				$('#account').focus();
				return;
			}
			
			if(password.trim() == '') {
				alert('密码为必填项！');
				$('#password').focus();
				return;
			}
			if(password.length < 6) {
				alert('密码长度不能小于6！');
				$('#password').focus();
				return;
			}
			if(password.length > 15) {
				alert('密码长度不能大于15！');
				$('#password').focus();
				return;
			}
			
			if(password != repassword) {
				alert('密码不相等！');
				$('#repassword').focus();
				return;
			}
			
			if(account.trim() == '') {
				alert('账号为必填项！');
				$('#account').focus();
				return;
			}
			
			if(name.trim() == '') {
				alert('名称为必填项！');
				$('#name').focus();
				return;
			}
			
			var reg_phone = /(^(\d{3,4}-)?\d{7,8})$|(1[0-9]{10})/;	// 电话号码与手机号码同时验证
			if(!reg_phone.test(phone)) {
				alert('电话号码不合法！');
				$('#phone').focus();
				return;
			}
			
			if(contact.trim() == '') {
				alert('联系人为必填项！');
				$('#contact').focus();
				return;
			}
			
			if(address.trim() == '') {
				alert('地址为必填项！');
				$('#address').focus();
				return;
			}
		
			
			var data = get_form_data('#add_form');

			jQuery.post(contextPath+"/admin/add_employer", data).done(function(msg) {
				if(msg == 'nameIsExist') {
					alert('名称已存在');
				}else if(msg == 'accountIsExist') {
					alert('账号已存在！');
				}else if (msg == 'success') {
					alert('添加成功！');
				}else if (msg == 'fail') {
					alert('添加失败！');
				}
				
			}).fail(function(msg) {
				
			});
		}
	
	</script>

</body>
</html>    




