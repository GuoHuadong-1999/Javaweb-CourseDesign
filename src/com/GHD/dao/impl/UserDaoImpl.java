package com.GHD.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.GHD.bean.User;
import com.GHD.dao.UserDao;
import com.GHD.util.JDBCUtil;
import com.mchange.v2.c3p0.ComboPooledDataSource;

public class UserDaoImpl implements UserDao{
	public void register(String user, String password, String mailbox) {
		try {
			QueryRunner queryRunner = new QueryRunner(JDBCUtil.getDatasource());
			queryRunner.update("insert into user values(null,?,?,?,null,null,'/goods/userImg/fault.png')",user,password,mailbox);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean userCheck(String user) {
		Long result = null;
		try {
			QueryRunner queryRunner = new QueryRunner(JDBCUtil.getDatasource());
			result = (Long) queryRunner.query("select count(*) from user where user = ?",user,new ScalarHandler());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(result.intValue()==1) {
			return false;
		}else {
			return true;
		}
	}

	public boolean mailBoxCheck(String mailbox) {
		Long result = null;
		try {
			QueryRunner queryRunner = new QueryRunner(JDBCUtil.getDatasource());
			result = (Long) queryRunner.query("select count(*) from user where mailbox = ?",mailbox,new ScalarHandler());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(result.intValue()==1) {
			return false;
		}else {
			return true;
		}
	}

	public boolean login(String user, String password) {
		Long result = null;
		try {
			QueryRunner queryRunner = new QueryRunner(JDBCUtil.getDatasource());
			result = (Long) queryRunner.query("select count(*) from user where user = ? and password = ?",new ScalarHandler(),user,password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(result.intValue());
		if(result.intValue()==1) {
			return true;
		}else {
			return false;
		}
	}

	public User selectUserMessages(String user) {
		QueryRunner queryRunner = new QueryRunner(JDBCUtil.getDatasource());
		User userMessages = null;
		try {
			userMessages = queryRunner.query("select * from user where user=?",new BeanHandler<User>(User.class),user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userMessages;
	}

	public void updateUserMessages(String user, String sex, String address, String userImgName) {
		try {
			QueryRunner queryRunner = new QueryRunner(JDBCUtil.getDatasource());
			queryRunner.update("UPDATE user SET sex = ?,address = ?,userImgName = ? WHERE user = ? ",sex,address,userImgName,user);
			System.out.println("更新了");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void updateUserMessages(String user, String sex, String address) {
		try {
			QueryRunner queryRunner = new QueryRunner(JDBCUtil.getDatasource());
			queryRunner.update("UPDATE user SET sex = ?,address = ? WHERE user = ? ",sex,address,user);
			System.out.println("更新了");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public User selectUserMessagesByMailBox(String mailBox) {
		QueryRunner queryRunner = new QueryRunner(JDBCUtil.getDatasource());
		User userMessages = null;
		try {
			userMessages = queryRunner.query("select * from user where mailBox=?",new BeanHandler<User>(User.class),mailBox);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userMessages;
	}

	public void updatePassword(String user, String password) {
		try {
			QueryRunner queryRunner = new QueryRunner(JDBCUtil.getDatasource());
			queryRunner.update("UPDATE user SET password = ? WHERE user = ? ",password,user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
