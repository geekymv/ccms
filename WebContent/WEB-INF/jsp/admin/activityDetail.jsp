<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>详情活动</title>
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
     .div-top {
    	padding-top: 5px;
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
	            <li>活动详情</li>
        	</ul>
        	<div class="maincontent">
        	<div class="maincontentinner">
            <div class="widget">
                <h4 class="widgettitle">活动详情</h4>
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
										<input type="hidden" name="id" id="id" />
										<input type="hidden" name="activityUuid" id="activityUuid" />	                               
	                                	<input type="text" name="name" id="name" class="input-xxlarge" style="width: 575px;" autofocus="autofocus"/>
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
	                                	onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm', minDate:'%y-%M-%d', isShowClear:false})" />
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
	                                	加分时长（小时）<span class="tips">*</span>
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
							<td colspan="2">
	                    		<div class="par control-group my-par">
	                                <label class="control-label" for="phone">
	                                	附件列表
	                                	<input type="hidden" id="fileIds" />
	                                </label>
	                                <div class="controls">
										<div id="attach_list" style="margin-left: 220px;">
										</div>
	                                </div>
	                            </div>
                    		</td>                    	
                    	</tr>
                    	<tr>
                    		<td colspan="2">
	                    		<div class="par control-group my-par">
	                                <label class="control-label" for="assist">
	                                	活动状态
	                                </label>
	                                <div class="controls div-top" id='activity_status' style="color: blue;">
										
	                                </div>
	                            </div>
                    		</td>
                    	</tr>
                    </table>
                      <p class="stdformbutton" style="margin-left: 400px;">
                      	<c:if test="${user.authority != 1}">
                      	<button type="button" class="btn btn-primary" id="select">添加附件</button>&nbsp;&nbsp;
                      	</c:if>
                      	<button type="button" id="updateActivity" class="btn btn-primary">更新活动</button>
                      	<c:if test="${user.authority == 1}">
                      	   <button type="button" class="btn btn-primary" onclick="audit(1)">通过</button>
                          &nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" onclick="audit(-1)">撤回</button>
                      	</c:if>
                      </p>
                    </form>
                </div><!--widgetcontent-->
            </div><!--widget-->
            </div>
            </div>      
		</div>
	</div><!--end of mainwrapper-->
	<script type="text/javascript" src='<c:url value="/resources/scripts/college.js" />'></script>
	<!-- 附件上传 -->
	<script src="<c:url value='/resources/scripts/jquery.ajaxupload.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/scripts/activity_attach.js'/>"></script>
	<script>
		KindEditor.ready(function(K) {
	 		var control = {
	           	 	width : "69%", //编辑器的宽度为70%
	           	 	height: "200px",
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
	
	<script type="text/javascript">
		var $ = jQuery;
		function formatterDate2(time) {
			if(time == null || $.trim(time) == '') {
				return "";
			}
			if (time.length == 14) {
				return time.substring(0, 4) + "-" + time.substring(4, 6) + "-"
					+ time.substring(6, 8) + " " + time.substring(8, 10) + ":"
					+ time.substring(10, 12);
			}
			return "";
		}
		// 管理员审核活动
		function audit(status) {
			var datas = null;
			if(status == -1) { // 审核不通过
				// 原因弹框
				layer.prompt({
					title: '撤回原因'
				}, function(val){	// 输入框中的值
					datas = {'id': $('#id').val(), "status": status, 'reason': $.trim(val)};
					jQuery.post(contextPath+"/admin/aduitActivity", datas).done(function(msg){
						if(msg == 'success') {
							alert('操作成功！');
							window.location.reload();
						}else if(msg == 'fail') {
							alert('操作失败！');
						}
								
					}).fail(function(){
						alert('服务器端错误！');
					});
				});
				
			} else if(status == 1) {	// 审核通过
				datas = {'id': $('#id').val(), "status": status};
			
				jQuery.post(contextPath+"/admin/aduitActivity", datas).done(function(msg){
					if(msg == 'success') {
						alert('操作成功！');
						window.location.reload();
					}else if(msg == 'fail') {
						alert('操作失败！');
					}
							
				}).fail(function(){
					alert('服务器端错误！');
				});
			}
		}

		$(function() {
			//  更新活动信息
			$('#updateActivity').click(function() {
				if(activityValidate()) {
					var data = {
						'id': $('#id').val(),
						'activityUuid': $('#activityUuid').val(),
						'name': $('#name').val(),
						'dateTime': $('#dateTime').val(),
						'endDate': $('#endDate').val(),
						'location': $('#location').val(),
						'actType.id': $('#actType').val(),
						'secondLevel.id': $('#secondLevel').val(),
						'aim': aim_editor.html(),
						'content': content_editor.html(),
						'duration': $('#duration').val(),
						'actObject': $('#actObject').val(),
						'number': $('#number').val(),
						'contact': $('#contact').val(),
						'phone': $('#phone').val(),
						'assist': $('#assist').val(),
						'status': 0
					};
				
					$.post(contextPath+"/college/updateActivity", data).done(function(msg){
						if($.trim(msg) != '') {
							alert('更新成功！');
							var as = $('a[name=fileName]');
							if(as != null) {
								for(var i = 0; i < as.size(); i++) {
									var id = $(as.get(i)).data('id');
									// 将活动和文件关联
									$.post(contextPath+"/linkFileAndActivity" , {'fileId': id, 'uuid': msg}).done(function(msg) {
									//	alert(msg);
									});
									
								}
							}
							
						}else if(msg == 'fail') {
							alert('更新失败！');
						}
					}).fail(function(){
						alert('服务器端错误！');						
					});
				}
			});

			// 加载活动信息
			$.ajax({
				url: contextPath+"/admin/activity_detail",
				type: 'POST',
				data: {"id": '${activityId}'},
				async: true,
				success: function(result) {
					// 用户身份
					var user_authority = '${user.authority}'
					var id = result.id;
					// 活动审核状态
					var status = result.status;

					var activityUuid = result.activityUuid;
					// 加载活动附件
					$.post(contextPath+"/admin/getFileByActivityUuid", 
							{'activityUuid': activityUuid}).done(function(data) {
						// 渲染附件列表
						var len = data.length;
						if(len == 0) {
							// TODO							
						}else {
							for(var i = 0; i < len; i++) {
								var file = data[i];								
								var fileName = file.originalFilename;
								var fileId = file.id;
								var size = file.fileSize;
								var content = '';
								if(user_authority == 1 || status == 1) {	// 管理员
									content = '<div>'+fileName+'<input type="hidden" id="fileName" value="'+file.newFileName+'" />';
									content += ',&nbsp;&nbsp;'+size+'<a style="cursor: pointer;" onclick="downloadAttach(this)">&nbsp;&nbsp;下载</a><div>';
								}else {
									content = '<div>'+fileName+'<input type="hidden" id="fileName" value="'+file.newFileName+'" />';
									content += '&nbsp;&nbsp;'+size+'<a style="cursor: pointer;" onclick="downloadAttach(this)">&nbsp;&nbsp;下载</a>';
									content += '<a name="fileName" data-id="'+fileId+'" style="cursor: pointer;" onclick="deleteFile(this)">&nbsp;&nbsp;删除</a><div>';
							//		content += '<div>文件名称 '+fileName+'&nbsp;&nbsp;，文件大小 '+size+'<a name="fileName" data-id="'+fileId+'" style="cursor: pointer;" onclick="deleteFile(this)">&nbsp;&nbsp;删除</a><div>';
								}
								
								
								
								$('#attach_list').append(content);
							}
						}
								
					}).fail(function(msg) {
					});
					
					
					var name = result.name;
					var dateTime = result.dateTime;
					var endDate = result.endDate;
					var location = result.location;
					var aim = result.aim;
					var content = result.content;
					var actTypeId = result.actType.id; // 加分类型id
					var secondLevelId = result.secondLevel.id; // 二级分类类型id
					var duration = result.duration;
					var actObject = result.actObject;
					var number = result.number;
					var contact = result.contact;
					var phone = result.phone;
					var assist = result.assist;
					var reason = result.reason;
					
					
					
					if(user_authority == 1) {	// 管理员
						$('#updateActivity').hide();
						// 将输入框置为不可编辑状态
						$('#name').attr('readonly', 'readonly');
						$('#dateTime').attr('readonly', 'readonly');
						$('#endDate').attr('readonly', 'readonly');
						$('#location').attr('readonly', 'readonly');
						$('#aim').attr('readonly', 'readonly');
						$('#content').attr('readonly', 'readonly');
						$('#duration').attr('readonly', 'readonly');
						$('#actObject').attr('readonly', 'readonly');
						$('#number').attr('readonly', 'readonly');
						$('#contact').attr('readonly', 'readonly');
						$('#phone').attr('readonly', 'readonly');
						$('#assist').attr('readonly', 'readonly');
						
					
					}else if(user_authority == 0) {	// 用工单位
						$('#updateActivity').show();
					}
					
					
					
					if(status == 1) {	// 通过，不可编辑
						$('#updateActivity').hide();
						$('#select').hide();
					}				
					
					$('#id').val(id);
					$('#activityUuid').val(activityUuid);
					$('#name').val(name);
					$('#dateTime').val(dateTime);
					$('#endDate').val(formatterDate2(endDate));
					$('#location').val(location);
					aim_editor.html(aim);
					content_editor.html(content);
					$('#duration').val(duration);
					var html = '';
					if(actObject == -1) {
						html += '<option value="-1" selected="selected">全校学生</option>'
						+'<option value="${user.id }">${user.name}学生</option>';
					}else {
						var newActObject = '';
						$.ajax({
	    					url: contextPath+"/getCollegeById",
	    					data: {'colId': actObject},
	    					type: 'POST',	
	    					async: false, // 同步
							dataType: 'json',
							success: function(data){
								newActObject = data.name;
							}
	    				});
						html += '<option value="-1">全校学生</option>'
							+'<option value="'+actObject+'" selected="selected">'+newActObject+'学生</option>';
					}
					$('#actObject').append(html);
					
					$('#number').val(number);
					$('#contact').val(contact);
					$('#phone').val(phone);
					$('#assist').val(assist);
					var status_str = '';
					if(status == 0) {
	    				status_str = '待审核';
	    			}else if(status == 1) {
	    				status_str = '审核通过';
	    			}else if(status == -1) {
	    				status_str = '未通过' + '（<span style="color: red">原因：'+ reason +'</span>）';
	    				if(user_authority == 0) {	// 用工单位
	    					status_str = '未通过' + '（<span style="color: red">原因：'+ reason +'。请编辑后更新活动...</span>）';    					
	    				}
	    			}
					
					$('#activity_status').html(status_str);
					
					// 加载活动加分类型
					jQuery.ajax({
						url: contextPath + "/activityTypes",
						dataType: "json",
						async: false,
						success: function(data){
							var html = "";
							for(var i = 0; i < data.length; i++) {
								var type = data[i];
								var op = "<option value="+ type.id +">" + type.name + "</option>";
								if(type.id == actTypeId) {
									op = "<option value="+ type.id +" selected='selected'>" + type.name + "</option>";
								}
								html += op;
							}
							jQuery("#actType").html(html);
						}
					});
					
					// 加载二级分类类型
					var superiorId = $('#actType').val();
					/**
					 * 根据一级分类id获取所有二级分类
					 */
					$.post(contextPath + "/secondLevels", {'superiorId': superiorId}).done(function(data) {
						var len = data.length;
						var html = '';
						if(len == 0) {
							html = '<option value="1">其他</option>';	
						}
						for(var i = 0; i < len; i++) {
							var secondLevel = data[i];
							var op = '<option value="'+secondLevel.id+'">'+secondLevel.name+'</option>';	
							if(secondLevelId == secondLevel.id) {
								op = '<option value="'+secondLevel.id+'" selected="selected">'+secondLevel.name+'</option>';
							}
							html += op;
						}
						$('#secondLevel').html(html);
					});
					
				}
			});
			
			/**
			 * 一级分类改变事件
			 */
			$("#actType").change(function(){
				var superiorId = $('#actType').val();
				/**
				 * 根据一级分类id获取所有二级分类
				 */
				$.post(contextPath + "/secondLevels", {'superiorId': superiorId}).done(function(data) {
					var len = data.length;
					var html = '';
					if(len == 0) {
						html = '<option value="1">其他</option>';	
					}
					for(var i = 0; i < len; i++) {
						var secondLevel = data[i];
						html += '<option value="'+secondLevel.id+'">'+secondLevel.name+'</option>';	
					}
					$('#secondLevel').html(html);
				});
			});
		});
		
	</script>
	
	
</body>
</html>    




