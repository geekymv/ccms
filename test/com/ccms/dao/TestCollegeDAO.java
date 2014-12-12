package com.ccms.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ccms.pojo.College;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/beans.xml")
public class TestCollegeDAO {

	@Autowired
	private CollegeDAO collegeDAO;

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
	public void testUpdate() {

		College college = new College(3, "zbxy1", "植物保护学院1", "1231", "1234561",
				"陶老师1", "植保楼1");
		int res = collegeDAO.update(college);
		
		System.out.println(res);

	}

	@Test
	public void testAdd() {
		College college = new College("zbxy", "植物保护学院", "123", "123456", "陶老师",
				"植保楼");

		int res = collegeDAO.add(college);

		System.out.println(res == 1);
	}

}
