package com.ccms.persistence.pojo;


/**
 * 活动类
 * @author Geek_ymv
 */
public class Activity {
	
	private Integer id;
	private String name; /*活动名称*/
	private College college; /*发布单位*/
	private String publishTime; /*发布时间*/
	private String dateTime;	/*活动时间*/
	private String endDate;/*报名截止日期*/
	private String location; /*地点*/
	private String aim; /*目的*/
	private String content; /*活动内容*/
	private ActivityType actType;/*活动加分类型*/
	private SecondLevel secondLevel; /*加分二级分类*/
	private Float duration;  /*活动加分时长*/
	private String actObject; /*参与对象*/
	private Integer number; /*参与人数*/
	private String contact; /*联系人姓名*/ 
	private String phone; /*联系方式*/
	private String assist; /*活动协助人员*/
	private Integer status; /*状态:通过1， 待审核0，未通过-1*/
	private String reason;	// 审核不通过原因
	private String activityUuid;	// 活动uuid
	

	public Activity() {
	}
	public Activity(Integer id) {
		this.id = id;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public College getCollege() {
		return college;
	}
	public void setCollege(College college) {
		this.college = college;
	}
	public String getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(String publishTime) {
		this.publishTime = publishTime;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getAim() {
		return aim;
	}
	public void setAim(String aim) {
		this.aim = aim;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public ActivityType getActType() {
		return actType;
	}
	public void setActType(ActivityType actType) {
		this.actType = actType;
	}
	public SecondLevel getSecondLevel() {
		return secondLevel;
	}
	public void setSecondLevel(SecondLevel secondLevel) {
		this.secondLevel = secondLevel;
	}
	public Float getDuration() {
		return duration;
	}
	public void setDuration(Float duration) {
		this.duration = duration;
	}
	public String getActObject() {
		return actObject;
	}
	public void setActObject(String actObject) {
		this.actObject = actObject;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAssist() {
		return assist;
	}
	public void setAssist(String assist) {
		this.assist = assist;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	public String getActivityUuid() {
		return activityUuid;
	}
	public void setActivityUuid(String activityUuid) {
		this.activityUuid = activityUuid;
	}

}
