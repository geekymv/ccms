package com.ccms.service;

import java.util.List;

import com.ccms.persistence.pojo.College;
import com.ccms.persistence.pojo.Specialty;

public interface CollegeService {
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public College getById(Integer id);
	
	/**
	 * 查询所有学院
	 * @return
	 */
	public List<College> getColleges();
	
	/**
	 * 获得该学院所有专业
	 * @param collegeId
	 * @return
	 */
	public List<Specialty> getSpecialties(Integer collegeId);
	
	/**
	 * 登录
	 * @param account
	 * @param pwd
	 * @return
	 */
	public College login(String account, String pwd);
}
