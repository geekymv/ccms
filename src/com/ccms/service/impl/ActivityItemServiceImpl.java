package com.ccms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccms.dao.ActivityItemDAO;
import com.ccms.dao.RankActivityTypeDAO;
import com.ccms.dao.StudentDAO;
import com.ccms.pojo.Activity;
import com.ccms.pojo.ActivityItem;
import com.ccms.pojo.ActivityItemVO;
import com.ccms.pojo.Rank;
import com.ccms.pojo.RankActivityTypeVO;
import com.ccms.pojo.Student;
import com.ccms.service.ActivityItemService;
import com.ccms.util.Constant;

@Service
public class ActivityItemServiceImpl implements ActivityItemService {

	@Autowired
	private ActivityItemDAO actItemDAO;
	@Autowired
	private StudentDAO studentDAO;
	@Autowired
	private RankActivityTypeDAO rankActivityTypeDAO;

	@Override
	public boolean apply(Activity activity, Student student) {

		// 判断学生是否已经报名了
		ActivityItem actItem = actItemDAO.queryByActIdAndStuId(
				activity.getId(), student.getId());

		if (actItem == null) { // 学生还没有报名
			actItem = new ActivityItem();
			actItem.setActivity(activity);
			actItem.setStudent(student);
			actItem.setAudit(Constant.ACTITEM_AUDIT_WAIT);

			int res = actItemDAO.add(actItem);
			if (res == 1) {
				return true;
			}
		} else { // 学生已经报名了
			return false;
		}

		return false;
	}

	@Override
	public boolean isApplyed(Activity activity, Student student) {

		ActivityItem actItem = actItemDAO.queryByActIdAndStuId(
				activity.getId(), student.getId());

		return actItem == null ? false : true;
	}

	@Override
	public List<ActivityItem> queryAllActivityItem(Integer studentId) {

		return actItemDAO.queryAllActivityItem(studentId);
	}

	@Override
	public List<RankActivityTypeVO> queryRankActivityItemVO(Integer studentId) {
		
		Student student = studentDAO.queryById(studentId);
		// 获得学生受助等级
		Rank rank = student.getRank();
		
		List<ActivityItemVO> itemVOs = actItemDAO.queryActivityItemVO(studentId);
		List<RankActivityTypeVO> rankActivityTypeVOs = rankActivityTypeDAO.queryByRankId(rank.getId());
		
		for (RankActivityTypeVO rankActivityTypeVO : rankActivityTypeVOs) {
			Integer activityTypeId = rankActivityTypeVO.getActivityType().getId();
			for(ActivityItemVO itemVO : itemVOs){
				if(activityTypeId == itemVO.getActivityType().getId()){
					rankActivityTypeVO.setFinishedDuration(itemVO.getFinishedDuration());
				}
			}
		}
		
		return rankActivityTypeVOs;
	}
}












