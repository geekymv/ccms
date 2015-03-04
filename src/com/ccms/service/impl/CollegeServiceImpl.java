package com.ccms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccms.dao.CollegeDAO;
import com.ccms.persistence.pojo.College;
import com.ccms.persistence.pojo.Specialty;
import com.ccms.service.CollegeService;
import com.ccms.util.SysCode;

@Service
public class CollegeServiceImpl implements CollegeService {

	@Autowired
	private CollegeDAO collegeDAO;
	
	@Override
	public List<College> getColleges() {
		
		return collegeDAO.queryAllByType(SysCode.COLTYPE_COLLEGE);
	}

	@Override
	public List<Specialty> getSpecialties(Integer collegeId) {
		College college = collegeDAO.querySpecialtys(collegeId);
		if(college == null){ // 该学院暂时没有专业
			return null;
		}
		List<Specialty> specialties = college.getSpecialties();
		
		return specialties;
	}

	@Override
	public College login(String account, String pwd) {
		return collegeDAO.queryByAccountPwd(account, pwd);
	}

	@Override
	public College getById(Integer id) {
		return collegeDAO.queryById(id);
	}

	@Override
	public int update(College college) {
		return collegeDAO.update(college);
	}

}
