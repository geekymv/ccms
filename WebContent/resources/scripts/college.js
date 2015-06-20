/**
 * 添加专业
 */
function addSpec() {
	var val = jQuery("#name").val();
	
	if($.trim(val) == null || $.trim(val) == '') {
		alert('专业名称不能为空！');
		return;
	}
	
	var url = '';
	var data = null;
	
	if($('#add_spec').html() == '添加专业') {	// 添加专业
		url = "/college/addSpec";
		data = {"name": val};
	}else if($('#add_spec').html() == '修改专业') {	// 修改专业
		url = '/college/editSpecialty';
		data = {'id': $('#spec_id').val(), "name": val};
	}
	
	jQuery.ajax({
		url : contextPath + url,
		type : "post",
		data :data,
		dataType : "text",
		success : function(data) {
			if(data == "isexist"){
				alert(val + " 专业已经存在了！");
			}else if (data == "success") {
				alert("操作成功！");
				window.location.reload();
			}else if (data == "fail"){
				alert("操作失败！");
			}
		}
	});
}

/**
 * 更新个人信息
 */
function updateMyInfo() {
	var $ = jQuery;
	var password = $.trim($("#password").val());
	var repassword = $.trim($("#repassword").val());
	var name = $.trim($("#name").val());
	var phone = $.trim($("#phone").val());
	var contact = $.trim($("#contact").val());
	var address = $.trim($("#address").val());
	
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
 * 申请招聘信息
 */
function pubActivity() { 
	var $ = jQuery;
	
	if(activityValidate()) {	// 通过验证
		var data = {
				'name': $('#name').val(),
				'dateTime': $('#dateTime').val(),
				'endDate': $('#endDate').val(),
				'location': $('#location').val(),
				'actType.id': $('#actType').val(),
				'secondLevel.id': $('#secondLevel').val(),
				'aim': aim_editor.html(),
				'content': content_editor.html(),
				'duration': $('#duration').val(),
				'actObject': $('#actObject').val(),
				'number': $('#number').val(),
				'contact': $('#contact').val(),
				'phone': $('#phone').val(),
				'assist': $('#assist').val()
		};
		
		jQuery.post(contextPath+'/admin/pubActivity', data).done(function(msg){
			if($.trim(msg) != '') {
				alert('发布成功！');
				var as = $('a[name=fileName]');
				if(as != null) {
					for(var i = 0; i < as.size(); i++) {
						var id = $(as.get(i)).data('id');
						// 将活动和文件关联
						$.post(contextPath+"/linkFileAndActivity" , {'fileId': id, 'uuid': msg}).done(function(msg) {
						//	alert(msg);
						});
					}
				}
				window.location.href = contextPath + "/admin/activities";
				
			} else{
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
	if($.trim(name) == '') {
		alert('活动名称为必选项！');
		$('#name').focus();
		return false;
	}
	
	// 活动时间
	var dateTime = $('#dateTime').val();
	if($.trim(dateTime) == '') {
		alert('活动时间为必选项！');
		$('#dateTime').focus();
		return false;
	}
	
	// 报名截止时间
	var endDate = $('#endDate').val();
	if($.trim(endDate) == '') {
		alert('报名截止时间为必选项！');
		$('#endDate').focus();
		return false;
	}
	
	// 活动地点
	var location = $('#location').val();
	if($.trim(location) == '') {
		alert('活动地点为必选项！');
		$('#location').focus();
		return false;
	}
	
	// 加分类型
	var actType = $('#actType').val();
	if(actType == -1) {
		alert('请选择加分类型！');
		return;
	}
	
	// 活动目的
	var aim = aim_editor.html();
	if($.trim(aim) == '') {
		alert('活动目的为必选项！');
		$('#aim').focus();
		return false;
	}
	
	// 活动内容
	var content = content_editor.html();
	if($.trim(content) == '') {
		alert('活动内容为必选项！');
		$('#content').focus();
		return false;
	}
	
	// 加分时长
	var reg_zzs = /^\+?[1-9][0-9]*$/;	// 正整数
	var reg_zfds = /^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/; // 正浮点数 
	
	var duration = $('#duration').val();

	if(!reg_zzs.test(duration) && !reg_zfds.test(duration)) {
		alert('加分时长不合法！');
		$('#duration').focus();
		return false;
	}
	
	// 参与对象
	var actObject = $('#actObject').val();
	if($.trim(actObject) == '') {
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
	if($.trim(contact) == '') {
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



