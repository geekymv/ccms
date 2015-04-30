//获取表单数据
function get_form_data(form_id) {
	var data = jQuery(form_id).serialize();	
	return decodeURIComponent(data, true);	// 解决中文乱码问题
}

function formatterDate(time) {
	if(time == null || time.trim() == '') {
		return "";
	}
	if (time.length == 14) {
		return time.substring(0, 4) + "-" + time.substring(4, 6) + "-"
				+ time.substring(6, 8) + " " + time.substring(8, 10) + ":"
				+ time.substring(10, 12) + ":" + time.substring(12, 14);
	}else if(time.length == 8) {
		return time.substring(0, 4) + "-" + time.substring(4, 6) + "-"
		+ time.substring(6, 8);
	}
	return "";
}