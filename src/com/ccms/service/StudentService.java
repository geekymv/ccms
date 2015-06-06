package com.ccms.service;

import com.ccms.persistence.dto.Pager;
import com.ccms.persistence.dto.StudentDto;
import com.ccms.persistence.dto.StudentQueryDto;
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
	
	/**
	 * 更新部分信息
	 * @param student
	 * @return
	 */
	public String updatePartInfo(Student student);
	
	/**
	 * 根据活动id查看报名学生
	 * @param actId
	 * @return
	 */
	public Pager<StudentDto> findStudentByActivityId(Pager<StudentDto> pager, Integer actId);
	
	/**
	 * 根据学院id查看学生
	 * @param pager
	 * @param colId
	 * @return
	 */
	public Pager<Student> findStudentsByColId(Pager<Student> pager, StudentQueryDto dto, Integer colId);
	
}





















