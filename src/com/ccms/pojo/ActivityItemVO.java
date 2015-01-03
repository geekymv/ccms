package com.ccms.pojo;

public class ActivityItemVO {
	/**
	 * 活动类型名称
	 */
	private ActivityType activityType; 

	/**
	 * 已完成的总时长
	 */
	private Integer totalDuration;
	
	/**
	 * 实际应完成总时长
	 */
	private Integer actualDuration;
	
	@Override
	public String toString() {
		return "ActivityItemVO [activityType=" + activityType
				+ ", totalDuration=" + totalDuration + ", actualDuration="
				+ actualDuration + "]";
	}

	public ActivityType getActivityType() {
		return activityType;
	}
	public void setActivityType(ActivityType activityType) {
		this.activityType = activityType;
	}
	public Integer getTotalDuration() {
		return totalDuration;
	}
	public void setTotalDuration(Integer totalDuration) {
		this.totalDuration = totalDuration;
	}
	public Integer getActualDuration() {
		return actualDuration;
	}
	public void setActualDuration(Integer actualDuration) {
		this.actualDuration = actualDuration;
	} 
}
