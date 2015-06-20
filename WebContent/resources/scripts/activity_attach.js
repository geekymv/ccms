(function() {
//	$('#file_list').hide();
	// 上传附件
	 var button = jQuery('#select'), interval;//绑定事件
	 var load = new AjaxUpload(button, {//绑定AjaxUpload
	        action: contextPath+"/addAttach",
	        type:"POST",//提交方式
	        autoSubmit: true,//选择文件后,是否自动提交.这里可以变成true,自己去看看效果吧.
	        name:'myFiles',//提交的名字
	        onChange:function(file,ext){//当选择文件后执行的方法,ext存在文件后续,可以在这里判断文件格式
	        },
	        onSubmit: function (file, ext) {//提交文件时执行的方法
	        },
	        // 文件提交完成后可执行的方法
	        onComplete: function (fileName, response) {
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
					
					var fileIds = $('#fileIds').val();
					if($.trim(fileIds) == '') {
						$('#fileIds').val(fileId)
					}else {
						$('#fileIds').val(fileIds+","+ fileId)
					}
					
					var content = '<div>文件名称 '+fileName+'&nbsp;&nbsp;，文件大小 '+size+'<a name="fileName" style="cursor: pointer;"  data-id="'+fileId+'" onclick="deleteFile(this)">&nbsp;&nbsp;删除</a><div>';
					$('#attach_list').append(content);
	        	}
	        }
	    }); // end of AjaxUpload
})();

//删除附件
function deleteFile(t) {
	var res = confirm('确定要删除附件么？');
	if(res) {
		var $this = $(t);
		var id = $this.data('id');
		
		$.post(contextPath+"/deleteAttach", {'id': id}).done(function(msg) {
			if(msg == 'success') {
				layer.msg('删除成功！');
				$this.parent().remove();						
			}
		});
	}			    	
}