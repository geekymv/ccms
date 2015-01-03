package com.ccms.pojo;

public class ActivityItemVO {
	/**
	 * 活动类型名称
	 */
	private ActivityType activityType; 

	/**
	 * 已完成的总时长
	 */
	private Integer finishedDuration;
	
	public ActivityType getActivityType() {
		return activityType;
	}
	public void setActivityType(ActivityType activityType) {
		this.activityType = activityType;
	}
	public Integer getFinishedDuration() {
		return finishedDuration;
	}
	public void setFinishedDuration(Integer finishedDuration) {
		this.finishedDuration = finishedDuration;
	}
}
