package com.ccms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccms.dao.ActivityItemDAO;
import com.ccms.pojo.ActivityItem;
import com.ccms.pojo.Activity;
import com.ccms.pojo.Student;
import com.ccms.service.ActivityItemService;
import com.ccms.util.Constant;

@Service
public class ActivityItemServiceImpl implements ActivityItemService {

	@Autowired
	private ActivityItemDAO actItemDAO;
	
	@Override
	public boolean apply(Activity activity, Student student) {
		
		//  判断学生是否已经报名了
		ActivityItem actItem = actItemDAO.queryByActIdAndStuId(activity.getId(), student.getId());
		
		if(actItem == null) { // 学生还没有报名
			actItem = new ActivityItem();
			actItem.setActivity(activity);
			actItem.setStudent(student);
			actItem.setAudit(Constant.ACTITEM_AUDIT_WAIT);
			
			int res = actItemDAO.add(actItem);
			if(res == 1) {
				return true;
			}
		} else { // 学生已经报名了
			return false;
		}
		
		return false;
	}

	
	@Override
	public boolean isApplyed(Activity activity, Student student) {
		
		ActivityItem actItem = actItemDAO.queryByActIdAndStuId(activity.getId(), student.getId());
	
		return actItem == null ? false : true;
	}


	@Override
	public List<ActivityItem> queryAllActivityItem(Integer studentId) {

		return actItemDAO.queryAllActivityItem(studentId);
	}
}




























