package com.ccms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccms.dao.ActivityTypeDAO;
import com.ccms.persistence.pojo.ActivityType;
import com.ccms.service.ActivityTypeService;

@Service
public class ActivityTypeServiceImpl implements ActivityTypeService {
	@Autowired
	private ActivityTypeDAO activityTypeDAO;
	
	@Override
	public List<ActivityType> getAll() {
		
		return activityTypeDAO.list();
	}

	@Override
	public ActivityType getById(Integer id) {
		return activityTypeDAO.queryById(id);
	}
	
	
}
