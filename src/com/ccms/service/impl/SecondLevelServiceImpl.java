package com.ccms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccms.dao.SecondLevelDAO;
import com.ccms.persistence.pojo.SecondLevel;
import com.ccms.service.SecondLevelService;

@Service
public class SecondLevelServiceImpl implements SecondLevelService {
	@Autowired
	private SecondLevelDAO secondLevelDAO;
	
	@Override
	public List<SecondLevel> listAll(Integer superiorId) {
		return secondLevelDAO.listAll(superiorId);
	}

	@Override
	public String update(SecondLevel secondLevel) {
		SecondLevel level = secondLevelDAO.queryByName(secondLevel.getName());
		if(level != null) {
			return "isexist";
		}
		int res = secondLevelDAO.update(secondLevel);
		return res == 1 ? "success" : "fail";
	}

}
