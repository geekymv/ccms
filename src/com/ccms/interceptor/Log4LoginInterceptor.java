package com.ccms.interceptor;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ccms.pojo.AccessLog;
import com.ccms.pojo.College;
import com.ccms.pojo.Student;
import com.ccms.service.AccessLogService;
import com.ccms.util.Constant;

/**
 * 用户登录日志
 * @author Geek_ymv
 */
public class Log4LoginInterceptor extends HandlerInterceptorAdapter {

	private AccessLogService accessLogService;
	public void setAccessLogService(AccessLogService accessLogService) {
		this.accessLogService = accessLogService;
	}

	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		System.out.println("preHandle....");
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user");
		
		if(obj == null){
			return;
		}
		
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
		
		String ip = request.getRemoteHost();
		System.out.println("ip = " + ip);
		
		accessLog.setIp(ip);
		accessLog.setLoginTime(new Date());
		accessLog.setUserId(userId);
		accessLog.setStatus(Constant.USER_STATUS_ONLINE);
		
		boolean res = accessLogService.login(accessLog);
		
		System.out.println("登录记录状态 = " + res);
	}
	
	
}















