package com.ccms.persistence.pojo;


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
	private String reason;	// 认证/审核不通过原因
	private String applyTime;
	private Float duration; // '加分时长(包括附加分)',
	
	
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

	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	public String getApplyTime() {
		return applyTime;
	}
	public void setApplyTime(String applyTime) {
		this.applyTime = applyTime;
	}

	public Float getDuration() {
		return duration;
	}
	public void setDuration(Float duration) {
		this.duration = duration;
	}
}
