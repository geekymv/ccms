/**
 * 添加专业
 */
function addSpec() {
	// 判断专业是否已经存在
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
		url : contextPath + "/college/update",
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

