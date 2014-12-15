package com.ccms.service;


import com.ccms.pojo.Activity;
import com.ccms.pojo.Pager;

public interface ActivityService {
	
	/**
	 * 分页查询所有通过审核的Activity
	 * @param pageOffset
	 * @param pageSize
	 * @return
	 */
	public Pager<Activity> queryAllStatusByPage(int pageOffset, int pageSize);
	
	/**
	 * 根据id查看Activity
	 * @param id
	 * @return
	 */
	public Activity detail(Integer id);
	
}
