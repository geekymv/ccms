$(function(){
	// 加载活动加分类型
	$.ajax({
		url : contextPath + "/activityTypes",
		dataType : "json",
		async: false, // 同步
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
	
	pager();
	
	$('#search_btn').click(function() {
		$('#page').page( 'destroy' )
		pager();
	});
	
});

function pager() {
	$("#page").page({
	    remote: {
	        url: contextPath + '/stu/activities',
	        params: {"collegeName": $('#search').val(), 'actType': $('#actType').val(), 'colId': $('#user_college_id').val()},
	        callback: function (result) {
	        	var datas = result.datas;
	        	var len = datas.length;
	        	if(len == 0) {
	        		$('thead').hide();
	        		$('tbody').html('<div style="text-align: center; color: blue">暂无活动！</div>');
	        	}else {
	        		$('thead').show();
	        		
	        		var html = "";
	        		for(var i = 0; i < len; i++) {
	        			var act = datas[i];
	        			
	        			var name = act.name;
	        			if(name.length > 10) {
	        				name = name.substring(0, 11);
	        			}
	        			
	        			var actObject = act.actObject;
	        			var newActObject = '';
	        			if(actObject == -1) {
	        				newActObject = '全校学生';
	        			}else {
	        				$.ajax({
	        					url: contextPath+"/getCollegeById",
	        					data: {'colId': actObject},
	        					type: 'POST',	
	        					async: false, // 同步
								dataType: 'json',
 								success: function(data){
									newActObject = data.name + '学生';
								}
	        				});
	        			}
	        			
	        			html += "<tr>"
	        					+ "<td style='text-align:left;'><span title='"+act.name+"'>"+ name +"</span></td>"
	        					+ "<td>"+ act.college.name +"</td>"
	        					+ "<td>"+ newActObject +"</td>"
	        					+ "<td>"+ formatterDate(act.endDate) +"</td>"
	        					+ "<td>"+ act.actType.name +"</td>"
	        					+ "<td>"+ act.duration +"</td>"
	        					+ "<td><span title='查看' style='cursor:pointer;' data-id='"+act.id+"' class='glyphicon glyphicon-eye-open' onclick='show(this)'></span></td>"
	        					
	        				+"</tr>";
	        		}
	        		
	        		$('#t_body').html(html);
	        	}
	        }
	    },
		pageIndexName: 'pageIndex',     //请求参数，当前页数，索引从0开始
		pageSizeName: 'pageSize',       //请求参数，每页数量
		totalName: 'totalRecord'       //指定返回数据的总数据量
	});
	
	
}


/*查看活动详情*/
function show(t) {
	var $this = $(t);
	var id = $this.data('id');
	window.location.href= contextPath+'/stu/activity_detail/' + id;
}
