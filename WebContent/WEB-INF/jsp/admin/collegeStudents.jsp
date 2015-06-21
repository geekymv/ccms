<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp"%>
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>学生列表</title>
<%@ include file="/WEB-INF/jsp/inc/admin_style.jsp"%>

<link href="<c:url value='/resources/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet"/>

<style type="text/css">
/*分页样式*/
.pagination a {
	cursor: pointer;
	-moz-user-select: none;
	-webkit-user-select: none;
	-ms-user-select: none;
	-khtml-user-select: none;
	user-select: none;
}

</style>

</head>
<body>
	<div class="mainwrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="leftpanel">
			<jsp:include page="leftmenu.jsp"></jsp:include>
		</div>
		
		<div class="rightpanel">
			<ul class="breadcrumbs">
	            <li><a href="${pageContext.request.contextPath }/admin"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
	            <li>学生管理 <span class="separator"></span></li>
	            <li>学生列表</li>
        	</ul>
        	<div class="maincontent">
        	<div class="maincontentinner">
            <div class="widget">
                <h4 class="widgettitle">学生列表</h4>
                
                <div class="controls" style="text-align: center;">
                	<span>学年</span>
                	<select id="year" style="width: 120px; margin-bottom: 10px;">
                	</select>&nbsp;&nbsp;
                	<input type="text" id="query_num" style="width: 180px; height: 30px;" placeholder="学号"/>&nbsp;&nbsp;
                	<input type="text" id="query_name" style="width: 180px; height: 30px;" placeholder="姓名"/>&nbsp;&nbsp;
                	<select id="specialty" style="margin-bottom: 10px;">
                		<option value="-1">专业</option>
                	</select>&nbsp;&nbsp;
		        	<input type="button" class="btn btn-default" id="query" style="margin-bottom: 10px;" value="查询"/>
		        	<input type="button" class="btn btn-default" id="downloadStudent" style="margin-bottom: 10px;" value="下载"/>
                </div>
                
            	<table class="table table-bordered responsive">
           			<thead>
                       <tr>
                       	  <th class="centeralign"><input type="checkbox" class="checkall" /></th>	
                          <th>序号</th>
				          <th>学号</th>
				          <th>姓名</th>
				          <th>性别</th>
				          <th>联系方式</th>
				          <th>专业</th>
				          <th>等级</th>
				          <th>操作</th>
                       </tr>
                    </thead>
                    <tbody id='t_body'>
                    </tbody>
                </table>
                
                <div class="panel-footer">
					<nav style="text-align: center;">
					    <ul id="page" class="pagination" data-first-btn-text="首页" data-last-btn-text="尾页"></ul>
					</nav>
	            </div>
			
			
            </div><!--widget-->
            </div>
            </div>      
        	
		</div>
	</div>
	<script type="text/javascript">
		jQuery(function(){
			var $ = jQuery;
			
			// 加载学年
			$.ajax({
				url: contextPath+"/recent5Years",
				type: 'POST',
				async: false,
				dataType: 'json',
				success: function(data){
					var html = '';
					for(var i = data.length-1; i >= 0; i--) {
						var y = data[i];
						html += '<option value="'+y+'">'+y+'</option>';					
					}
					$('#year').html(html);
				}
			});
			
			// 加载专业
			$.post(contextPath+"/getAllSpecialty", {'collegeId': '${user.id}'}).done(function(data) {
				var len = data.length;
				if(len > 0) {
					var html = '';
					for(var i = 0; i < len; i++) {
						var spec = data[i];
						html += '<option value="'+spec.id+'">'+spec.name+'</option>'
					}	
					
					$('#specialty').append(html);
				}
			});
	
			// 分页显示学生列表
			pager();
		
			// 查询
			$('#query').click(function() {
				$('#page').page('destroy')
				pager();
			});
			
			$('#downloadStudent').click(function() {
				alert('aa');				
			});
			
		})
		
		
		// 编辑
		function edit(t) {
			var $this = $(t);
			window.location.href = contextPath + "/admin/student/" + $this.data('num');
		} 
		
		function pager() {
			$("#page").page({
			    remote: {
			        url: contextPath + "/college/students",
			        params: {'year': $('#year').val(), "num": $('#query_num').val(), 'name': $('#query_name').val(), 'specId': $('#specialty').val()},
			        callback: function (result) {
			        	var datas = result.datas;
			        	var len = datas.length;
			        	var html = "";
			        	if(len == 0) {
			        		$('thead').hide();
							html = '<div style="text-align: center; color: blue;">暂无数据</div>';			        		
			        	}else {
			        		$('thead').show();
			        		for(var i = 0; i < len; i++) {
			        			var stu = datas[i];
					        	var phone = stu.phone;
					        	if(phone == null || phone == '') {
					        		phone = '暂无';
					        	}

					        	html += "<tr>"
			        		   		+ "<th class='centeralign'><input type='checkbox' class='checkall' /></th>"
			        				+ "<td>"+(i+1)+"</td>"
			        				+ "<td>"+ stu.num +"</td>"
			        				+ "<td>"+ stu.name +"</td>"
			        				+ "<td>"+ stu.gender +"</td>"
			        				+ "<td>"+ phone +"</td>"
			        				+ "<td>"+ stu.specialty.name +"</td>"
			        				+ "<td>"+ stu.rank.name +"</td>"
			        				+ "<td><span onclick='edit(this)'data-num='"+stu.num+"' style='cursor: pointer;'>编辑</span></td>"
			        			+"</tr>";
			        		}
			        	}
			        	$('#t_body').html(html);
			        }
			    },
				pageIndexName: 'pageIndex',     //请求参数，当前页数，索引从0开始
				pageSizeName: 'pageSize',       //请求参数，每页数量
				totalName: 'totalRecord'       //指定返回数据的总数据量
			});
		}
		
	</script>
</body>
</html>    

















