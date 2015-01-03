package com.ccms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ccms.pojo.RankActivityType;
import com.ccms.pojo.RankActivityTypeVO;

public interface RankActivityTypeDAO {
	
	/**
	 * 根据等级id和活动类型id查询
	 * @param rankId
	 * @param activityId
	 * @return
	 */
	public RankActivityType queryByRankIdActivityTypeId(@Param("rankId")Integer rankId,
			@Param("activityTypeId")Integer activityTypeId);
	
	/**
	 * 根据等级id查询该等级的各项活动类型总分
	 * @param rankId
	 * @return
	 */
	public List<RankActivityTypeVO> queryByRankId(Integer rankId);

}
