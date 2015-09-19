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
		        		$('tbody').html('<div style="text-align: center; color: blue">暂无公告！</div>');
		        	}else {
		        		$('thead').show();
		        		
		        		var html = "";
		        		for(var i = 0; i < len; i++) {
		        			var notice = datas[i];
		        			html += "<tr>"
		        					+ "<td>"+ notice.title +"</td>"
		        					+ "<td>"+ notice.pubName +"</td>"
		        					+ "<td>"+ formatterDate(notice.pubTime) +"</td>"
		        					+ '<td><a href="javascript:;" class="detail" data-id="'+notice.id+'">查看</a></td>'
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
		
		/**
		 * 添加查看详情事件
		 */
		$('#t_body').on('click', '.detail', function() {
			var $this = $(this);
			var id = $this.data('id');
			window.location.href = contextPath + "/stu/noticeDetail/" + id;
		});
		
	}
	
})();