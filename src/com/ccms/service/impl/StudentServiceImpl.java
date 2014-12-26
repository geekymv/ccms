package com.ccms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccms.dao.StudentDAO;
import com.ccms.pojo.Student;
import com.ccms.service.StudentService;

@Service("studentService")
public class StudentServiceImpl implements StudentService {
	
	@Autowired
	private StudentDAO studentDAO;
	public void setStudentDAO(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
	}
	
	
	@Override
	public boolean register(Student student) {
		return false;
	}


	@Override
	public Student login(String num, String pwd) {

		return studentDAO.queryByNumAndPwd(num, pwd);
	}


	@Override
	public Student getInfo(String num) {
		
		return studentDAO.queryByNum(num);
	}

}
