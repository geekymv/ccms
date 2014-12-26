package com.ccms.dao;

import java.util.List;

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
	
	/**
	 * 根据学生id查询学生报名的活动
	 * @param studentId
	 * @return
	 */
	public List<ActItem> queryAllActivityItem(Integer studentId);
	
}









