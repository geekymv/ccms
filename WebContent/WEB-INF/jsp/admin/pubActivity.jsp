<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>申请活动</title>
<%@ include file="/WEB-INF/jsp/inc/admin_style.jsp"%>

<script src="${ctx}/resources/kindeditor/kindeditor-all-min.js"></script>
<script src="${ctx}/resources/kindeditor/lang/zh-CN.js"></script>
	

<style type="text/css">
	.my-par {
		height: 32px;
	}
	.tips {
   		color: red;
   		padding-left: 10px;
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
	            <li>申请活动</li>
        	</ul>
        	<div class="maincontent">
        	<div class="maincontentinner">
            <div class="widget">
                <h4 class="widgettitle">申请活动</h4>
                <div class="widgetcontent">
                    <form id="pub_form" class="stdform">
                    <table style="width: 850px;">
                    	<tr>
                    		<td colspan="2">
	                    		<div class="par control-group my-par">
	                                <label class="control-label" for="name">
	                                	活动名称<span class="tips">*</span>
	                                </label>
	                                <div class="controls">
	                                	<input type="text" name="name" id="name" class="input-xxlarge" style="width: 575px;" maxlength="120" autofocus="autofocus"/>
	                                </div>
	                            </div>
                    		</td>
                    		
                    	</tr>
                    	<tr>
                    		<td>
	                    		<div class="par control-group my-par">
	                                <label class="control-label" for="dateTime">
	                                	活动时间<span class="tips">*</span>
	                                </label>
	                                <div class="controls">
	                                	<input type="text" name="dateTime" id="dateTime" class="input-medium" />
	                                </div>
	                            </div>
                    		</td>
                    		<td>
	                    		<div class="par control-group my-par">
	                                <label class="control-label" for="endDate">
	                                	报名截止日期<span class="tips">*</span>
	                                </label>
	                                <div class="controls">
	                                	<input type="text" name="endDate" id="endDate" class="input-medium" 
	                                	onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm', minDate:'%y-%M-%d', isShowClear:false})"/>
	                                </div>
	                            </div>
                    		</td>
                    		
                    	</tr>
                    	<tr>
                    		<td colspan="2">
	                    		<div class="par control-group my-par">
	                                <label class="control-label" for="location">
	                                	活动地点<span class="tips">*</span>
	                                </label>
	                                <div class="controls">
	                                	<input type="text" name="location" id="location" style="width: 575px;" class="input-medium" />
	                                </div>
	                            </div>
                    		</td>
                    	</tr>
						<tr>
                    		<td>
	                    		<div class="par control-group my-par">
	                                <label class="control-label" for="actType">
	                                	加分类型<span class="tips">*</span>
	                                </label>
	                                <div class="controls">
	                                	 <select name="actType.id" id="actType" class="uniformselect" style="width: 160px;">
			                            </select>
	                                </div>
	                            </div>
                    		</td>
                    		<td id="second_level">
	                    		<div class="par control-group my-par">
	                                <div class="controls">
	                                	 <select name="secondLevel.id" id="secondLevel" class="uniformselect" style="width: 160px;">
			                            </select>
	                                </div>
	                            </div>
                    		</td>
						</tr>

                    	<tr>
                    		<td colspan="2">
                    			<div class="par control-group my-par">
	                               	<label class="control-label" for="aim">
	                                	活动目的<span class="tips">*</span>
	                                </label>
	                                 <div class="controls">
    	                            	<textarea cols="30" rows="3" name="aim" id="aim" class="span6" style="width: 400px;"></textarea>
                            		</div>
                            	</div>
                            	
                            </td>
                    	</tr>
                    	<tr>
                    		<td colspan="2">&nbsp;</td>
                    	</tr>
                    	 <tr>
                    		<td colspan="2">
                    			<div class="par control-group my-par">
	                               	<label class="control-label" for="aim">
	                                	活动内容<span class="tips">*</span>
	                                </label>
	                                 <div class="controls">
    	                            	<textarea cols="30" rows="3" name="content" id="content" class="span6" style="width: 400px;"></textarea>
                            		</div>
                            	</div>
                            </td>
                    	</tr>
                    	<tr>
                    		<td colspan="2">&nbsp;</td>
                    	</tr>
                    	
                    	<tr>
                    		<td>
	                    		<div class="par control-group my-par">
	                                <label class="control-label" for="duration">
	                                	申请认证时长（小时）<span class="tips">*</span>
	                                </label>
	                                <div class="controls">
	                                	<input type="text" name="duration" id="duration" class="input-small" />
	                                </div>
	                            </div>
                    		</td>
                    		
                    		<td>
	                    		<div class="par control-group my-par">
	                                <label class="control-label" for="actObject">
	                                	参与对象<span class="tips">*</span>
	                                </label>
	                                <div class="controls">
	                                	 <select name="actObject" id="actObject" style="width: 160px;">
	                                	 	<option value="-1">全校学生</option>
	                                	 	<option value="${user.id }">${user.name }学生</option>
	                                	 </select>
	                                </div>
	                            </div>
                    		</td>
                    		
                    	</tr>
                    	<tr>
                    		<td>
	                    		<div class="par control-group my-par">
	                                <label class="control-label" for="number">
	                                	参与人数<span class="tips">*</span>
	                                </label>
	                                <div class="controls">
	                                	<input type="text" name="number" id="number" class="input-small" />
	                                </div>
	                            </div>
                    		</td>
                    		<td>
	                    		<div class="par control-group my-par">
	                                <label class="control-label" for="contact">
	                                	联系人<span class="tips">*</span>
	                                </label>
	                                <div class="controls">
	                                	<input type="text" name="contact" id="contact" class="input-medium" />
	                                </div>
	                            </div>
                    		</td>
                    		
                    	</tr>
                    	<tr>
                    		<td>
	                    		<div class="par control-group my-par">
	                                <label class="control-label" for="phone">
	                                	联系方式<span class="tips">*</span>
	                                </label>
	                                <div class="controls">
	                                	<input type="text" name="phone" id="phone" class="input-medium" />
	                                </div>
	                            </div>
                    		</td>
                    		<td>
	                    		<div class="par control-group my-par">
	                                <label class="control-label" for="assist">
	                                	协助人员
	                                </label>
	                                <div class="controls">
	                                	<input type="text" name="assist" id="assist" class="input-medium" />
	                                </div>
	                            </div>
                    		</td>
                    		
                    	</tr>
                    	
                    	<tr id="file_list">
							<td>
	                    		<div class="par control-group my-par">
	                                <label class="control-label" for="phone">
	                                	附件列表
	                                </label>
	                                <div class="controls">
										<div id="attach_list" style="margin-left: 220px;">
										</div>
	                                </div>
	                            </div>
                    		</td>                    	
                    	</tr>
                    
                    </table>
                    
                      <p class="stdformbutton" style="margin-left: 400px;">
                      	<button type="button" class="btn btn-primary" id="select">添加附件</button>&nbsp;&nbsp;
                      	<button type="button" class="btn btn-primary" onclick="pubActivity();">申请活动</button>
                      </p>
                    </form>
                </div><!--widgetcontent-->
            </div><!--widget-->
            </div>
            </div>      
		</div>
	</div><!--end of mainwrapper-->

	<script src="<c:url value='/resources/scripts/college.js'/>"></script>
	<script src="<c:url value='/resources/scripts/common.js' />"></script>
	<script src="<c:url value='/resources/scripts/jquery.ajaxupload.js'/>"></script>
	<script type="text/javascript">
		$(function() {
			$('#file_list').hide();
			
			// 上传附件
			 var button = jQuery('#select'), interval;//绑定事件
			    var load = new AjaxUpload(button, {//绑定AjaxUpload
			        action: contextPath+"/addAttach",
			        type:"POST",//提交方式
			        autoSubmit: true,//选择文件后,是否自动提交.这里可以变成true,自己去看看效果吧.
			        name:'myFiles',//提交的名字
			        onChange:function(file,ext){//当选择文件后执行的方法,ext存在文件后续,可以在这里判断文件格式
					//	jQuery("#show").attr("value",file);
			        },
			        onSubmit: function (file, ext) {//提交文件时执行的方法
			        	/*  button.text('文件上传中！！！');
		               	 interval = window.setInterval(function(){
		                   var text = button.text();
		                   if (text.length < 14){
		                       button.text(text + '.');                   
		                   } else {
		                       button.text('文件上传中....');            
		                   }
		               	}, 200); */
			        },
			        // 文件提交完成后可执行的方法
			        onComplete: function (fileName, response) {
			        	debugger
			        	if(response != null) {
			        		var reg = /<pre.+?>(.+)<\/pre>/g;  
			        		var result = response.match(reg);  
			        		response = RegExp.$1;
			        		response = $.parseJSON(response);
			        		
							// 显示附件信息
			        		$('#file_list').show();
							var fileId = response.id;
							var fileName = response.originalFilename;
							var newFileName = response.newFileName;
							var size = response.fileSize;
							
						//	var content = '<div>文件名称：<a href="${ctx}/upload/'+newFileName+'">'+fileName+'</a>&nbsp;&nbsp;文件大小：'+size+'<div>';
							var content = '<div>文件名称 '+fileName+'&nbsp;&nbsp;，文件大小 '+size+'<a data-id="'+fileId+'" onclick="deleteFile(this)">&nbsp;&nbsp;删除</a><div>';
							$('#attach_list').append(content);
			        	}
			        	
			        /* 	if(response == "success") {
			        		alert("上传成功！");
			        	}else {
			        		alert("上传失败！");
			        	}
		                button.text('文件上传');
		                window.clearInterval(interval);
		                this.enable(); */
			        }
			    }); // end of AjaxUpload
			    
			    
				/* var submit=jQuery('#submit').click(function(){//触发提交的事件.与autoSubmit的设置有关,是否采用
					load.submit();
				}); */
				
				// 删除附件
				function deleteFile(t) {
					var $this = $(t);
					
					
				}
		});
	
	</script>
	
	<script>
	 	KindEditor.ready(function(K) {
	 		var control = {
	           	 	width : "69%", //编辑器的宽度为70%
	           	 	height: "150px",
	       			items:['source', '|', 'undo', 'redo', '|', 'preview', 'cut', 'copy', 'paste',
	      			        'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
	      			        'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
	      			        'superscript', 'clearhtml', '/', 'quickformat', 'selectall', '|', 
	      			        'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
	      			        'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 
	      			        'table', 'hr', 'fullscreen'],
	      				resizeType : '1'
	      			};
	 	
           	window.content_editor = K.create('#content',control);
        	window.aim_editor = K.create('#aim', control);
    	});
	 	
   </script>
	
</body>
</html>    




