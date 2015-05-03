/**
 * 添加专业
 */
function addSpec() {
	var val = jQuery("#name").val();
	jQuery.ajax({
		url : contextPath + "/college/addSpec",
		type : "post",
		data : {"name": val},
		dataType : "text",
		success : function(data) {
			if(data == "isexist"){
				alert(val + " 专业已经存在了！");
			}else if (data == "success") {
				alert("添加成功！");
			}else if (data == "fail"){
				alert("添加失败！");
			}
		}
	});
}

/**
 * 更新个人信息
 */
function updateMyInfo() {
	var $ = jQuery;
	var password = $("#password").val().trim();
	var repassword = $("#repassword").val().trim();
	var name = $("#name").val().trim();
	var phone = $("#phone").val().trim();
	var contact = $("#contact").val().trim();
	var address = $("#address").val().trim();
	
	// 输入验证
	if(password != ""){
		if(password.length < 6) {
			alert("密码长度不能小于6");
			return;
		}
		if(password.length > 20) {
			alert("密码长度不能大于20");
			return;
		}
		if(repassword == ""){
			alert("密码确认不能为空！");
			return;
		}
		if(password != repassword) {
			alert("密码不一致！");
			return;
		}
	}
	if(name == "") {
		alert("名称不能为空！");
		return;
	}
	if(phone == "") {
		alert("电话号码不能为空！");
		return;
	}
	if(address == "") {
		alert("地址不能为空！");
		return;
	}

	// 发送ajax请求
	jQuery.ajax({
		url : contextPath + "/admin/update",
		type : "post",
		data : {"id": $("#id").val(), "pwd": password, "name": name, 
				"phone": phone, "contact": contact, "address": address},
		dataType : "text",
		success : function(data) {
			var mgs = "服务器端错误！";
			if(data == "success") {
				msg = "更新成功！"
			}else if(data == "fail") {
				msg = "更新失败！";
			}
			alert(msg);
			window.location.reload();
		}
	});
}


/**
 * 发布招聘信息
 */
function pubActivity() { 
	var $ = jQuery;
	
	if(activityValidate()) {	// 通过验证
		alert('ok');
		
		var data = get_form_data('#pub_form');
		
		jQuery.post(contextPath+'/admin/pubActivity', data).done(function(msg){
			if(msg == 'success') {
				alert('发布成功！');
			} if (msg == 'fail') {
				alert('发布失败！');
			}
		}).fail(function(msg){
			alert('服务器端错误！');
		});	
	}
	
}


function activityValidate() {
	var $ = jQuery;
	// 活动名称
	var name = $('#name').val();
	if(name.trim() == '') {
		alert('活动名称为必选项！');
		$('#name').focus();
		return false;
	}
	
	// 活动时间
	var dateTime = $('#dateTime').val();
	if(dateTime.trim() == '') {
		alert('活动时间为必选项！');
		$('#dateTime').focus();
		return false;
	}
	
	// 报名截止时间
	var endDate = $('#endDate').val();
	if(endDate.trim() == '') {
		alert('报名截止时间为必选项！');
		$('#endDate').focus();
		return false;
	}
	
	// 活动地点
	var location = $('#location').val();
	if(location.trim() == '') {
		alert('活动地点为必选项！');
		$('#location').focus();
		return false;
	}
	
	// 活动目的
	var aim = $('#aim').val();
	if(aim.trim() == '') {
		alert('活动目的为必选项！');
		$('#aim').focus();
		return false;
	}
	
	// 活动内容
	var content = $('#content').val();
	if(content.trim() == '') {
		alert('活动内容为必选项！');
		$('#content').focus();
		return false;
	}
	
	// 加分时长
	var reg_zzs = /^\+?[1-9][0-9]*$/;
	var duration = $('#duration').val();

	if(!reg_zzs.test(duration)) {
		alert('加分时长不合法！');
		$('#duration').focus();
		return false;
	}
	
	// 参与对象
	var actObject = $('#actObject').val();
	if(actObject.trim() == '') {
		alert('参与对象为必填项！');
		$('#actObject').focus();
		return false;
	}
	
	// 参与人数
	var number = $('#number').val();
	if(!reg_zzs.test(number)) {
		alert('参与人数不合法！');
		$('#number').focus();
		return false;
	}
	
	// 联系人
	var contact = $('#contact').val();
	if(contact.trim() == '') {
		alert('联系人为必填项！');
		$('#contact').focus();
		return false;
	}
	
	// 联系方式
	var phone = $('#phone').val();
	var reg_phone = /(^(\d{3,4}-)?\d{7,8})$|(1[0-9]{10})/;	// 电话号码与手机号码同时验证
	if(!reg_phone.test(phone)) {
		alert('联系方式不合法！');
		$('#phone').focus();
		return false;
	}
	
	return true;
	
}



