package com.ccms.persistence.pojo;

import java.util.Date;

/**
 * 活动报名明细
 * @author Geek_ymv
 */
public class ActivityItem {
	
	private Integer id;
	private Activity activity;
	private Student student;
	/**
	 * 审核：
	 * 等待举办单位认证0， 举办单位认证通过1， 举办单位认证未通过-1，
	 * 等待勤管中心认证1， 勤管中心认证通过2， 勤管中心未通过3，
	 */
	private Integer audit;
	private Date recordTime;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Activity getActivity() {
		return activity;
	}
	public void setActivity(Activity activity) {
		this.activity = activity;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Integer getAudit() {
		return audit;
	}
	public void setAudit(Integer audit) {
		this.audit = audit;
	}
	public Date getRecordTime() {
		return recordTime;
	}
	public void setRecordTime(Date recordTime) {
		this.recordTime = recordTime;
	}
	
}
