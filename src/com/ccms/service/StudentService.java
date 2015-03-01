package com.ccms.service;

import com.ccms.persistence.pojo.Student;

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
	
	/**
	 * 根据学生学号获得学生个人信息
	 * @param num
	 * @return
	 */
	public Student getInfo(String num);
	
	/**
	 * 更新学生信息
	 * @param student
	 * @return
	 */
	public boolean updateInfo(Student student);
}





















