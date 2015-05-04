package com.ccms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccms.dao.ActivityDAO;
import com.ccms.persistence.dto.Pager;
import com.ccms.persistence.pojo.Activity;
import com.ccms.persistence.pojo.College;
import com.ccms.service.ActivityService;
import com.ccms.util.DateUtils;
import com.ccms.util.SysCode;

@Service
public class ActivityServiceImpl implements ActivityService {

	@Autowired
	private ActivityDAO activityDAO;
	
	@Override
	public Pager<Activity> findAllStatusByPage(Pager<Activity> pager) {
		int totalRecord = activityDAO.queryTotalRecord(SysCode.ActivityStatus.APPROVED); // 通过审核的总记录数
		pager.setTotalRecord(totalRecord);
		
		pager.setPageOffset(pager.getPageIndex(), pager.getPageSize());
		
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
		
		String endDate = activity.getEndDate();
		endDate = endDate.replaceAll("-", "") + "240000"; 
		activity.setEndDate(endDate);
		
		return activityDAO.add(activity);
	}

	@Override
	public Pager<Activity> findAllByPage(Pager<Activity> pager) {
		int totalRecord = activityDAO.totalRecord();
		pager.setTotalRecord(totalRecord);
		
		pager.setPageOffset(pager.getPageIndex(), pager.getPageSize());
		
		List<Activity> activities = activityDAO.queryAllByPage(pager);
		pager.setDatas(activities);
		
		return pager;
	}

	@Override
	public String isPastDut(Integer actId) {
		// 判断招聘信息是否到截止日期了
		String endDate = activityDAO.queryByIdGetEndDate(actId);
		String nowDate = DateUtils.getCurrentGaDate();
		long e = Long.valueOf(endDate);
		long n = Long.valueOf(nowDate);
		if(e < n) {
			return "isPastDue";	// 过期
		}
		
		return "notPastDue";
	}

	@Override
	public String aduitActivity(Integer actId, Integer status) {
		int res = activityDAO.aduitActivity(actId, status);
		return res == 1 ? "success" : "fail";
	}

	@Override
	public Pager<Activity> findAllByPage(Pager<Activity> pager, College college) {
		int totalRecord = activityDAO.getTotalRecordByCollege(college);
		pager.setTotalRecord(totalRecord );
		
		List<Activity> activities = activityDAO.queryAllByPageAndCollege(pager, college);
		pager.setDatas(activities);
		
		return pager;
	}

	@Override
	public String updateActivity(Activity activity) {
		
		String endDate = activity.getEndDate();
		endDate = endDate.replaceAll("-", "") + "240000"; 
		activity.setEndDate(endDate);
		
		int res = activityDAO.update(activity);
		return res == 1 ? "success" : "fail";
	}

}


















 
