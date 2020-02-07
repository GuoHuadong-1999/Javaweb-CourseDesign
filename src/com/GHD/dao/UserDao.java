package com.GHD.dao;

import java.util.List;

import com.GHD.bean.User;

public interface UserDao {
	public void register(String user,String password,String mailbox);
	public boolean userCheck(String user);
	public boolean mailBoxCheck(String mailbox);
	public boolean login(String user,String password);
	public User selectUserMessages(String user);
	public void updateUserMessages(String user,String sex,String address, String userImgName);
	public void updateUserMessages(String user,String sex,String address);
	public User selectUserMessagesByMailBox(String mailBox);
	public void updatePassword(String user,String password);
}
