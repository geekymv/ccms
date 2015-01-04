package com.ccms.dao;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.ccms.pojo.College;

public class TestCollegeDAO extends BaseTest{

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
//
//		College college = new College(3, "zbxy1", "植物保护学院1", "1231", "1234561",
//				"陶老师1", "植保楼1");
//		int res = collegeDAO.update(college);
//		
//		System.out.println(res);

	}

	@Test
	public void testAdd() {
//		College college = new College("zbxy", "植物保护学院", "123", "123456", "陶老师",
//				"植保楼");
//
//		int res = collegeDAO.add(college);
//
//		System.out.println(res == 1);
	}

}
