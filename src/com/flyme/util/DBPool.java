package com.flyme.util;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class DBPool {
	private static DBPool db = null;
	private DataSource ds =new ComboPooledDataSource("mysqlConnection");
	public static DBPool getInstance(){
		if(null==db){
			db=new DBPool();
		}
		return db;
	}
	
	public Connection getConn(){
		try {
			return ds.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Test
	public void test() throws Exception {
		Connection conn = DBPool.getInstance().getConn();
		if (null!=conn) {
			System.out.println("数据库连接正常" + conn);
		}
	}

}
