package com.ccms.dao;

import com.ccms.pojo.Student;

public interface StudentDAO extends BaseDAO<Student>{
	/**
	 * 根据学号查询
	 * @param num
	 * @return
	 */
	public Student queryByNum(String num);

}
