package com.ccms.service;

import java.util.List;

import com.ccms.persistence.pojo.College;
import com.ccms.persistence.pojo.Specialty;

public interface SpecialtyService {
	/**
	 * 根据学院id查询该学院的专业
	 * @param collegeId
	 * @return
	 */
	public List<Specialty> getAllByCollegeId(Integer collegeId);
	
	/**
	 * 根据专业名称查询该学院的专业
	 * @param name
	 * @param college
	 * @return
	 */
	public Specialty getByName(String name, College college);
	
	/**
	 * 添加专业
	 * @param name
	 * @param college
	 * @return
	 */
	public boolean add(String name, College college);
	
	/**
	 * 修改专业名称
	 * @param specialty
	 * @return
	 */
	public String edit(Specialty specialty);
}
