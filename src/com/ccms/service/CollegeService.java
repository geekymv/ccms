package com.ccms.service;

import java.util.List;

import com.ccms.pojo.College;
import com.ccms.pojo.Specialty;

public interface CollegeService {
	/**
	 * 查询所有College
	 * @return
	 */
	public List<College> getColleges();
	
	/**
	 * 获得该学院所有专业
	 * @param collegeId
	 * @return
	 */
	public List<Specialty> getSpecialties(Integer collegeId);
}
