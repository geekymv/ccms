package com.ccms.interceptor;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ccms.pojo.AccessLog;
import com.ccms.pojo.College;
import com.ccms.pojo.Student;
import com.ccms.service.AccessLogService;
import com.ccms.util.Constant;

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
		
		List<AccessLog> accessLogs = accessLogService.queryByUserIdAndStatus(userId, Constant.USER_STATUS_ONLINE);
		
		AccessLog accessLog = null;
		if(accessLogs != null && accessLogs.size() > 0){
			accessLog = accessLogs.get(accessLogs.size()-1); // 获得用户登录记录
		}
		
		accessLog.setLogoutTime(new Date());
		accessLog.setStatus(Constant.USER_STATUS_OFFLINE);
		boolean res = accessLogService.logout(accessLog);
		
		System.out.println("退出记录状态 = " + res);
		
		return true;
	}
}

















