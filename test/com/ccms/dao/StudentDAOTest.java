package com.ccms.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ccms.dao.StudentDAO;
import com.ccms.pojo.Student;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/beans.xml")
public class StudentDAOTest {

	@Autowired
	private StudentDAO studentDAO;
	public void setStudentDAO(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
	}
	
	@Test
	public void testQueryByNumAndPwd() {
		
		Student student = studentDAO.queryByNumAndPwd("11", "123");
		
		System.out.println(student);
	}
	
	
	@Test
	public void testQueryById() {
		
		Student student = studentDAO.queryById(1);
		
		System.out.println(student);
	}
	
	@Test
	public void testQueryByNum() {
		
		Student student = studentDAO.queryByNum("11");
		
		System.out.println(student);
	}
	
}
