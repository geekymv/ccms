package com.ccms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccms.dao.ActItemDAO;
import com.ccms.pojo.ActItem;
import com.ccms.service.ActItemService;
import com.ccms.util.Constant;

@Service
public class ActItemServiceImpl implements ActItemService {

	@Autowired
	private ActItemDAO actItemDAO;
	
	@Override
	public boolean apply(Integer activityId, Integer studentId) {
		
		//  判断学生是否已经报名了
		ActItem actItem = actItemDAO.queryByActIdAndStuId(activityId, studentId);
		
		if(actItem == null) { // 学生还没有报名
			actItem = new ActItem();
//			actItem.setActivity(activity);
//			actItem.setStudent(student);
			actItem.setAudit(Constant.ACTITEM_AUDIT_WAIT);
			
			int res = actItemDAO.add(actItem);
			if(res == 1) {
				return true;
			}
			return false;
			
		} else { // 学生已经报名了
			return false;
		}
	}
}
