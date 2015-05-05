<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>公益活动后台管理系统</title>
<%@ include file="/WEB-INF/jsp/inc/admin_style.jsp"%></head>

<link href="${ctx }/resources/css/basic_layout.css" rel="stylesheet" type="text/css">
<link href="${ctx }/resources/css/common_style.css" rel="stylesheet" type="text/css">

<body>
	<div class="mainwrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="leftpanel">
			<jsp:include page="leftmenu.jsp"></jsp:include>
		</div>
		<div class="righpanel">
			<div id="container">
				<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center"  border="0">
				    <tr>
				      <th colspan="2">系统版本</th>
				    </tr>
				    <tr>
				      <td width="100" height="30">当前版本<span class="TableRow2"></span></td>
				      <td style="text-align:left">后台管理系统 4.1</td>
				    </tr>
				    <tr>
				      <td width="100" height="30">版权声明</td>
				      <td style="text-align:left">1、本系统为嘿客科技独立开发,未经授权，不得向任何第三方提供本软件系统; <br>        
				      	  2、本软件受中华人民共和国《著作权法》《计算机软件保护条例》等相关法律、法规保护，嘿客科技开发团队保留一切权利，如有需要请联系QQ：1784160856进行留言。</td>
				    </tr>
				</table>
				<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
				    <tr>
				      <th colspan="2">系统开发 </th>
				    </tr>
				    <tr>
				      <td width="100" height="30">程序制作</td>
				      <td style="text-align:left">嘿客科技传媒创业团队</td>
				    </tr>
				    <tr>
				      <td width="100" height="30">联系方式</td>
				      <td style="text-align:left">
				      	1784160856@qq.com
				      </td>
				    </tr>
				    <tr>
				      <td width="100" height="30">嘿客联系人<span class="TableRow2"></span></td>
				      <td style="text-align:left">
				      	11计算机-孙标、12植保-苗昱
				      </td>
				    </tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>    

















