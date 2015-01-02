package com.ccms.pojo;

/**
 * 活动报名明细
 * @author Geek_ymv
 */
public class ActivityItem {
	
	private Integer id;
	private Activity activity;
	private Student student;
	private Integer audit; /*审核：认证通过1，等待认证0， 认证不通过-1*/
	
	@Override
	public String toString() {
		return "ActivityItem [id=" + id + ", activity=" + activity + ", audit="
				+ audit + "]";
	}
	
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

}
