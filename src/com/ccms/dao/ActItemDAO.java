package com.ccms.dao;

import org.apache.ibatis.annotations.Param;

import com.ccms.pojo.ActItem;

public interface ActItemDAO extends BaseDAO<ActItem> {

	/**
	 * 根据活动id和学生id查询
	 * 
	 * @param activityId
	 * @param studentId
	 * @return
	 */
	public ActItem queryByActIdAndStuId(@Param("activityId") Integer activityId,
			@Param("studentId") Integer studentId);
}
