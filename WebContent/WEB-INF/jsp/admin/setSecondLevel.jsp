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
	</div>
	
	<script type="text/javascript" src="${ctx }/resources/layer/layer.min.js"></script>
	<script type="text/javascript" src="${ctx }/resources/scripts/college.js"></script>
		
	<script type="text/javascript">
		$(function() {
			
		});
	
	
	</script>

</body>
</html>    

















