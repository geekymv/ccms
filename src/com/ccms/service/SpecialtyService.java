package com.ccms.service;

import com.ccms.persistence.pojo.College;
import com.ccms.persistence.pojo.Specialty;

public interface SpecialtyService {
	
	
	/**
	 * 根据专业名称查询该学院的专业
	 * @param name
	 * @param college
	 * @return
	 */
	public Specialty getByName(String name, College college);
	

}
