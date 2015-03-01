package com.ccms.dao;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.ccms.persistence.pojo.College;

public class CollegeDAOTest extends BaseTest{

	@Autowired
	private CollegeDAO collegeDAO;

	@Test
	public void testqueryByAccountPwd() {
		
		College college = collegeDAO.queryByAccountPwd("jsjxy", "111");

		System.out.println(college);	
	}
	
	
	@Test
	public void testQuerySpecialtys() {
		College college = collegeDAO.querySpecialtys(1);

		System.out.println(college);
	}

	@Test
	public void testQueryById() {

		College college = collegeDAO.queryById(1);

		System.out.println(college);
	}

	@Test
	public void testQueryAll() {
		
		List<College> colleges = collegeDAO.queryAll();

		for (College college : colleges) {
			System.out.println(college);
		}
	}
	
	@Test
	public void testUpdate() {
	}

	@Test
	public void testAdd() {
	}

}
