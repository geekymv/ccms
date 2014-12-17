package com.ccms.interceptor;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ccms.pojo.AccessLog;
import com.ccms.pojo.College;
import com.ccms.pojo.Student;
import com.ccms.service.AccessLogService;

/**
 * 用户退出日志
 * @author Geek_ymv
 */
public class Log4LogoutInterceptor extends HandlerInterceptorAdapter {

	private AccessLogService accessLogService;
	public void setAccessLogService(AccessLogService accessLogService) {
		this.accessLogService = accessLogService;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {

		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user");
		
		Class<?> clazz = obj.getClass();
	
		String userId = "";
		
		if(clazz == Student.class) {
			Student student = (Student)obj;
			userId = student.getId() + "";

		}else if (clazz == College.class) {
			College college = (College)obj;
			userId = college.getId() + "";
		}
		
		AccessLog accessLog = new AccessLog();
		accessLog.setUserId(userId);
		accessLog.setLogoutTime(new Date());
		
		boolean res = accessLogService.logout(accessLog);
		
		System.out.println("退出记录状态 = " + res);
		
		return true;
	}
}

















