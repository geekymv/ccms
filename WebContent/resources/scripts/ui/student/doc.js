function post(URL, PARAMS) {      
    var temp = document.createElement("form");      
    temp.action = URL;      
    temp.method = "post";      
    temp.style.display = "none";      
    for (var x in PARAMS) {      
        var opt = document.createElement("textarea");      
        opt.name = x;      
        opt.value = PARAMS[x];      
        // alert(opt.name)      
        temp.appendChild(opt);      
    }      
    document.body.appendChild(temp);      
    temp.submit();      
    return temp;      
}      
function downloadAttach(t) {
	var $this = $(t);
	var fileName = $this.data('filename')
	post(contextPath+'/download', {'fileName': fileName});
}

(function() {
	$(function() {
		pager();
	});
	function pager() {
		$("#page").page({
		    remote: {
		        url: contextPath + '/stu/docs',
		        params: {},
		        callback: function (result) {
		        	var datas = result.datas;
		        	var len = datas.length;
		        	if(len == 0) {
		        		$('thead').hide();
		        		$('tbody').html('<div style="text-align: center; color: blue">暂无文档！</div>');
		        	}else {
		        		$('thead').show();
		        		var html = "<tr>";
		        		for(var i = 0; i < len; i++) {
		        			var d = datas[i];
		        			html += "<tr>"
		        				 +		"<td>"+d.originalFilename+"</td>"
		        				 +		"<td>"+d.colName+"</td>"
		        				 +		"<td>"+formatterDate(d.uploadDate)+"</td>"
		        			//	 +		'<td><a href="/ccms/upload/'+d.newFileName+'" target="_blank">下载</a></td>'
		        				 + 		'<td data-filename='+d.newFileName+' style="cursor: pointer;"  onclick="downloadAttach(this)">下载</td>'
		        				 +	"</tr>";
		        				
		        		}
		        		$('tbody').html(html);
		        	}
		        }
		    },
			pageIndexName: 'pageIndex',     //请求参数，当前页数，索引从0开始
			pageSizeName: 'pageSize',       //请求参数，每页数量
			totalName: 'totalRecord'       //指定返回数据的总数据量
		});
	}
	
})();