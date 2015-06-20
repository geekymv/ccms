<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>更新用工单位</title>
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
	            <li>更新单位</li>
        	</ul>
        	<div class="maincontent">
        	<div class="maincontentinner">
            <div class="widget">
                <h4 class="widgettitle">更新单位</h4>
                <div class="widgetcontent">
                    <form id="add_form" class="stdform" style="width: 600px;margin-left: 200px;">
                            <div class="par control-group my-par">
                                <label class="control-label" for="account">账号<span class="tips">*</span></label>
                                <div class="controls">
                                	<input type="text" name="account" id="account" autofocus="autofocus" class="input-large" />
									<input type="hidden" id="empId" name="id" value="${empId }" />
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
                                	<input type="text" name="name" id="name" class="input-large" />
                                </div>
                            </div>
                            
                            <p>
	                            <label>类别<span class="tips">*</span></label>
	                            <span class="formwrapper" id="category">
	                            </span>
	                        </p>
                            
                            <div class="par control-group my-par">
                                    <label class="control-label" for="phone">电话号码<span class="tips">*</span></label>
                                <div class="controls">
                                	<input type="text" name="phone" id="phone" class="input-large" />
                                </div>
                            </div>
                            
                            <div class="par control-group my-par">
                                    <label class="control-label" for="contact">联系人<span class="tips">*</span></label>
                                <div class="controls">
                                	<input type="text" name="contact" id="contact" class="input-large" />
                                </div>
                            </div>
                            <div class="par control-group">
                                    <label class="control-label" for="address">地址<span class="tips">*</span></label>
                                <div class="controls">
	                                <textarea cols="10" rows="3" name="address" class="input-large" id="address">${college.address }</textarea>
	                            </div> 
                            </div>
                                                    
                            <p class="stdformbutton">
                                    <button type="button" class="btn btn-primary" onclick="editEmployer();">更新</button>
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
		$.post(contextPath+"/admin/getCollege", {'id': $('#empId').val()}).done(function(data){
			var id = data.id;
			var account = data.account;
			var address = data.address;
			var colType = data.colType;
			var contact = data.contact;
			var name = data.name;
			var phone = data.phone;
			
			$('#account').val(account);
			$('#name').val(name);
			$('#phone').val(phone);
			$('#contact').val(contact);
			$('#address').val(address);
			
			var html = '';
			if(colType == 2) {
				html += '<input type="radio" name="colType" value="2"  checked="checked" />学院 &nbsp; &nbsp;'
	        		+'<input type="radio" name="colType" value="3" />用工单位 &nbsp; &nbsp;';
			}else {
				html += '<input type="radio" name="colType" value="2"/>学院 &nbsp; &nbsp;'
	        		+'<input type="radio" name="colType" value="3" checked="checked" />用工单位 &nbsp; &nbsp;';
			}
			$('#category').html(html);
			
		}).fail(function(msg){
		});

		// 添加用工单位	
		function editEmployer() {
			var account = $('#account').val();
			var password = $('#password').val();
			var repassword = $('#repassword').val();
			var name = $('#name').val();
			var phone = $('#phone').val();
			var contact = $('#contact').val();
			var address = $('#address').val();
			
			if($.trim(account) == '') {
				$('#account').focus();
				return;
			}
			if($.trim(password) != '') {
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
					alert('密码不一致！');
					$('#repassword').focus();
					return;
				}
			}
			
			if($.trim(repassword) != '') {
				if($.trim(password) == '') {
					alert('密码不能为空！');
					$('#password').focus();
					return;
				} 
			}

			
			if($.trim(account) == '') {
				alert('账号为必填项！');
				$('#account').focus();
				return;
			}
			
			if($.trim(name) == '') {
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
			
			if($.trim(contact) == '') {
				alert('联系人为必填项！');
				$('#contact').focus();
				return;
			}
			
			if($.trim(address) == '') {
				alert('地址为必填项！');
				$('#address').focus();
				return;
			}
			
			var data = get_form_data('#add_form');

			jQuery.post(contextPath+"/admin/editCollege", data).done(function(msg) {
				if(msg == 'success') {
					alert('更新成功！');
				}else if(msg == 'fail') {
					alert('更新失败');
				}
			}).fail(function(msg) {
				alert(msg);
			});
		}
	
	</script>

</body>
</html>    




