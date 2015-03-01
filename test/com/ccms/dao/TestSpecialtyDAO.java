package com.ccms.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ccms.persistence.pojo.College;
import com.ccms.persistence.pojo.Specialty;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/beans.xml")
public class TestSpecialtyDAO {

	@Autowired
	private SpecialtyDAO specialtyDAO;
	@Autowired
	private CollegeDAO collegeDAO;

	@Test
	public void testUpdate() {

		Specialty specialty = new Specialty(2, "网络工程");
		int res = specialtyDAO.update(specialty);

		System.out.println(res);

	}

	@Test
	public void testAdd() {
		College college = collegeDAO.queryById(1);

		Specialty specialty = new Specialty("网络工程", college);

		int res = specialtyDAO.add(specialty);

		System.out.println(res);
	}

}
