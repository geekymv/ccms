(function() {
	var params = {};

	$(function(){
		// 获得最近5个学年
		getRecent5Years();
		
		timeCounter();
		
		// 时间统计查询
		$("#query").click(function(){
			var val = $("#select").val();
			val = val.split("-");
			params.startDate = val[0] + "0901000000";
			params.endDate = val[1] + "0701000000";
			
			timeCounter();
		});
	});
	
	function getRecent5Years() {
		$.ajax({
			url: contextPath + "/recent5Years",
			dataType: "json",
			success: function(data) {
				var sel = $("#select");
				var html = "";
				for(var i = data.length -1; i >= 0 ; i--) {
					html += "<option>" + data[i] + "</option>";
				}
				sel.html(html);
			}
		});
		
	}
	
	function timeCounter() {
		$.ajax({
			url: contextPath + "/stu/timeCounter",
			type: "POST",
			data: params,
			dataType: "json",
			success: function(data) {
				var sel = $("tbody");
				var html = "";
				for(var i = 0; i < data.length; i++) {
					var item = data[i];
					var name = item.activityType.name;
					var finishedDuration = item.finishedDuration;
					var duration = item.beginDuration + '-' + item.endDuration + "小时";
					html += "<tr>"
			         +"<td>" + name + "</td>"
			         +"<td>" + finishedDuration + "小时</td>"
			         +"<td>" + duration + "</td>";
					
			         if(i == 0){
				        html +=	 '<td rowspan="3" style="vertical-align: middle;color: blue; font-size: 16px;">'
					         +	'等待审核'
					         +'</td>';
			         }
			       
			      html += "</tr>";
				}
				sel.html(html);
			}
		});
	}

})();








