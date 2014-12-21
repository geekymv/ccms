package com.ccms.service;

import com.ccms.pojo.Activity;
import com.ccms.pojo.Student;

public interface ActItemService {
	
	/**
	 * 学生报名活动
	 * @param activityId
	 * @param studentId
	 * @return
	 */
	public boolean apply(Activity activity, Student student);

}
