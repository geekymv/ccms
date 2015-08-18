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
	                    + 	'<a href="javascript:void(0);" onclick="editCategory(this)" class="edit" title="编辑" id="edit"><span class="icon-edit"></span></a>'
	                    + '</td>'
	                    + '</tr>';
				}
				
				$('tbody').html(html);
			});
		});
		
		// 编辑类别
		var editCategory = function(t) {
			var $this = $(t);
			var $tr = $this.parent().parent();
			var id = $tr.find('#categoryId').val();
			var name = $tr.find('#name').text();
			
			var d = dialog({
				title: '编辑活动分类',
				content: '<input class="form-control" name="cate" id="cate" value="'+name+'" autofocus />',
				ok: function() {
					var val = $('#cate').val().trim();
					if(val == '') {
						alert('不能为空！');
						return;
					}
					
					var datas = {
						'id': id,
						'name': val
					};
					$.post(contextPath+'/admin/setCategory', datas).done(function(res) {
						if('success' == res) {
							tip('更新成功！')
							$tr.find('#name').text(val);
							d.close();
							return false;
						}else if("fail" == res) {
							tip('更新失败！')
						}else if("exist" == res){
							tip('该类别已存在！')
							return;
						}
					}).fail(function() {
						alert('服务器端错误！');
					});
				},
				cancelValue: '取消',
				cancel: function() {
				}
			});
			
			d.show();
		};
	
		// 查看二级分类
		function secondLevels(t) {
			var $this = $(t);
			var $tr = $this.parent().parent();
			var categoryId = $tr.find('#categoryId').val();
			window.location.href = contextPath + "/admin/secondLevels/"+categoryId;
		}
		
		// 提示框
		var tip = function(tip) {
			var dc = dialog({
			    content: tip
			});
			dc.show();
			setTimeout(function () {
				dc.close().remove();
			}, 2000);
			
		}
	</script>

</body>
</html>    

















