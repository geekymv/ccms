package com.ccms.pojo;

import java.util.Date;

/**
 * 活动类
 * @author Geek_ymv
 */
public class Activity {
	
	private Integer id;
	private String name; /*活动名称*/
	private College college; /*发布单位*/
	private Date publishTime; /*发布时间*/
	private String dateTime;	/*活动时间*/
	private Date endDate;/*报名截止日期*/
	private String location; /*地点*/
	private String aim; /*目的*/
	private String content; /*活动内容*/
	private ActType actType;/*活动加分类型*/
	private Integer duration;  /*活动加分时长*/
	private String actObject; /*参与对象*/
	private Integer number; /*参与人数*/
	private String contact; /*联系人姓名*/ 
	private String phone; /*联系方式*/
	private String assist; /*活动协助人员*/
	private Integer status; /*状态:通过1， 未通过0， 删除-1*/

	public Activity() {
	}
	public Activity(Integer id) {
		this.id = id;
	}
	
	
	@Override
	public String toString() {
		return "Activity [id=" + id + ", name=" + name + ", college=" + college
				+ ", publishTime=" + publishTime + ", dateTime=" + dateTime
				+ ", endDate=" + endDate + ", location=" + location + ", aim="
				+ aim + ", content=" + content + ", actType=" + actType
				+ ", duration=" + duration + ", actObject=" + actObject
				+ ", number=" + number + ", contact=" + contact + ", phone="
				+ phone + ", assist=" + assist + ", status=" + status + "]";
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
	public Date getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
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
	public ActType getActType() {
		return actType;
	}
	public void setActType(ActType actType) {
		this.actType = actType;
	}
	public Integer getDuration() {
		return duration;
	}
	public void setDuration(Integer duration) {
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
}
