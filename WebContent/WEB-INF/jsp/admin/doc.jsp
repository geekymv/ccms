<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>文档管理</title>
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
	            <li>勤管管理 <span class="separator"></span></li>
	            <li>文档管理</li>
        	</ul>
        	<div class="maincontent">
        	<div class="maincontentinner">
            <div class="widget">
                <h4 class="widgettitle">文档管理</h4>
                <div class="widgetcontent">
                  <div class="par">
					<table style="width: 800px;">
						<tr>
							<td>
							    <label>选择文件</label>
							</td>
							<td>   
							    <input type="text" id="show" disabled="disabled" />
							    <input type="button" id="select" value="选择上传的文件"/>
						    </td>
						    <td>
						   		<label>选择权限</label>
						    </td>
						    <td>
							    <input type="radio" name="authority" value="1" />公有
							    <input type="radio" name="authority" value="0" checked="checked" />默认
							    <input type="radio" name="authority" value="-1" />私有
							</td>
							<td>
								<input type="button" id="submit" value="提交" />
							</td>
						</tr>
					</table>	
				 </div>
                </div><!--widgetcontent-->
            </div><!--widget-->
            </div>
            </div>      
		</div>
	</div><!--end of mainwrapper-->
	
	<script src="<c:url value='/resources/scripts/jquery.ajaxupload.js'/>"></script>
	<!-- 
	参考博客：
		http://www.ixueyun.com/community/home.php?mod=space&uid=442&do=blog&id=540
		http://blog.sina.com.cn/s/blog_9ed9ac7d01019eqe.html	
	 -->
	<script type="text/javascript">
		jQuery(function () {
		    var button = jQuery('#select'), interval;//绑定事件
		    var load = new AjaxUpload(button, {//绑定AjaxUpload
		        action: "${pageContext.request.contextPath }/fileUpload",
		        type:"POST",//提交方式
		        data:{//还可以提交的值
		        },
		        autoSubmit:false,//选择文件后,是否自动提交.这里可以变成true,自己去看看效果吧.
		        name:'myFiles',//提交的名字
		        onChange:function(file,ext){//当选择文件后执行的方法,ext存在文件后续,可以在这里判断文件格式
					jQuery("#show").attr("value",file);
		        },
		        onSubmit: function (file, ext) {//提交文件时执行的方法
		        	 button.text('文件上传中！！！');
	               	 interval = window.setInterval(function(){
	                   var text = button.text();
	                   if (text.length < 14){
	                       button.text(text + '.');                   
	                   } else {
	                       button.text('文件上传中....');            
	                   }
	               	}, 200);
		        },
		        // 文件提交完成后可执行的方法
		        onComplete: function (file, response) {
		        	if(response == "success") {
		        		alert("上传成功！");
		        	}else {
		        		alert("上传失败！");
		        	}
	                button.text('文件上传');
	                window.clearInterval(interval);
	                this.enable();
		        }
		    }); // end of AjaxUpload
		    
		    
			var submit=jQuery('#submit').click(function(){//触发提交的事件.与autoSubmit的设置有关,是否采用
				load.setData({'authority': jQuery('input[name="authority"]:checked').val()});
				load.submit();
			});
		});
	</script>
</body>
</html>    




