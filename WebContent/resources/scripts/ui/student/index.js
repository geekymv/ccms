$(function(){
	$("#page").page({
		    remote: {
		        url: contextPath + '/stu/activities',  //请求地址
		        callback: function (result) {
		        	var datas = result.datas;
		        	var len = datas.length;
		        	if(len == 0) {
		        		
		        	}else {
		        		var html = "";
		        		for(var i = 0; i < len; i++) {
		        			var act = datas[i];
		        			
		        			html += "<tr>"
		        					+ "<td style='text-align:left;'>"+ act.name +"</td>"
		        					+ "<td>"+ act.college.name +"</td>"
		        					+ "<td>"+ act.actObject +"</td>"
		        					+ "<td>"+ formatterDate(act.publishTime) +"</td>"
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
	
});

/*查看活动详情*/
function show(t) {
	var $this = $(t);
	var id = $this.data('id');
	window.location.href= contextPath+'/stu/activity_detail/' + id;
}
