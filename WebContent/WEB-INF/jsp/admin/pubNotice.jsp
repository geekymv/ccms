<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>发布通知</title>
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
	            <li>资讯管理<span class="separator"></span></li>
	            <li id="li_title">发布资讯</li>
        	</ul>
        	<div class="maincontent">
        	<div class="maincontentinner">
            <div class="widget">
                <h4 class="widgettitle" id="widgettitle">发布资讯</h4>
                <div class="widgetcontent">
                	<input type="hidden" name="noticeId" id="noticeId"/>
                    <form id="pub_form" class="stdform">
                    <table style="width: 850px;">
                    	<tr>
                    		<td colspan="2">
	                    		<div class="par control-group my-par">
	                                <label class="control-label" for="name">
	                                	资讯标题<span class="tips">*</span>
	                                </label>
	                                <div class="controls">
	                                	<input type="text" name="title" id="title" class="input-xxlarge" style="width: 575px;" maxlength="120" autofocus="autofocus"/>
	                                </div>
	                            </div>
                    		</td>
                    	</tr>
                    	 <tr>
                    		<td colspan="2">
                    			<div class="par control-group my-par">
	                               	<label class="control-label" for="aim">
	                                	资讯内容<span class="tips">*</span>
	                                </label>
	                                 <div class="controls">
    	                            	<textarea cols="30" rows="5" name="content" id="content" class="span6" 
    	                            		style="width: 400px;"></textarea>
                            		</div>
                            	</div>
                            </td>
                    	</tr>
                    	<tr>
                    		<td colspan="2">&nbsp;</td>
                    	</tr>
                    </table>
                    
                      <p class="stdformbutton" style="margin-left: 400px;">
                      	<button type="button" class="btn btn-primary" id="publicNotice">发布</button>&nbsp;&nbsp;
                      	<button type="button" class="btn btn-primary" id="saveNotice">保存</button>&nbsp;&nbsp;
                      	<button type="button" class="btn btn-primary" id="cancelBtn">取消</button>
                      </p>
                    </form>
                </div><!--widgetcontent-->
            </div><!--widget-->
            </div>
            </div>      
		</div>
	</div><!--end of mainwrapper-->
	
	<script>
	 	KindEditor.ready(function(K) {
	 		var control = {
	           	 	width : "69%", //编辑器的宽度为70%
	           	 	height: "300px",
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
        
    	});
	 	
   </script>
   
   <script type="text/javascript" src="${ctx }/resources/scripts/utils/util.js"></script>
   <script type="text/javascript">
   	$(function() {
   		var PUBLISH_NOTICE = 1;	// 发布
   		var SAVE_NOTICE = 0;
	   		
   		var id = getQueryString('noticeId');
   		if(id) {	// 编辑
			$('#li_title').html('编辑资讯');
   			$('#widgettitle').html('编辑资讯');
   			$.post(contextPath+"/notice/detail", {'noticeId': id}).done(function(d) {
   				$('#noticeId').val(d.id);
   				$('#title').val(d.title);
   				content_editor.html(d.content);
   				
   			}).fail(function() {
   			});
   		}

   		// 发布资讯
   		function pubNotice(datas, type) {
   			var tip = "发布";
   			if(type == SAVE_NOTICE){
   				tip = '保存';
   			}
   			
   			$.post(contextPath+"/admin/pubNotice", datas).done(function(msg) {
				if(msg === 'fail') {
					alert(tip + '失败！');
				}else if(msg === 'success') {
					alert(tip + '成功！');
					window.location.href = contextPath + "/admin/noticeList";
				}
				
			}).fail(function(res) {
				alert('服务器端错误！');
			});
   		}
   		
   		
   		//  发布
   		$('#publicNotice').click(function() {
			var title = $.trim($('#title').val());
			var content = $.trim(content_editor.html());
			
			var datas = {
				'id': $('#noticeId').val(),	
				'title': title,
				'content': content, 
				'status': 1
			};
			
			if(checkNotice(title, content)) {
				pubNotice(datas, PUBLISH_NOTICE);
			}
			
   		});
   		
   		
   		// 保存
   		$('#saveNotice').click(function() {
			var title = $.trim($('#title').val());
			var content = $.trim(content_editor.html());
			
			var datas = {
				'id': $('#noticeId').val(),	
				'title': title,
				'content': content, 
				'status': 0
			};
			
			if(checkNotice(title, content)) {
				pubNotice(datas, SAVE_NOTICE);
			}
			
   		});
   		
   		// 验证表单数据
		function checkNotice(title, content) {
			if(title == '') {
				alert('标题不能为空！')
				$('#title').focus();
				return false;
			}
			if(content == '') {
				alert('内容不能为空！')
				$('#content').focus();
				return false;
			}
			if(content.length > 1000) {
				alert('内容超过1000字！')
				$('#content').focus();
				return false;
			}
			
			return true;
		}   		

   		// 取消
   		$('#cancelBtn').click(function() {
   			window.location.href = contextPath + '/admin/noticeList';
   		});
   	});
   </script>
	
</body>
</html>    




