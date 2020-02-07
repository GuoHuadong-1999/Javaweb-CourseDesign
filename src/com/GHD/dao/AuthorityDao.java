package com.GHD.dao;

import com.GHD.bean.Authority;

public interface AuthorityDao {
	public Authority selectAuthority(String user);
	public void insertAuthority(String user);
}
