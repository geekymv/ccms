<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp"%>
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>设置添加学生时间</title>
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
	            <li>设置添加学生时间</li>
        	</ul>
        	<div class="maincontent">
        	<div class="maincontentinner">
            <div class="widget">
                <h4 class="widgettitle">设置添加学生时间</h4>
            	<table class="table table-bordered responsive">
            		<thead>
                        <tr>
                        	<th class="centeralign"><input type="checkbox" class="checkall" />选择所有</th>
                            <th class="centeralign">名称</th>
                            <th class="centeralign">时间</th>
                            <th class="centeralign">操作</th>
                        </tr>
	                </thead>
	                <tbody>
	                </tbody>	  
                </table>
            </div>
            </div>
            </div>      
		</div>
		
		<div style="display: none; margin-top: 10px;text-align: center;" id="addSpecialty">
			<table style="margin: 70px;">
				<tr>
					<td>名称：</td>
					<td>
						<input type="text" name="endDate" id="endDate" class="input-medium" 
	                    	onFocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate:'%y-%M-%d', isShowClear:false})"/>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<button class="btn btn-primary" id='add_spec' onclick="addSpec();">添加专业</button>		
					</td>
				</tr>
			</table>
		</div>
		
	</div>
	
	<script type="text/javascript" src="${ctx }/resources/layer/layer.min.js"></script>
	<script type="text/javascript">
		$(function() {
			// 加载所有一级类别
			$.post(contextPath+"/admin/getAddStudentTime").done(function(data){
				var html = '';
				for(var i = 0, len = data.length; i < len; i++) {
					var d = data[i];
				html += '<tr>'
	            		+ '<th class="centeralign"><input type="checkbox" class="checkall" />选择所有</th>'
	                    + '<td class="centeralign">'+d.name+'</td>'
	                    + '<td class="centeralign">'+d.val+'</td>'
	                    + '<td class="centeralign" data-id="'+d.id+'" onclick="updateTime(this)">修改</td>'
            		+'</tr>';
				}
				
				$('tbody').html(html);
			}).fail(function(res) {
			});
		});
		
		function updateTime(t) {
			var $this = $(t);
			var id = $this.data('id');
			
			alert(id);
		}
		
	</script>
</body>
</html>    

















