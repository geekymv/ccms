<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>专业设置</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/admin/css/style.default.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/admin/css/responsive-tables.css">

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/admin/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/admin/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/admin/js/custom.js"></script>

</head>
<body>
	<div class="mainwrapper">
		<div class="header">
        <div class="logo">
            <a href=""><img src="${pageContext.request.contextPath }/resources/admin/images/logo.png" alt="" /></a>
        </div>
        <div class="headerinner">
            <ul class="headmenu">
                <li class="right">
                    <div class="userloggedinfo">
                        <img src="${pageContext.request.contextPath }/resources/admin/images/photos/thumb1.png" alt="" />
                        <div class="userinfo">
                            <h5>${user.name }</h5>
                            <ul>
                                <li><a href="editprofile.html">修改资料</a></li>
                                <li><a href="">账号设置</a></li>
                                <li><a href="index.html">退出系统</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul><!--headmenu-->
        </div>
    	</div> 

		<div class="leftpanel">
		<div class="leftmenu">        
            <ul class="nav nav-tabs nav-stacked">
            	<li class="nav-header"><h4>菜单栏</h4></li>
                <li><a href="${pageContext.request.contextPath }/admin"><span class="iconfa-laptop"></span>控制面板</a></li>
                <li class="dropdown active"><a href=""><span class="iconfa-pencil"></span> 基本管理</a>
                	<ul style="display: block;">
                       <li><a href="${pageContext.request.contextPath }/admin/myinfo">个人资料</a></li>
                       <li  class="active"><a href="${pageContext.request.contextPath }/college/specialties">专业设置</a></li>
                       <li class="dropdown"><a href="">公告管理</a>
                        	<ul>
	                            <li><a href="">发布公告</a></li>
	                            <li><a href="">公告列表</a></li>
                        	</ul>
                        </li>
                        <li><a href="wysiwyg.html">报名管理</a></li>
                        <li><a href="wysiwyg.html">学生管理</a></li>
                        <li><a href="wysiwyg.html">考核管理</a></li>
                    </ul>
                </li>
                <li class="dropdown"><a href=""><span class="iconfa-briefcase"></span> 勤管管理</a>
                	<ul>
                    	<li><a href="elements.html">学院管理</a></li>
                        <li><a href="bootstrap.html">学生管理</a></li>
                        <li><a href="boxes.html">公告管理</a></li>
                        <li><a href="boxes.html">时间认证</a></li>
                        <li><a href="boxes.html">名单导入</a></li>
                        <li><a href="boxes.html">文档管理</a></li>
                    </ul>
                </li>
                <li class="dropdown"><a href=""><span class="iconfa-th-list"></span> 年度考核</a>
                	<ul>
                    	<li><a href="table-static.html">考核时间</a></li>
                        <li class="dropdown"><a href="table-dynamic.html">年度考核</a></li>
                    </ul>
                </li>
                <li class="dropdown"><a href=""><span class="iconfa-th-list"></span> Three Level Menu Sample</a>
                	<ul>
                    	<li class="dropdown"><a href="">Second Level Menu</a>
                        <ul>
                            <li><a href="">Third Level Menu</a></li>
                            <li><a href="">Another Third Level Menu</a></li>
                        </ul>
                     </li>
                    </ul>
                </li>
            </ul>
        </div><!--leftmenu-->
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
	                            <td>${status.count }</td>
	                            <td>${specialty.name }</td>
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
			<table style="margin-top: 80px;">
				<tr>
					<td>专业名称</td>
					<td><input type="text" name="name" id="name" /></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<button class="btn btn-primary">添加专业</button>		
					</td>
				</tr>
			</table>
		</div>
		
		
	</div>
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/layer/layer.min.js"></script>
	<script type="text/javascript">
		var pageii = null;
		// 添加专业
		jQuery("#add").on('click', function() {
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
		
		// 判断专业是否已经存在
		jQuery("#name").
		
		
	//	/college/exist
		
		
		
		
		
		
		
		
		
		
	</script>

</body>
</html>    

















