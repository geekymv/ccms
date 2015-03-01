package com.ccms.dao;

import org.apache.ibatis.annotations.Param;

import com.ccms.base.dao.BaseDAO;
import com.ccms.persistence.pojo.Student;

public interface StudentDAO extends BaseDAO<Student>{
	/**
	 * 根据学号查询
	 * @param num
	 * @return
	 */
	public Student queryByNum(String num);
	
	/**
	 * 根据学号和密码查询
	 * @param num
	 * @param pwd
	 * @return
	 */
	public Student queryByNumAndPwd(@Param("num")String num, @Param("pwd")String pwd);

}
