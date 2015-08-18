(function() {
	$.post(contextPath+"/stu/getRanks", {'num': $('#stu_num').val()}).done(function(datas){
		var html = '';
		for(var i = 0, len = datas.length; i < len; i++) {
			var s = datas[i];
			html += "<tr>"
				+ "<td>"+s.num+"</td>"
				+ "<td>"+s.year+"</td>"
				+ "<td>"+s.rankName+"</td>"
				+"</tr>";
		}
		
		$('#myranks').html(html);
		
	}).fail(function() {
		
	});
})();