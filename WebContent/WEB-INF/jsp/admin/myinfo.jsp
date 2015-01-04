<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>我的资料</title>
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
            <a href="dashboard.html"><img src="${pageContext.request.contextPath }/resources/admin/images/logo.png" alt="" /></a>
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
                	<ul style="display: block">
                       <li class="active"><a href="${pageContext.request.contextPath }/admin/myinfo" target="right">个人资料</a></li>
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
	            <li>个人资料</li>
	            
	            <%--
	            <li class="right">
	                <a href="" data-toggle="dropdown" class="dropdown-toggle"><i class="icon-tint"></i> Color Skins</a>
	                <ul class="dropdown-menu pull-right skin-color">
	                    <li><a href="default">Default</a></li>
	                    <li><a href="navyblue">Navy Blue</a></li>
	                    <li><a href="palegreen">Pale Green</a></li>
	                    <li><a href="red">Red</a></li>
	                    <li><a href="green">Green</a></li>
	                    <li><a href="brown">Brown</a></li>
	                </ul>
	            </li>
	             --%>
        	</ul>
        	<div class="maincontent">
        	<div class="maincontentinner">
            <div class="widget">
                <h4 class="widgettitle">我的资料</h4>
                <div class="widgetcontent">
                    <form id="form1" class="stdform" method="post" action="forms.html">
                            <div class="par control-group">
                                    <label class="control-label" for="account">账号</label>
                                <div class="controls"><input type="text" name="account" value="${college.account }" id="account" class="input-large" /></div>
                            </div>
                            <div class="control-group">
                                    <label class="control-label" for="name">名称</label>
                                <div class="controls"><input type="text" name="name" value="${college.name }" id="name" class="input-large" /></div>
                            </div>
                            
                            <div class="par control-group">
                                    <label class="control-label" for="phone">电话号码</label>
                                <div class="controls"><input type="text" name="phone" value="${college.phone }" id="phone" class="input-large" /></div>
                            </div>
                            
                            <div class="par control-group">
                                    <label class="control-label" for="contact">联系人</label>
                                <div class="controls"><input type="text" name="contact" value="${college.contact }" id="contact" class="input-large" /></div>
                            </div>
                            <div class="par control-group">
                                    <label class="control-label" for="address">地址</label>
                                <div class="controls"><textarea cols="20" rows="5" name="address" class="input-large" id="location">${college.address }</textarea></div> 
                            </div>
                                                    
                            <p class="stdformbutton">
                                    <button class="btn btn-primary">更新</button>
                            </p>
                    </form>
                </div><!--widgetcontent-->
            </div><!--widget-->
            </div>
            </div>      
        	
		</div>

	</div><!--end of mainwrapper-->

</body>
</html>    




