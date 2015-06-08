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
	 * 根据活动id和学生id删除
	 * 
	 * @param activityId
	 * @param studentId
	 * @return
	 */
	public void deleteByActIdAndStuId(@Param("activityId") Integer activityId,
			@Param("studentId") Integer studentId);
	
	
	/**
	 * 根据学生id查询学生报名的活动
	 * @param studentId
	 * @return
	 */
	public List<ActivityItem> queryAllActivityItem(Integer studentId);
	
	/**
	 * 根据活动id查询该活动已报名人数
	 * @param activityId
	 * @return
	 */
	public int queryAllActivityItemByActivityId(@Param("activityId")Integer activityId);
	
	/**
	 * 根据学生id分组查询各种类型完成的活动时间
	 * @param studentId 学生id
	 * @param startDate 起始时间
	 * @param endDate 结束时间
	 * @return
	 */
	public List<ActivityItemVO> queryActivityItemVO(@Param("studentId")Integer studentId, 
									@Param("startDate")String startDate, @Param("endDate") String endDate);
	
	/**
	 * 根据id更新状态
	 */
	public void auditActivityItem(ActivityItem item);
	
	
	/**
	 * 根据学生id和活动二级类别id获得学生参加该类别活动次数
	 * @param stuId
	 * @param secondLevel
	 * @return
	 */
	public int getTotalTimes(@Param("stuId")Integer stuId, @Param("secondLevel")Integer secondLevel);
}









