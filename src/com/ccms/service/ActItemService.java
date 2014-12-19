package com.ccms.service;

public interface ActItemService {
	
	/**
	 * 学生报名活动
	 * @param activityId
	 * @param studentId
	 * @return
	 */
	public boolean apply(Integer activityId, Integer studentId);

}
