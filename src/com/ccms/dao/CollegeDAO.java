package com.ccms.dao;

import java.util.List;

import com.ccms.pojo.College;

public interface CollegeDAO extends BaseDAO<College>{
	
	/**
	 * 查询该学院所有的专业
	 * @param id
	 * @return
	 */
	public College querySpecialtys(Integer id);
	
	/**
	 * 查询所有College
	 * @return
	 */
	public List<College> queryAll();
	
}
