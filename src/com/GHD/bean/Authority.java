package com.GHD.bean;

public class Authority {
	private String user = null;
	private String authority = null;
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	@Override
	public String toString() {
		return "Authority [user=" + user + ", authority=" + authority + "]";
	}
	
}
