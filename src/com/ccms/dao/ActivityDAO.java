package com.ccms.dao;

import java.util.List;

import com.ccms.base.dao.BaseDAO;
import com.ccms.persistence.dto.Pager;
import com.ccms.persistence.pojo.Activity;

public interface ActivityDAO extends BaseDAO<Activity> {
	
	/**
	 * 根据活动状态查询总记录数
	 * @param status
	 * @return
	 */
	public int queryTotalRecord(Integer status);
	
	/**
	 * 分页查询所有通过审核的Activity
	 * @param pageOffset
	 * @param pageSize
	 * @return
	 */
	public List<Activity> queryAllStatusByPage(Pager<Activity> pager);

}
