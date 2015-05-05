package com.ccms.service;

import java.util.List;

import com.ccms.persistence.dto.ActivityItemDto;
import com.ccms.persistence.pojo.Activity;
import com.ccms.persistence.pojo.ActivityItem;
import com.ccms.persistence.pojo.Student;
import com.ccms.persistence.vo.RankActivityTypeVO;

public interface ActivityItemService {
	
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
	
	
	/**
	 * 根据学生id查询学生报名的活动
	 * @param studentId
	 * @return
	 */
	public List<ActivityItem> queryAllActivityItem(Integer studentId);
	
	
	/**
	 * 根据学生id查询该学生各种类型完成的时间
	 * @param dto
	 * @return
	 */
	public List<RankActivityTypeVO> queryRankActivityItemVO(ActivityItemDto dto);
	
	/**
	 * 根据id更新状态
	 */
	public void auditActivityItem(ActivityItem item);
}







