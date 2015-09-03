package com.ccms.android.rest;

import com.ccms.persistence.dto.StudentDto;
import com.ccms.persistence.pojo.Student;


public interface StudentRestService {
	
	/**
	 * 学生登录
	 * @param studentDto
	 * @return
	 */
	public Student login(StudentDto studentDto);
	
}
