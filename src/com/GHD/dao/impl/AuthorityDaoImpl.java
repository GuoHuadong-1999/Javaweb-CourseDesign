package com.GHD.dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.GHD.bean.Authority;
import com.GHD.dao.AuthorityDao;
import com.GHD.util.JDBCUtil;

public class AuthorityDaoImpl implements AuthorityDao {

	@Override
	public Authority selectAuthority(String user) {
		QueryRunner queryRunner = new QueryRunner(JDBCUtil.getDatasource());
		Authority authority = null;
		try {
			authority = queryRunner.query("select * from authority where user= ?",new BeanHandler<Authority>(Authority.class),user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return authority;
	}

	@Override
	public void insertAuthority(String user) {
		try {
			QueryRunner queryRunner = new QueryRunner(JDBCUtil.getDatasource());
			queryRunner.update("insert into authority values(null,?,?)",user,"member");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
