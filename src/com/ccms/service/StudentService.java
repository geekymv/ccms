package com.ccms.service;

import com.ccms.pojo.Student;

public interface StudentService {

	/**
	 * 学生注册
	 * @param student
	 * @return
	 */
	public boolean register(Student student);
	
	/**
	 * 学生登录
	 * @param num
	 * @param pwd
	 * @return
	 */
	public Student login(String num, String pwd);
}
