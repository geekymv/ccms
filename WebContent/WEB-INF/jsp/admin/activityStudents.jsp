<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp"%>
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>报名学生列表</title>
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
	            <li>活动管理 <span class="separator"></span></li>
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
				          <th>学院</th>
				          <th>专业</th>
				          <th>状态</th>
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
	
			var user_authority = '${user.authority}'
			
			$("#page").page({
				    remote: {
				        url: contextPath + "/admin/students",
				        params: {"actId": '${actId}'},
				        callback: function (result) {
				        	var datas = result.datas;
				        	var len = datas.length;
				        	if(len == 0) {
				        		
				        	}else {
				        		var html = "";
				        		for(var i = 0; i < len; i++) {
				        			var stu = datas[i];
				        			
				        			var status = stu.status;
				        			if(user_authority == 1 && status >= 1) {	// 管理员，用工单位审核通过
				        				if(status == 1) {	// 用工单位审核通过
				        					status = '等待审核';
				        				}else if(status == 2 ){
				        					status = '审核通过';
				        				}else if (status == 3) {
											status = '未通过';				        					
				        				}	        			
				        			
				        				html += "<tr>"
					        		   		+ "<th class='centeralign'><input type='checkbox' class='checkall' /></th>"
					        				+ "<td>"+(i+1)+"</td>"
					        				+ "<td>"+ stu.num +"</td>"
					        				+ "<td>"+ stu.name +"</td>"
					        				+ "<td>"+ stu.gender +"</td>"
					        				+ "<td>"+ stu.phone +"</td>"
					        				+ "<td>"+ stu.collegeName +"</td>"
					        				+ "<td>"+ stu.specialtyName +"</td>"
					        				+ "<td>"+ status +"</td>"
					        				+ "<td>通过&nbsp;&nbsp;不通过</td>"
					        			"</tr>"
				        			
				        			}else if(user_authority == 0) { // 用工单位
				        				if(status == 0) {
					        				status = '待审核';
					        			}else if(status == 1) {
					        				status = '审核通过';
					        			}else if(status == -1) {
					        				status = '未通过';
					        			}
				        			
				        				html += "<tr>"
					        		   		+ "<th class='centeralign'><input type='checkbox' class='checkall' /></th>"
					        				+ "<td>"+(i+1)+"<input type='hidden' id='itemId' value='"+stu.itemId+"'/></td>"
					        				+ "<td>"+ stu.num +"</td>"
					        				+ "<td>"+ stu.name +"</td>"
					        				+ "<td>"+ stu.gender +"</td>"
					        				+ "<td>"+ stu.phone +"</td>"
					        				+ "<td>"+ stu.collegeName +"</td>"
					        				+ "<td>"+ stu.specialtyName +"</td>"
					        				+ "<td>"+ status +"</td>"
					        				+ "<td><span style='cursor:pointer;' onclick='audit(1, this)'>通过</span>"
					        					+"&nbsp;&nbsp;<span style='cursor:pointer;' onclick='audit(-1, this)'>不通过</span>"
					        				+"</td>"
					        			"</tr>"
				        			}
				        			
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
		
		function audit(status, t) {
			var $this = jQuery(t);
			var itemId = $this.parent().parent().find('#itemId').val();
			
			jQuery.post(contextPath+'/admin/auditActivityItem', {'itemId': itemId, 'status': status}).done(function(msg) {
				alert(msg);			
				window.location.reload();
			}).fail(function() {
				alert('服务器端错误！');				
			});
		}
		
		
	</script>
</body>
</html>    

















