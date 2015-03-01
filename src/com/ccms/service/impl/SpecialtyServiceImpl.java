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

}
