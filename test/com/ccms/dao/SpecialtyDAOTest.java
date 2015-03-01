package com.ccms.dao;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.ccms.persistence.pojo.College;
import com.ccms.persistence.pojo.Specialty;

public class SpecialtyDAOTest extends BaseTest {

	@Autowired
	private SpecialtyDAO specialtyDAO;
	
	@Test
	public void testQueryByName() {
		
		Specialty specialty = specialtyDAO.queryByName("网络工程", new College(4));
		
		System.out.println(specialty);
	}

}
