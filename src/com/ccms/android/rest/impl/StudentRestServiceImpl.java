package com.ccms.android.rest.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.ccms.android.rest.StudentRestService;
import com.ccms.persistence.dto.StudentDto;
import com.ccms.persistence.pojo.Student;
import com.ccms.service.StudentService;

public class StudentRestServiceImpl implements StudentRestService {

	@Autowired
	private StudentService studentService;
	
	@Override
	public Student login(StudentDto studentDto) {
		return studentService.login(studentDto.getNum(), studentDto.getPwd());
	}

}
