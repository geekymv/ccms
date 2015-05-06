<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp"%>
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>专业设置</title>
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
	            <li>基本管理 <span class="separator"></span></li>
	            <li>专业设置</li>
        	</ul>
        	<div class="maincontent">
        	<div class="maincontentinner">
            <div class="widget">
            	<button id="add" class="btn btn-primary">添加专业</button>
                <h4 class="widgettitle">专业设置</h4>
            	<table class="table table-bordered responsive">
            		<c:choose>
            			<c:when test="${empty specialties }">
            			<tr>
            				<td colspan="4">暂时还没设置专业！点击上方按钮设置专业吧...</td>
            			</tr>	
            			</c:when>
            			
            			<c:otherwise>
            			<thead>
                        <tr>
                        	<th class="centeralign"><input type="checkbox" class="checkall" />选择所有</th>
                            <th>序号</th>
                            <th>专业名称</th>
                            <th>操作</th>
                        </tr>
	                    </thead>
	                    <tbody>
	                    	<c:forEach items="${specialties }" var="specialty" varStatus="status">
            				<tr>
	                        	<td class="centeralign"><input type="checkbox" /></td>
	                            <td>${status.count }
	                            	<input type='hidden' id='specId' value='${specialty.id }'/>
	                            </td>
	                            <td id='specName'>${specialty.name }</td>
	                            <td class="centeralign">
 	                            	<a href="javascript:void(0);" class="edit" title="编辑"><span class="icon-edit"></span></a>
	                            </td>
	                        </tr>
            				</c:forEach>
	                    </tbody>
            			</c:otherwise>
            		</c:choose>
                </table>
            </div><!--widget-->
            </div>
            </div>      
        	
		</div>
		
		<div style="display: none; margin-top: 10px;text-align: center;" id="addSpecialty">
			<table style="margin: 70px;">
				<tr>
					<td>名称：</td>
					<td>
						<input type="text" name="name" id="name" />
						<input type='hidden' id='spec_id' />
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
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/layer/layer.min.js"></script>
	<script type="text/javascript" src="${ctx }/resources/scripts/college.js"></script>
	
	<script type="text/javascript">
		$(function() {
			var pageii = null;
			// 添加专业
			jQuery("#add").on('click', function() {
				$('#name').val('');	// 输入框清空
				$('#add_spec').html('添加专业');
				
				pageii = jQuery.layer({
				    type : 1,
				    title : ['添加专业',
				             'border:none; background:#0866c6; color:#fff;' 
				             ],
				    /*
					border的值分别为：[边框大小, 透明度, 颜色, layer1.8之前需在此处加true]
					不想显示border，设置 border: [0] 即可
				    */         
				    border: [1, 1, '#0866c6'],
				 	/*
				 	shade:
				 	值分别是：[遮罩透明度, 遮罩颜色, layer1.8之前需在此处加true]
				 	不想显示遮罩，配置shade: [0]即可
				 	*/
				 	shade: [0],
				    fix : true, // fix:用于设定层是否不随滚动条而滚动，固定在可视区域。
				    moveOut: false,	// 用于控制层是否允许被拖出可视窗口外 
				    shift: 'left', //从左动画弹出
				    /*
					控制层坐标。
					offset的值分别是： [纵坐标, 横坐标]，默认为垂直水平居中
					如果您要设定纵坐标，可以：offset:['200px', '']/td> 
				     */
				    offset: [(jQuery(window).height() - 490)/2+'px', ''],
				    area : ['400px','300px'],
				    bgcolor: '#eee', //设置层背景色
				    page : {dom : '#addSpecialty'}
					});
			});
			
			
			$('.edit').click(function(){
				var $tr = $(this).parent().parent();
				var specName = $tr.find('#specName').html();
				var specId = $tr.find('#specId').val();
				
				$('#name').val(specName);	
				$('#add_spec').html('修改专业');
				$('#spec_id').val(specId)
				
				pageii = jQuery.layer({
				    type : 1,
				    title : ['修改专业',
				             'border:none; background:#0866c6; color:#fff;' 
				             ],
				    border: [1, 1, '#0866c6'],
				 	shade: [0],
				    fix : true, // fix:用于设定层是否不随滚动条而滚动，固定在可视区域。
				    moveOut: false,	// 用于控制层是否允许被拖出可视窗口外 
				    shift: 'left', //从左动画弹出
				    offset: [(jQuery(window).height() - 490)/2+'px', ''],
				    area : ['400px','300px'],
				    bgcolor: '#eee', //设置层背景色
				    page : {dom : '#addSpecialty'}
					});
			});
		});
	
	</script>

</body>
</html>    

















