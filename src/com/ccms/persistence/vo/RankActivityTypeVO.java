package com.ccms.persistence.vo;

import com.ccms.persistence.pojo.ActivityType;
import com.ccms.persistence.pojo.Rank;

public class RankActivityTypeVO {
	private Integer id;
	private Rank rank; // 所属等级
	private ActivityType activityType; // 所属活动类型
	private int duration;	// 时长
	/**
	 * 已完成的总时长
	 */
	private Integer finishedDuration = 0;
	
	
	
	@Override
	public String toString() {
		return "RankActivityTypeVO [id=" + id + ", rank=" + rank
				+ ", activityType=" + activityType + ", duration=" + duration
				+ ", finishedDuration=" + finishedDuration + "]";
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getId() {
		return id;
	}
	
	public Rank getRank() {
		return rank;
	}
	public void setRank(Rank rank) {
		this.rank = rank;
	}
	public ActivityType getActivityType() {
		return activityType;
	}
	public void setActivityType(ActivityType activityType) {
		this.activityType = activityType;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public void setFinishedDuration(Integer finishedDuration) {
		this.finishedDuration = finishedDuration;
	}
	public Integer getFinishedDuration() {
		return finishedDuration;
	}

}
