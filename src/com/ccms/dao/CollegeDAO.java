package com.ccms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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
	
	/**
	 * 根据账号和密码查询
	 * @param account
	 * @param password
	 * @return
	 */
	public College queryByAccountPwd(@Param("account")String account, @Param("pwd")String pwd);
	
}
