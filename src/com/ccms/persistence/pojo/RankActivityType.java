package com.ccms.persistence.pojo;

/**
 * 中间实体类
 *
 * 甲等-60
 * 	劳务类 18-30小时
 * 	实践类 18-30小时
 * 	文体类 12-18小时
 * 
 * 乙等-40
 *	劳务类 12-20小时
 *	实践类 12-20小时
 * 	文体类 8-12小时
 * 
 * 丙等-20
 *	劳务类 6-10小时
 *	实践类 6-10小时
 * 	文体类 4-6小时
 * 
 * @author Geek_ymv
 */
public class RankActivityType {
	
	private Integer id;
	private Rank rank; // 所属等级
	private ActivityType activityType; // 所属活动类型
	private int beginDuration;	// 开始时长
	private int endDuration;	// 结束时长
	

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	
	public int getBeginDuration() {
		return beginDuration;
	}
	public void setBeginDuration(int beginDuration) {
		this.beginDuration = beginDuration;
	}
	public int getEndDuration() {
		return endDuration;
	}
	public void setEndDuration(int endDuration) {
		this.endDuration = endDuration;
	}
	

}
