package com.ccms.persistence.pojo;

/**
 * 学生类
 * @author Geek_ymv
 */
public class Student {

	public Student(String num, String pwd, String name, String gender,
			String year, Rank rank, College college, Specialty specialty,
			Integer status) {
		this.num = num;
		this.pwd = pwd;
		this.name = name;
		this.gender = gender;
		this.year = year;
		this.rank = rank;
		this.college = college;
		this.specialty = specialty;
		this.status = status;
	}
	
	public Student(String num, String pwd, String name, String gender,
			String year, Rank rank, College college,
			Integer status) {
		this.num = num;
		this.pwd = pwd;
		this.name = name;
		this.gender = gender;
		this.year = year;
		this.rank = rank;
		this.college = college;
		this.status = status;
	}
	
	/**
	 * id
	 */
	private Integer id;
	
	/**
	 * 学号
	 */
	private String num;
	
	/**
	 * 密码
	 */
	private String pwd;
	
	/**
	 * 姓名
	 */
	private String name;
	
	/**
	 * 性别
	 */
	private String gender;
	
	/**
	 * 联系方式
	 */
	private String phone;
	
	/**
	 * 邮箱
	 */
	private String email;
	
	/**
	 * qq
	 */
	private String qq;
	
	/**
	 * 个人简介
	 */
	private String introduce;
	
	/**
	 * 学年（每年的9月1号到第二年的7月1号为一学年）
	 */
	private String year;
	
	/**
	 * 学生受助等级：甲乙丙
	 */
	private Rank rank;
	
	/**
	 * 学院
	 */
	private College college;
	
	/**
	 * 专业
	 */
	private Specialty specialty;
	
	/**
	 * 学生状态（1可用，0不可用）
	 */
	private Integer status;
	
	
	public Student() {
	}
	
	@Override
	public String toString() {
		return "Student [id=" + id + ", num=" + num + ", pwd=" + pwd
				+ ", name=" + name + ", gender=" + gender + ", phone=" + phone
				+ ", email=" + email + ", qq=" + qq + ", introduce="
				+ introduce + ", status=" + status + ", year=" + year
				+ ", rank=" + rank + ", college=" + college + ", specialty="
				+ specialty + "]";
	}


	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public void setRank(Rank rank) {
		this.rank = rank;
	}
	public Rank getRank() {
		return rank;
	}
	public College getCollege() {
		return college;
	}
	public void setCollege(College college) {
		this.college = college;
	}
	public Specialty getSpecialty() {
		return specialty;
	}
	public void setSpecialty(Specialty specialty) {
		this.specialty = specialty;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getStatus() {
		return status;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
}
