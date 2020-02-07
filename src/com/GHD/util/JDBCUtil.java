package com.GHD.util;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JDBCUtil {
	static ComboPooledDataSource dataSource = null;
	static {
		dataSource = new ComboPooledDataSource(); 
	}
	public static DataSource getDatasource(){
		return dataSource;
	}
}
