package com.ccms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccms.dao.ActivityDAO;
import com.ccms.persistence.pojo.Activity;
import com.ccms.persistence.pojo.Pager;
import com.ccms.service.ActivityService;

@Service("activityService")
public class ActivityServiceImpl implements ActivityService {

	@Autowired
	private ActivityDAO activityDAO;
	
	@Override
	public Pager<Activity> queryAllStatusByPage(int pageOffset, int pageSize) {
		
		Pager<Activity> pager = new Pager<Activity>();

		int totalRecord = activityDAO.totalRecord(); // 总记录数
		int totalPage = totalRecord % pageSize == 0 ? 
				totalRecord / pageSize : totalRecord / pageSize + 1; // 总页数
		pager.setTotalRecord(totalRecord);
		pager.setTotalPage(totalPage);
		
		List<Activity> activities = activityDAO.queryAllStatusByPage(pageOffset, pageSize);
		pager.setDatas(activities);
		
		return pager;
	}

	@Override
	public Activity detail(Integer id) {

		return activityDAO.queryById(id);
	}

}



















