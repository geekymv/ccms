<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp"%>
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>设置活动类别</title>
<%@ include file="/WEB-INF/jsp/inc/admin_style.jsp"%>

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
	            <li>系统设置 <span class="separator"></span></li>
	            <li>活动类别设置</li>
        	</ul>
        	<div class="maincontent">
        	<div class="maincontentinner">
            <div class="widget">
                <h4 class="widgettitle">活动类别设置</h4>
            	<table class="table table-bordered responsive">
            		<thead>
                        <tr>
                        	<th class="centeralign"><input type="checkbox" class="checkall" />选择所有</th>
                            <th>序号</th>
                            <th>名称</th>
                            <th>操作</th>
                        </tr>
	                </thead>
	                <tbody>
	                </tbody>	  
                </table>
                
                <!-- 
                <div style="width: 600px; height: 200px; border: 1px solid red;" id="div_div">
                </div>
                 -->
                
            </div>
            </div>
            </div>      
		</div>
	</div>
	
	<script type="text/javascript" src="${ctx }/resources/layer/layer.min.js"></script>
	<script type="text/javascript" src="${ctx }/resources/scripts/college.js"></script>
		
	<script type="text/javascript">
		$(function() {
			// 加载所有一级类别
			$.post(contextPath+"/admin/categories").done(function(data){
				var len = data.length;
				var html = '';
				for(var i = 0; i < len; i++) {
					var category = data[i];
					html += '<tr>'
						+ '<td class="centeralign"><input type="checkbox" /></td>'
	                    + '<td>'
	                    +	(i+1)
	                    + 	'<input type="hidden" id="categoryId" value="'+category.id+'"/>'
	                    + '</td>'
	                    + '<td id="name">'+category.name+'</td>'
	                    + '<td class="centeralign">'
	                    + 	'<a href="javascript:void(0);" onclick="secondLevels(this);" class="edit" title="查看"><span class="icon-eye-open"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
	                    + 	'<a href="javascript:void(0);" class="edit" title="编辑"><span class="icon-edit"></span></a>'
	                    + '</td>'
	                    + '</tr>';
				}
				
				$('tbody').html(html);
			});
			
			
		});
	
		function secondLevels(t) {
			var $this = $(t);
			var $tr = $this.parent().parent();
			var categoryId = $tr.find('#categoryId').val();
			
			window.location.href = contextPath + "/admin/secondLevels/"+categoryId;
		}
	
	</script>

</body>
</html>    

















