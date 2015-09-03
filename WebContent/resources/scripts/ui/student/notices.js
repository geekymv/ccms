(function() {
	
	pager();
	
	function pager() {
		$("#page").page({
		    remote: {
		        url: contextPath + '/stu/notices',
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
		        			var notice = datas[i];
		        			html += "<tr>"
		        					+ "<td>"+ notice.title +"</td>"
		        					+ "<td>"+ notice.pubName +"</td>"
		        					+ "<td></td>"
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
	
	
})();