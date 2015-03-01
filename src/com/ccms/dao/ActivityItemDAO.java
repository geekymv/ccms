package com.ccms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ccms.base.dao.BaseDAO;
import com.ccms.persistence.pojo.ActivityItem;
import com.ccms.persistence.vo.ActivityItemVO;

public interface ActivityItemDAO extends BaseDAO<ActivityItem> {

	/**
	 * 根据活动id和学生id查询
	 * 
	 * @param activityId
	 * @param studentId
	 * @return
	 */
	public ActivityItem queryByActIdAndStuId(@Param("activityId") Integer activityId,
			@Param("studentId") Integer studentId);
	
	/**
	 * 根据学生id查询学生报名的活动
	 * @param studentId
	 * @return
	 */
	public List<ActivityItem> queryAllActivityItem(Integer studentId);
	
	/**
	 * 根据学生id分组查询各种类型完成的活动时间
	 * @param studentId 学生id
	 * @return
	 */
	public List<ActivityItemVO> queryActivityItemVO(Integer studentId);
	
	
}









