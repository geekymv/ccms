package com.ccms.service;

import java.util.List;

import com.ccms.persistence.pojo.ActivityType;


public interface ActivityTypeService {
	
	public List<ActivityType> getAll();
	
	public ActivityType getById(Integer id);
}
