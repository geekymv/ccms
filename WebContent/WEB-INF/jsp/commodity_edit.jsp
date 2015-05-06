<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager" %>       
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑商品信息</title>
<link rel="stylesheet" style="text/css" href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css"  />
<style type="text/css">
	body {
		font-family: "微软雅黑";
	}
	img {
		width: 100px;
		height: 80px;
	}
	
	.mytable {
		text-align: center;
		width: 600px;
		margin: 0 auto;
	}
	
	#return_from {
		margin-left: 20px;
	}
</style>

</head>
<body>
	<div class="container">
		<jsp:include page="include/header.jsp"></jsp:include>
		
		<h3>详情信息</h3>
		
		<div style="margin-top: 10px;">
		<table class="table table-bordered table-hover table-condensed mytable">
		<tr>
			<td>
				商品名称：
			</td>
			<td>
				<input type="hidden" name="id" id="id" value="${commodity.id }" />
				<input type="text" name="name" value="${commodity.name }" id="cname" class="name" size="20" />	
			</td>
		</tr>
		<tr>
			<td>
				分类: 
				<select name="category.id" id="category" class="category" >
					<option value="-1">--请选择类别--</option>
					<c:forEach items="${categories }" var="category">
					<c:choose>
						<c:when test="${commodity.category.id == category.id }">
							<option value="${category.id }" selected="selected">${category.name }</option>
						</c:when>
						<c:otherwise>
							<option value="${category.id }">${category.name }</option>
						</c:otherwise>
					</c:choose>
					</c:forEach>	
				</select> 
			</td> 
			<td>
				二级分类：
				<select name="subCategory.id" id="subCategory" class="subCategory">
				<option value="-1">--请选择类别--</option>
				<c:forEach items="${subCategories }" var="subCategory">
					<c:choose>
						<c:when test="${commodity.subCategory.id == subCategory.id }">
							<option value="${subCategory.id }" selected="selected">${subCategory.name }</option>
						</c:when>
						<c:otherwise>
							<option value="${subCategory.id }">${subCategory.name }</option>
						</c:otherwise>
					</c:choose>
					
				</c:forEach>
				</select> 
			</td>
		</tr>
		<tr>
			<td>
				价格：<input type="text" name="price" class="price" value="${commodity.price }" size="6" />
			</td>
			<td>
				库存：<input type="text" name="inventory" class="inventory" value="${commodity.inventory }" size="6" />
			</td>
		</tr>
		<tr>
			<td>
				图片：
				<img alt="" src="${pageContext.request.contextPath }/upload/${commodity.imgUrl}">
			</td>
			<td>
				<input type="file" name="myFiles" id="myImage" />
			</td>
		</tr>
		<tr>
			<td>
				描述：
			</td>
			<td>
				<textarea name="description" class="description" rows="5" cols="20" style="resize: none;" >${commodity.description }</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" id="add_commodity" value="修改"/>
				<input type="button" id="return_from" onclick="window.location.href='${from}'" value="返回"/>
			</td>
		</tr>
		</table>	
	</div>
	</div>
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/script/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/layer/layer.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/script/ajaxfileupload.js"></script>

	<script type="text/javascript">
		$(function(){
			// 类别级联
			$("select[id='category']").change(function(){
				var sel = $(this);
				var categoryId = $(this).val();	
				if(categoryId == "-1"){
					sel.parent("td").next().find("#subCategory").val(-1);
					return ;
				}
				$.ajax({
					url: "${pageContext.request.contextPath }/commodity/getSubCategories",
					type: "post",
					data: {"categoryId": categoryId},
					dataType: "json",
					success: function(data){
						var html = "";
						
						for ( var i in data) {
							var subCategory = data[i];
							html += '<option value="' + subCategory.id + '">' + subCategory.name + '</option>';
						}
						
						sel.parent("td").next().find("#subCategory").html(html);
					}
				});
			});	

			// 修改商品输入验证
			var validate= function() {
				var name = $.trim($('.name').val());
				if(!name) { // javascript中false,0,空字符串,NaN,null,undefined都会自动转化为false
					alert("商品名称不能为空！");
					return false;
				}

				var categoryId = $('.category').val();
				if(categoryId == '-1') {
					alert('请选择商品一级类型');
					return false;
				}
				var subCategoryId = $('.subCategory').val();
				if(subCategoryId == '-1') {
					alert('请选择商品二级类型');
					return false;
				}
				
				var price = $('.price').val();
				if(!price){
					alert('商品价格不能为空！');
					return false;
				}
				var re = /^[-]?[0-9]+[\.]?[0-9]*$/; // 或者/^[0-9]+\.?[0-9]*$/或者/^[0-9]+.?[0-9]*$/判断是否为整数或浮点数
				if(!re.test(price)){
					alert('商品价格不合法！');
					return false;	
				}
				 
				/* 
				if(isNaN(price)){
					alert("请输入合法的商品价格！");
					return false;
				}
				*/
				
				return true;
			}
			
			$("#add_commodity").on('click', function(){
				// 验证
				if(!validate()) {
					return;					
				}
				
				var data = {'id': $('#id').val(),'name': $('.name').val(), 'category.id': $('.category').val(),
						'subCategory.id': $('.subCategory').val(), 'price': $('.price').val(),
						'inventory': $('.inventory').val(), 'description': $('.description').val()
			 	}; 
				
				/*
				使用javascript实现若没有选择新的图片，则使用原有的图片
				*/
				if($("#myImage").val() == ""){
				//	alert("没有选择图片");	
					data.imgUrl = '${commodity.imgUrl }';	
				}
		//		console.log(data);
		//		return;					
				
				$.ajaxFileUpload({
    				url:'${pageContext.request.contextPath}/commodity/edit',
    			    data: data, // 参数
   			        secureuri:false,                       //是否启用安全提交,默认为false
   			        fileElementId:'myImage',           //文件选择框的id属性
   			        dataType:'text',                       //服务器返回的格式,可以是json或xml等
   			        success:function(data, status){        //服务器响应成功时的处理函数
   			        	if(data == 'success') {
   			        		
   			        		$.layer({
   			        		    shade: [0],
   			        		    area: ['auto','auto'],
   			        		    dialog: {
   			        		        msg: '修改成功',
   			        		        btns: 1,                    
   			        		        type: 4,
   			        		        btn: ['确定'],
   			        		        yes: function(){
   			        		        //    layer.msg('我要返回了...', 1, 1);
   			        		        	window.location.href='${from}';
   			        		        }, no: function(){
   			        		        //    layer.msg('奇葩', 1, 13);
   			        		        }
   			        		    }
   			        		});
   			        	}
   			        }
   				});
			});
			
		});
	</script>


</body>
</html>

























