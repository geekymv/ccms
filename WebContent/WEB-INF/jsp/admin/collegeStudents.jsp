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
	
			$("#page").page({
				    remote: {
				        url: contextPath + "/admin/students",
				        callback: function (result) {
				        	var datas = result.datas;
				        	var len = datas.length;
				        	if(len == 0) {
				        		
				        	}else {
				        		var html = "";
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
				        		$('#t_body').html(html);
				        	}
				        }
				    },
					pageIndexName: 'pageIndex',     //请求参数，当前页数，索引从0开始
					pageSizeName: 'pageSize',       //请求参数，每页数量
					totalName: 'totalRecord'       //指定返回数据的总数据量
				});
		})
		
		function edit(t) {
			var $this = $(t);
			window.location.href = contextPath + "/admin/student/" + $this.data('num');
		} 
		
	</script>
</body>
</html>    

















