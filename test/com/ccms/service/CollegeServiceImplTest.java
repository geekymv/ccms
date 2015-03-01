package com.ccms.service;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.ccms.dao.BaseTest;
import com.ccms.persistence.pojo.College;
import com.ccms.service.CollegeService;

public class CollegeServiceImplTest extends BaseTest{

	@Autowired
	private CollegeService collegeService;
	
	@Test
	public void testGetColleges() {
		
		List<College> colleges = collegeService.getColleges();
		
		for (College college : colleges) {
			System.out.println(college);
		}
	}

}
