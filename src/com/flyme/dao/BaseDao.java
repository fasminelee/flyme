package com.flyme.dao;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.flyme.util.DBPool;

public class BaseDao<T> {
	Class<T> clazz;
	private Connection conn;

	@SuppressWarnings("unchecked")
	public BaseDao() {
		clazz = (Class<T>) ((ParameterizedType) this.getClass().getGenericSuperclass()).getActualTypeArguments()[0];
	}

	public void closeAll(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public int executeUpdate(String preparedSql, Object[] param) {
		PreparedStatement pstmt = null;
		int num = 0;

		try {
			Connection conn = DBPool.getInstance().getConn();
			pstmt = conn.prepareStatement(preparedSql);
			if (param != null) {
				for (int i = 0; i < param.length; i++) {
					pstmt.setObject(i + 1, param[i]);
				}
			}
			num = pstmt.executeUpdate();
			System.out.println("SQL: " +preparedSql+" 参数: " + Arrays.toString(param));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, null);
		}
		return num;
	}

	public List<T> executeQuery(String sql, Object[] param) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<T> list = new ArrayList<T>();
		try {
			conn = DBPool.getInstance().getConn();

			stmt = conn.prepareStatement(sql);
			if (param != null) {
				for (int i = 0; i < param.length; i++) {
					stmt.setObject(1 + i, param[i]);
				}
			}

			rs = stmt.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			int columuCount = rsmd.getColumnCount();//
			while (rs.next()) {
				T t = (T) clazz.newInstance();
				for (int i = 0; i < columuCount; i++) {
					Field f = clazz.getDeclaredField(rsmd.getColumnName(i + 1));
					f.setAccessible(true);
					f.set(t, rs.getObject(i + 1));
				}
				list.add(t);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, stmt, rs);
		}
		return list;
	}
}
