/**
 * 文件异步上传
 */
function fileUpload() {
	jQuery.ajaxFileUpload({
		url: contextPath + "/fileUpload",
	    data: {"authority": jQuery("#authority").val()}, // 参数
        secureuri:false,                       //是否启用安全提交,默认为false
        fileElementId:'myImage',           //文件选择框的id属性
        dataType:'text',                       //服务器返回的格式,可以是json或xml等
        success:function(data, status){        //服务器响应成功时的处理函数
			var msg = "上传成功！"
        	if(data == "success") {
				msg = "上传失败！";
			}
			alert(msg);
        }
	});
}
