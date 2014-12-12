package com.ccms.dao;

import com.ccms.pojo.Student;

public interface StudentDAO {
	
	/**
	 * 添加
	 * @param student
	 * @return
	 */
	public int add(Student student);
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public Student queryById(Integer id);
	
	
	/**
	 * 根据学号查询
	 * @param num
	 * @return
	 */
	public Student queryByNum(String num);

}
