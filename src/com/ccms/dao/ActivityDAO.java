package com.ccms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ccms.pojo.Activity;

public interface ActivityDAO extends BaseDAO<Activity> {
	
	
	/**
	 * 分页查询所有通过审核的Activity
	 * @param pageOffset
	 * @param pageSize
	 * @return
	 */
	public List<Activity> queryAllStatusByPage(@Param("pageOffset")int pageOffset, @Param("pageSize")int pageSize);
}
