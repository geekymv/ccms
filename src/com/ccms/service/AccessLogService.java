package com.ccms.service;

import java.util.List;

import com.ccms.persistence.pojo.AccessLog;

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
	
	/**
	 * 根据用户id和用户状态(是否在线)查询
	 * @param userId
	 * @param status
	 * @return
	 */
	public List<AccessLog> queryByUserIdAndStatus(String userId, int status);

}
