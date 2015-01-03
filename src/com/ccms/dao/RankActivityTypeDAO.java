package com.ccms.dao;

import org.apache.ibatis.annotations.Param;

import com.ccms.pojo.RankActivityType;

public interface RankActivityTypeDAO {
	
	/**
	 * 根据等级id和活动类型id查询
	 * @param rankId
	 * @param activityId
	 * @return
	 */
	public RankActivityType queryByRankIdActivityTypeId(@Param("rankId")Integer rankId,
			@Param("activityTypeId")Integer activityTypeId);
	

}
