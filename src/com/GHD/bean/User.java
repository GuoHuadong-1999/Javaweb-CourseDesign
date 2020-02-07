package com.GHD.bean;

public class User {
	private String id = null;
	private String user = null;
	private String password = null;
	private String mailbox = null;
	private String sex = null;
	private String address = null;
	private String userImgName = null;
	public String getUserImgName() {
		return userImgName;
	}
	public void setUserImgName(String userImgName) {
		this.userImgName = userImgName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMailbox() {
		return mailbox;
	}
	public void setMailbox(String mailbox) {
		this.mailbox = mailbox;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", user=" + user + ", password=" + password + ", mailbox=" + mailbox + ", sex=" + sex
				+ ", address=" + address + ", userImgName=" + userImgName + "]";
	}
	
	
}
