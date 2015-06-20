package com.ccms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ccms.base.dao.BaseDAO;
import com.ccms.persistence.pojo.College;

public interface CollegeDAO extends BaseDAO<College>{
	
	/**
	 * 查询该学院所有的专业
	 * @param id
	 * @return
	 */
	public College querySpecialtys(Integer id);
	
	/**
	 * 根据类型查询所有
	 * @return
	 */
	public List<College> queryAllByType(Integer colType);
	
	/**
	 * 查询所有
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
	
	/**
	 * 根据名称查询
	 * @param name
	 * @return
	 */
	public College queryByName(String name);
	
	/**
	 * 根据账号查询
	 * @param account
	 * @return
	 */
	public College queryByAccount(String account);
	
	
	
}
