<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp"%>
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>单位管理</title>
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
	            <li>单位管理 <span class="separator"></span></li>
	            <li>单位列表</li>
        	</ul>
        	<div class="maincontent">
        	<div class="maincontentinner" style="margin-top: 0px;">
            <div class="widget">
                <h4 class="widgettitle">单位列表</h4>
            	<table class="table table-bordered responsive">
           			<thead>
                       <tr>
                       	  <th class="centeralign"><input type="checkbox" class="checkall" /></th>	
                           <th>序号</th>
                           <th>账号</th>
                           <th>名称</th>
                           <th>电话号码</th>
                           <th>联系人</th>
                           <th>地址</th>
                           <th>类型</th>
                           <th>操作</th>
                       </tr>
                    </thead>
                    <tbody>
                    	
                    </tbody>
                </table>
            </div><!--widget-->
            </div>
            </div>      
        	
		</div>
	</div>
	<script type="text/javascript">
		jQuery(function(){
			var $ = jQuery;
			$.post(contextPath+"/admin/employers").done(function(result){
				var datas = result.datas;
				var len = datas.length;

				var html = "";
				for(var i = 0; i < len; i++) {
					var col = datas[i];
					var colType = col.colType;
					if(colType == 1) {
						colType = '管理员';
					}else if (colType == 2) {
						colType = '学院';
					}else if (colType == 3) {
						colType = '用工单位';
					} 
					
					html+="<tr>"
		            		+ "<th class='centeralign'><input type='checkbox' class='checkall' /></th>"
		            		+ "<td><input type='hidden' id='id' value='"+col.id+"'/>"+ (i+1) +"</td>"
		            		+ "<td>"+ col.account +"</td>"
		            		+ "<td>"+ col.name +"</td>"
		            		+ "<td>"+ col.phone +"</td>"
		            		+ "<td>"+ col.contact +"</td>"
		            		+ "<td>"+ col.address +"</td>"
		            		+ "<td>"+ colType +"</td>"
		            		+ "<td>编辑</td>"
		            	"</tr>";
				}
				
				$('tbody').html(html);
				
			}).fail(function(msg){
				alert('服务器端出错！');
			});
			
		});		
	</script>
	
	

</body>
</html>    

















