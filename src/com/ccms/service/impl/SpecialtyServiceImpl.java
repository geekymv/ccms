package com.ccms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccms.dao.SpecialtyDAO;
import com.ccms.persistence.pojo.College;
import com.ccms.persistence.pojo.Specialty;
import com.ccms.service.SpecialtyService;

@Service
public class SpecialtyServiceImpl implements SpecialtyService {

	@Autowired
	private SpecialtyDAO specialtyDAO;
	
	@Override
	public Specialty getByName(String name, College college) {
		
		return specialtyDAO.queryByName(name, college);
	}
	
	/**
	 * 添加专业
	 * @param name
	 * @param college
	 * @return
	 */
	public boolean add(String name, College college) {
		Specialty s = new Specialty();
		s.setCollege(college);
		s.setName(name);
		
		int res = specialtyDAO.add(s);
		
		return res == 1 ? true : false;
	}

	@Override
	public String edit(Specialty specialty) {
		specialtyDAO.update(specialty);
		return "success";
	}

}
