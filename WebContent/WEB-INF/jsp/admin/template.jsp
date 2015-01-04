<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="header">
   <div class="logo">
       <a href="dashboard.html"><img src="${pageContext.request.contextPath }/resources/admin/images/logo.png" /></a>
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
             <li class="active"><a><span class="iconfa-laptop"></span>控制面板</a></li>
             <li class="dropdown"><a href=""><span class="iconfa-pencil"></span> 基本管理</a>
             	<ul>
                 	<li><a href="${pageContext.request.contextPath }/admin/myinfo">个人资料</a></li>
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
     </div>
</div>

















