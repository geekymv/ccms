package com.ccms.pojo;

import java.util.List;

/**
 * 学院类
 * @author Geek_ymv
 */
public class College {
	
	private Integer id;
	private String account;
	private String name;
	private String pwd;
	private String phone;
	private String contact;
	private String address;
	
	private List<Specialty> specialties;
	
	public College() {
	}
	public College(String account, String name, String pwd,
			String phone, String contact, String address) {
		this.account = account;
		this.name = name;
		this.pwd = pwd;
		this.phone = phone;
		this.contact = contact;
		this.address = address;
	}

	public College(Integer id, String account, String name, String pwd,
			String phone, String contact, String address) {
		this(account, name, pwd, phone, contact, address);
		this.id = id;
	}

	@Override
	public String toString() {
		return "College [id=" + id + ", account=" + account + ", name=" + name
				+ ", pwd=" + pwd + ", phone=" + phone + ", contact=" + contact
				+ ", address=" + address + ", specialties=" + specialties + "]";
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
	
	
}
