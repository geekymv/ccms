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
	            <li>活动二级类别设置</li>
        	</ul>
        	<div class="maincontent">
        	<div class="maincontentinner">
            <div class="widget">
                <h4 class="widgettitle">活动二级类别设置</h4>
                <input type="hidden" id="superiorId" value="${superiorId }"/>
                
            	<table class="table table-bordered responsive">
            		<thead>
                        <tr>
                        	<th class="centeralign"><input type="checkbox" class="checkall" />选择所有</th>
                            <th>序号</th>
                            <th>上级名称</th>
                            <th>名称</th>
                        </tr>
	                </thead>
	                <tbody>
	                </tbody>	  
                </table>
            </div>
            </div>
            </div>      
		</div>
	</div>
	
	<script type="text/javascript" src="${ctx }/resources/layer/layer.min.js"></script>
	<script type="text/javascript" src="${ctx }/resources/scripts/college.js"></script>
		
	<script type="text/javascript">
		$(function() {
			var name = '';	
			$.ajax({
				url: contextPath+"/getActivityTypeById",
				data: {'activityTypeId': $('#superiorId').val()},
				asysc: false,
				success: function(d) {
					name = d.name;
				}
			});
			
			// 根据一级类别id显示所有二级类别
			$.post(contextPath+"/admin/secondLevels", {'superiorId': $('#superiorId').val()}).done(function(data) {
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
	                    + '<td id="super_name">'+name+'</td>'
	                    + '<td id="name" onclick="editLevel(this);">'+category.name+'</td>'
	                    + '</tr>';
				}
				
				$('tbody').html(html);
			});
		});
		
		
		function editLevel(t) {
			var $this = $(t);
			var $tr = $this.parent();
			var td_name = $tr.find('#name');
			var td_name_val = td_name.html();
			if(td_name_val.indexOf('input') == -1) {
				td_name.html('<input type="text" id="level_val" value="'+td_name_val+'"/>&nbsp;&nbsp;<span id="save" style="cursor: pointer;" onclick="save(this)">保存</span>&nbsp;&nbsp;<span id="save" style="cursor: pointer;" onclick="cancel(this)">取消</span>');
			}
		}
		
		// 保存
		function save(t) {
			var $this = $(t);
			var $tr = $this.parent().parent();
			var categoryId = $tr.find('#categoryId').val();
			var val = $tr.find('#level_val').val();

			$.post(contextPath+"/admin/editLevel", {'id': categoryId, 'name': val}).done(function(msg) {
				if(msg == 'isexist') {
					alert('名称已存在！');
					$tr.find('#name').select();
				}
				if(msg == 'success') {
					alert('更新成功！');
					$tr.find('#name').html(val);
				}else if(msg == 'fail'){
					alert('更新失败！');
				}
			});
		}
		
		// 取消
		function cancel(t) {
			window.location.reload();
		}
		
	</script>

</body>
</html>    

















