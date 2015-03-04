<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/jsp/inc/style.jsp"%>

</head>
<body>
	
	<input type="file" name="myFiles" id="myImage" />
	<button id="upload">上传</button>
	
	<script type="text/javascript">
		
		$(function() {
			$("#upload").click(function() {
				
				$.ajaxFileUpload({
					url:'${pageContext.request.contextPath}/fileUpload',
				    data: {"authority": '1'}, // 参数
			        secureuri:false,                       //是否启用安全提交,默认为false
			        fileElementId:'myImage',           //文件选择框的id属性
			        dataType:'text',                       //服务器返回的格式,可以是json或xml等
			        success:function(data, status){        //服务器响应成功时的处理函数
						alert(data);
			        }
				});
				
			});			
		});
	
	
	</script>
</body>
</html>