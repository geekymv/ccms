<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	                        <li><a href="${ctx }/admin/myinfo">修改资料</a></li>
	                        <li><a href="">账号设置</a></li>
	                        <li><a href="${pageContext.request.contextPath }/logout">退出系统</a></li>
	                    </ul>
	                </div>
	            </div>
	        </li>
	    </ul><!--headmenu-->
	</div>
</div> 
    