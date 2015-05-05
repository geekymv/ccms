<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp"%>
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>活动列表</title>
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
	            <li>活动列表</li>
        	</ul>
        	<div class="maincontent">
        	<div class="maincontentinner">
            <div class="widget">
                <h4 class="widgettitle">活动列表</h4>
            	<table class="table table-bordered responsive">
           			<thead>
                       <tr>
                       	  <th class="centeralign"><input type="checkbox" class="checkall" /></th>	
                          <th>活动名称</th>
				          <th id="publish_college">发布单位</th>
				          <th>活动对象</th>
				          <th>发布时间</th>
				          <th>活动类型</th>
				          <th>活动时长</th>
				          <th>活动状态</th>
				          <th>活动详情</th>
				          <th>查看报名</th>
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
			
			var url = "";
			var user_authority = '${user.authority}'
			if(user_authority == 1) {	// 管理员
				url = '/admin/activities';
			}else if(user_authority == 0) {	// 用工单位
				url = '/college/activities';
				// 隐藏发布单位
				$('#publish_college').hide();
				
			}
			
			
			jQuery("#page").page({
				    remote: {
				        url: contextPath + url,
				        callback: function (result) {
				        	var datas = result.datas;
				        	var len = datas.length;
				        	if(len == 0) {
				        		
				        	}else {
				        		var html = "";
				        		for(var i = 0; i < len; i++) {
				        			var act = datas[i];
				        			var status = act.status;
				        			
				        			if(status == 0) {
				        				status = '待审核';
				        			}else if(status == 1) {
				        				status = '审核通过';
				        			}else if(status == -1) {
				        				status = '未通过';
				        			}
				        			
				        			var name = act.name;	// 活动名称
				        			
				        			if(name.length > 10) {
				        				name = name.substring(0, 11);
				        			}
				        			
				        			html += "<tr>"
				        					+ "<th class='centeralign'><input type='checkbox' class='checkall' /></th>"
				        					+ "<td><span title='"+act.name+"'>"+ name +"</span></td>";
					        			if(user_authority == 1){
					        				html += "<td>"+ act.college.name +"</td>";
					        			}		 
				        			html += "<td>"+ act.actObject +"</td>"
				        					+ "<td>"+ formatterDate(act.publishTime) +"</td>"
				        					+ "<td>"+ act.actType.name +"</td>"
				        					+ "<td>"+ act.duration +"</td>"
				        					+ "<td>"+ status +"</td>"
				        					+ "<td><span title='查看' style='cursor:pointer;' data-id='"+act.id+"' class='glyphicon glyphicon-eye-open' onclick='showDetail(this)'></span></td>"
				        					+ "<td><span title='查看' style='cursor:pointer;' data-id='"+act.id+"' class='glyphicon glyphicon-eye-open' onclick='showApply(this)'></span></td>"
				        					
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
		
		function showDetail(t) {
			var $this = jQuery(t);
			var id = $this.data('id');
			window.location.href = contextPath+"/admin/activity_detail/" + id;
		
		} 
		
		function showApply(t) {
			var $this = jQuery(t);
			var id = $this.data('id');
			window.location.href = contextPath + "/admin/activity_students/" + id;
		}
		
	</script>
</body>
</html>    

















