package com.ccms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccms.dao.CollegeDAO;
import com.ccms.pojo.College;
import com.ccms.pojo.Specialty;
import com.ccms.service.CollegeService;

@Service
public class CollegeServiceImpl implements CollegeService {

	@Autowired
	private CollegeDAO collegeDAO;
	
	@Override
	public List<College> getColleges() {
		
		return collegeDAO.queryAll();
	}

	@Override
	public List<Specialty> getSpecialties(Integer collegeId) {
		
		return collegeDAO.querySpecialtys(collegeId).getSpecialties();
	}

}
