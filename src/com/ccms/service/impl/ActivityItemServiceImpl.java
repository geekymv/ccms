package com.ccms.service.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccms.dao.ActivityDAO;
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
	private ActivityDAO activityDAO;
//	@Autowired
//	private ActivityItemDAO actItemDAO;
	@Autowired
	private StudentDAO studentDAO;
	@Autowired
	private RankActivityTypeDAO rankActivityTypeDAO;
	@Autowired
	private ActivityItemDAO activityItemDAO;

	@Override
	public String apply(Activity activity, Student student) {
		int activityId = activity.getId();
		
		// 判断学生是否已经报名了
		ActivityItem actItem = activityItemDAO.queryByActIdAndStuId(
				activity.getId(), student.getId());

		if (actItem == null) { // 学生还没有报名
			
			// 判断报名人数是否已满
			Activity act = activityDAO.queryById(activityId);
			int totalNumber = act.getNumber();	// 参与人数
			
			// 计算已报名人数
			int total = activityItemDAO.queryAllActivityItemByActivityId(activityId);
			if(total >= totalNumber) {	// 人数已满 
				return "overflow";
			}
			
			// 根据活动id判断学生报名这类活动活的二级分类是否超过2次
			int times = activityItemDAO.getTotalTimes(student.getId(), activity.getSecondLevel().getId());
			if(times >= 2) {
				return "overtimes";	// 超过两次
			}
			
			actItem = new ActivityItem();
			actItem.setActivity(activity);
			actItem.setStudent(student);
			actItem.setAudit(SysCode.ActivityItem.ACTITEM_AUDIT_WAIT);
			actItem.setApplyTime(DateUtils.getCurrentGaDate());
			actItem.setDuration(activity.getDuration());
			
			int res = activityItemDAO.add(actItem);
			if (res == 1) {
				return "success";
			}else {
				return "fail";
			}
		} else { // 学生已经报名了
			return "applyed";
		}
	}

	@Override
	public boolean isApplyed(Activity activity, Student student) {
		ActivityItem actItem = activityItemDAO.queryByActIdAndStuId(
				activity.getId(), student.getId());

		return actItem == null ? false : true;
	}

	@Override
	public List<ActivityItem> queryAllActivityItem(Integer studentId) {
		return activityItemDAO.queryAllActivityItem(studentId);
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
		
		List<Integer> years = DateUtils.getCurrentYear();
		String yearStr = years.get(0) + "-" + years.get(1);
		Student student = studentDAO.queryByIdAndYear(dto.getStudentId(), yearStr);
		// 获得学生受助等级
		Rank rank = student.getRank();
		
		List<ActivityItemVO> itemVOs = activityItemDAO.queryActivityItemVO(dto.getStudentId(), dto.getStartDate(), dto.getEndDate());
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
	public void auditActivityItem(ActivityItem item) {
		activityItemDAO.auditActivityItem(item);
	}

	@Override
	public String cancel(Integer activityId, Integer studentId) {
		// 判断报名时间是否截止
		String currentDate = DateUtils.getCurrentDate(DateUtils.FORMAT_NORMAL_NO_SIGN);
		// 获取该活动报名截止时间
		String endDate = activityDAO.queryByIdGetEndDate(activityId);
		if(Long.parseLong(currentDate) - Long.parseLong(endDate) >= 0) {	// 报名截止
			return "end";
		} 
		
		activityItemDAO.deleteByActIdAndStuId(activityId, studentId);
		return "success";
	}
}












