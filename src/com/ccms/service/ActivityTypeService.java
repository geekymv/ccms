package com.ccms.service;

import java.util.List;

import com.ccms.persistence.pojo.ActivityType;


public interface ActivityTypeService {
	
	/**
	 * 获取活动分类
	 * @return
	 */
	public List<ActivityType> getAll();
	
	/**
	 * 根据id获取活动分类
	 * @param id
	 * @return
	 */
	public ActivityType getById(Integer id);
	
	/**
	 * 编辑活动类别
	 * @param type
	 * @return "notNull"不能为空， "exist" 已存在， "success"成功， "fail"更新失败
	 */
	public String setCategory(ActivityType type);
	
}
