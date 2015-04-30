package com.ccms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccms.dao.ActivityDAO;
import com.ccms.persistence.dto.Pager;
import com.ccms.persistence.pojo.Activity;
import com.ccms.service.ActivityService;
import com.ccms.util.DateUtils;
import com.ccms.util.SysCode;

@Service
public class ActivityServiceImpl implements ActivityService {

	@Autowired
	private ActivityDAO activityDAO;
	
	@Override
	public Pager<Activity> queryAllStatusByPage(Pager<Activity> pager) {
		int totalRecord = activityDAO.queryTotalRecord(SysCode.ActivityStatus.APPROVED); // 通过审核的总记录数
		pager.setTotalRecord(totalRecord);
		
		List<Activity> activities = activityDAO.queryAllStatusByPage(pager);
		pager.setDatas(activities);
		
		return pager;
	}

	@Override
	public Activity detail(Integer id) {

		return activityDAO.queryById(id);
	}

	@Override
	public int add(Activity activity) {
		activity.setPublishTime(DateUtils.getCurrentGaDate());
		activity.setStatus(SysCode.ActivityStatus.WAIT); 
		return activityDAO.add(activity);
	}

}



















