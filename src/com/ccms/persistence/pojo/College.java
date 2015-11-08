package com.ccms.persistence.pojo;

import java.util.List;

/**
 * 管理员、学院、社团等单位
 * @author Geek_ymv
 */
public class College {
	
	private Integer id;
	private String account;
	private Integer authority; // 权限：1管理员，0一般用户
	private String name;
	private String pwd;
	private String phone;
	private String contact;
	private String address;
	private Integer colType; // 类型：1勤管中心，2学院， 3社团
	
	private List<Specialty> specialties;
	
	public College() {
	}
	
	public College(Integer id) {
		this.id = id;
	}
	
	public College(Integer id, String name) {
		this.id = id;
		this.name = name;
	}
	
	
	
	@Override
	public String toString() {
		return "College [id=" + id + ", account=" + account + ", authority="
				+ authority + ", name=" + name + ", pwd=" + pwd + ", phone="
				+ phone + ", contact=" + contact + ", address=" + address
				+ ", colType=" + colType + ", specialties=" + specialties + "]";
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public void setAuthority(Integer authority) {
		this.authority = authority;
	}
	public Integer getAuthority() {
		return authority;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public List<Specialty> getSpecialties() {
		return specialties;
	}
	public void setSpecialties(List<Specialty> specialties) {
		this.specialties = specialties;
	}
	public Integer getColType() {
		return colType;
	}
	public void setColType(Integer colType) {
		this.colType = colType;
	}
}
