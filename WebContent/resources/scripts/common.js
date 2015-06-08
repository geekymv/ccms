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
	
	$('#second_level').hide();
	
	/**
	 * 一级分类改变事件
	 */
	$("#actType").change(function(){
		var superiorId = $('#actType').val();
		$('#second_level').show();
		/**
		 * 根据一级分类id获取所有二级分类
		 */
		$.post(contextPath + "/secondLevels", {'superiorId': superiorId}).done(function(data) {
			var len = data.length;
			var html = '';
			if(len == 0) {
				html = '<option value="1">其他</option>';	
			}
			for(var i = 0; i < len; i++) {
				var secondLevel = data[i];
				html += '<option value="'+secondLevel.id+'">'+secondLevel.name+'</option>';	
			}
			
			$('#secondLevel').html(html);
			
		});
	});
	

	
});