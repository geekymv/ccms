package com.ccms.service;

import com.ccms.pojo.Activity;
import com.ccms.pojo.Student;

public interface ActItemService {
	
	/**
	 * 判断学生是否已经报名了该活动
	 * @param activity
	 * @param student
	 * @return
	 */
	public boolean isApplyed(Activity activity, Student student);
	
	/**
	 * 学生报名活动
	 * @param activityId
	 * @param studentId
	 * @return
	 */
	public boolean apply(Activity activity, Student student);

}
