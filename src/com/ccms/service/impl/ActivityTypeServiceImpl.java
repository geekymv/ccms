package com.ccms.service.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
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

	@Override
	public String setCategory(ActivityType type) {
		String name = type.getName();
		if(StringUtils.isBlank(name)) {
			return "notNull";
		}
		
		if(null != activityTypeDAO.queryByName(name)) {
			return "exist";	// 已存在
		}
		int res = activityTypeDAO.setCategory(type);
		
		return res == 1 ? "success" : "fail";
	
	}
	
	
}
