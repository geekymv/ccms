package com.ccms.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccms.dao.ActivityItemDAO;
import com.ccms.dao.RankActivityTypeDAO;
import com.ccms.dao.StudentDAO;
import com.ccms.persistence.dto.ActivityItemDto;
import com.ccms.persistence.pojo.Activity;
import com.ccms.persistence.pojo.ActivityItem;
import com.ccms.persistence.pojo.Rank;
import com.ccms.persistence.pojo.Student;
import com.ccms.persistence.vo.ActivityItemVO;
import com.ccms.persistence.vo.RankActivityTypeVO;
import com.ccms.service.ActivityItemService;
import com.ccms.util.DateUtils;
import com.ccms.util.SysCode;

@Service
public class ActivityItemServiceImpl implements ActivityItemService {

	@Autowired
	private ActivityItemDAO actItemDAO;
	@Autowired
	private StudentDAO studentDAO;
	@Autowired
	private RankActivityTypeDAO rankActivityTypeDAO;
	@Autowired
	private ActivityItemDAO activityItemDAO;

	@Override
	public boolean apply(Activity activity, Student student) {

		// 判断学生是否已经报名了
		ActivityItem actItem = actItemDAO.queryByActIdAndStuId(
				activity.getId(), student.getId());

		if (actItem == null) { // 学生还没有报名
			actItem = new ActivityItem();
			actItem.setActivity(activity);
			actItem.setStudent(student);
			actItem.setAudit(SysCode.ActivityItem.ACTITEM_AUDIT_WAIT);
			actItem.setRecordTime(new Date());
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
	public List<RankActivityTypeVO> queryRankActivityItemVO(ActivityItemDto dto) {
		String startDate = dto.getStartDate();
		String endDate = dto.getEndDate();
		
		if(StringUtils.isBlank(startDate) || StringUtils.isBlank(endDate)) {
			List<String> years = DateUtils.getCurrentXueNian();
			dto.setStartDate(years.get(0));
			dto.setEndDate(years.get(1));
		}
		
		Student student = studentDAO.queryById(dto.getStudentId());
		// 获得学生受助等级
		Rank rank = student.getRank();
		
		List<ActivityItemVO> itemVOs = actItemDAO.queryActivityItemVO(dto.getStudentId(), dto.getStartDate(), dto.getEndDate());
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

	@Override
	public void auditActivityItem(Integer itemId, Integer status) {
		activityItemDAO.auditActivityItem(itemId, status);
	}
}












