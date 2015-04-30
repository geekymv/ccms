package com.ccms.service;


import com.ccms.persistence.dto.Pager;
import com.ccms.persistence.pojo.Activity;

public interface ActivityService {
	
	/**
	 * 分页查询所有通过审核的Activity
	 * @param pageOffset
	 * @param pageSize
	 * @return
	 */
//	public Pager<Activity> queryAllStatusByPage(int pageOffset, int pageSize);
	public Pager<Activity> queryAllStatusByPage(Pager<Activity> pager);
	
	/**
	 * 根据id查看Activity
	 * @param id
	 * @return
	 */
	public Activity detail(Integer id);
	
	/**
	 * 添加活动
	 * @param activity
	 * @return
	 */
	public int add(Activity activity);
	
	
	
}
