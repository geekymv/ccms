package com.ccms.service;

import com.ccms.pojo.AccessLog;

public interface AccessLogService {
	
	/**
	 * 用户登录
	 * @return
	 */
	public boolean login(AccessLog accessLog);
	
	/**
	 * 用户退出
	 * @param accessLog
	 * @return
	 */
	public boolean logout(AccessLog accessLog);

}
