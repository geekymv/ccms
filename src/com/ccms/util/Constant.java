package com.ccms.util;

public class Constant {
	/**
	 * 用户在线
	 */
	public static final Integer USER_STATUS_ONLINE = 1; 
	
	/**
	 * 用户不在线
	 */
	public static final Integer USER_STATUS_OFFLINE = 0;
	
	/**
	 * ActItem等待认证
	 */
	public static final Integer ACTITEM_AUDIT_WAIT = 0;
	/**
	 * ActItem认证通过
	 */
	public static final Integer ACTITEM_AUDIT_APPROVE = 1;
	/**
	 * ActItem认证未通过
	 */
	public static final Integer ACTITEM_AUDIT_UNAPPROVE = -1;
	
	
}
