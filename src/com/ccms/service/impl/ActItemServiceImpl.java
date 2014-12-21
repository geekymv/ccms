package com.ccms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccms.dao.ActItemDAO;
import com.ccms.pojo.ActItem;
import com.ccms.pojo.Activity;
import com.ccms.pojo.Student;
import com.ccms.service.ActItemService;
import com.ccms.util.Constant;

@Service
public class ActItemServiceImpl implements ActItemService {

	@Autowired
	private ActItemDAO actItemDAO;
	
	@Override
	public boolean apply(Activity activity, Student student) {
		
		//  判断学生是否已经报名了
		ActItem actItem = actItemDAO.queryByActIdAndStuId(activity.getId(), student.getId());
		
		if(actItem == null) { // 学生还没有报名
			actItem = new ActItem();
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
		
		ActItem actItem = actItemDAO.queryByActIdAndStuId(activity.getId(), student.getId());
	
		return actItem == null ? false : true;
	}
}




























