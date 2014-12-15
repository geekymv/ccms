package com.ccms.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


public class LoginInterceptor implements HandlerInterceptor {
	
	private List<String> excludeUrls;
	public void setExcludeUrls(List<String> excludeUrls) {
		this.excludeUrls = excludeUrls;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
//		String uri = request.getRequestURI();
//		System.out.println("uri = " + uri);
//		
//		for (String excludeUrl : excludeUrls) {
//			if(uri.endsWith(excludeUrl) || uri.contains("/resources/")) {
//				System.out.println("url 不需要拦截...");
//				return true;
//			}
//		}
//		
//		HttpSession session =  request.getSession();
//		Object obj = session.getAttribute("user");
//		
//		if(obj == null) {
//			System.out.println("session拦截木有通过...");
//			return false;
//		}
//		
//		System.out.println("session拦截通过...");
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}


}

















