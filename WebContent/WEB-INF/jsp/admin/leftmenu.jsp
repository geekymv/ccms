<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglibs.jsp"%>    
  
<div class="leftmenu">        
     <ul class="nav nav-tabs nav-stacked">
      	<li class="nav-header"><h4>菜单栏</h4></li>
          <li><a href="${pageContext.request.contextPath }/admin"><span class="iconfa-laptop"></span>控制面板</a></li>
      <li class="dropdown active"><a href=""><span class="iconfa-pencil"></span> 基本管理</a>
      	<ul style="display: block">
             <li class="active"><a href="${pageContext.request.contextPath }/admin/myinfo">个人资料</a></li>
             <!-- 学院才会显专业设置 -->	
             <c:if test="${user.colType == 2 }">
             	<li><a href="${pageContext.request.contextPath }/admin/specialties">专业设置</a></li>
             </c:if>
             
             <c:if test="${user.colType == 2 || user.colType == 3 }">
	             <li class="dropdown"><a href="">活动管理</a>
	              	<ul>
	                   <li><a href="${pageContext.request.contextPath }/admin/pubActivity">申请活动</a></li>
	                   <li><a href="${ctx }/admin/activities">活动列表</a></li>
	              	</ul>
	             </li>
             </c:if>
             <c:if test="${user.colType == 2 }">
              <li class="dropdown"><a href="">学生管理</a>
              	<ul>
                   <li><a href="${ctx }/college/students">学生列表</a></li>
                   <li><a href="${ctx }/college/addStudent">添加学生</a></li>
              	</ul>
              </li>
              <!-- 
              <li><a href="javascript:void(0);" onclick="alert('攻城狮们正在努力开发中...')">考核管理</a></li>
              -->
             </c:if>
          </ul>
      </li>
      <%-- 勤管中心显示的菜单  --%>
      <c:if test="${user.colType == 1 }">
      <li class="dropdown active"><a href=""><span class="iconfa-briefcase"></span> 勤管管理</a>
      	<ul style="display: block">
          	<li class="dropdown"><a href="">单位管理</a>
          		<ul>
                   <li><a href="${ctx }/admin/employers">单位列表</a></li>
                   <li><a href="${ctx }/admin/add_employer">添加单位</a></li>
              	</ul>
          	</li>
        	<li class="dropdown"><a href="">活动管理</a>
            	<ul>
            		<li><a href="${ctx }/admin/activities">活动列表</a></li>
            	</ul>
            </li>
            <li class="dropdown"><a href="">学生管理</a>
              	<ul>
              		<li><a href="${ctx }/admin/students">学生列表</a></li>
              	</ul>	
            </li>
            
            <li class="dropdown"><a href="">资讯管理</a>
              	<ul>
              		<li><a href="${ctx }/admin/pubNotice">发布资讯</a></li>
              		<li><a href="${ctx }/admin/noticeList">资讯列表</a></li>
              	</ul>	
            </li>
            <!-- 
            <li><a href="${ctx }/admin/timeauth">时间认证</a></li>
             -->
            <li><a href="${ctx}/admin/doc">文档管理</a></li>
            <li class="dropdown"><a href="">系统设置</a>
            	<ul>
					<li><a href="${ctx }/admin/setAddStudentTime">设置添加学生时间</a></li>            	
					<li><a href="${ctx }/admin/setCategory">设置活动类别</a></li>            	
					<li><a href="${ctx }/admin/setAuthTime">设置认证时间</a></li>            	
            	</ul>
            </li>
          </ul>
      </li>
      <!-- 
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
       -->
      </c:if>
  </ul>
  </div><!--leftmenu-->
