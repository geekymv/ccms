jQuery(function() {
	// 加载活动加分类型
	$.ajax({
		url : contextPath + "/activityTypes",
		dataType : "json",
		success : function(data) {
			var html = "<option value='-1'>选择类型</option>";
			for (var i = 0; i < data.length; i++) {
				var type = data[i];
				html += "<option value=" + type.id + ">" + type.name
						+ "</option>";
			}
			jQuery("#actType").html(html);
		}
	});
});