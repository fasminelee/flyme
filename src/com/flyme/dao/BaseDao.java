package com.flyme.dao;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.flyme.util.DBPool;

public class BaseDao<T> {
	Class<T> clazz;
	Connection conn = null;
	// 反射获得clazz
	@SuppressWarnings("unchecked")
	public BaseDao() {
		clazz = (Class<T>) ((ParameterizedType) this.getClass().getGenericSuperclass()).getActualTypeArguments()[0];
	}

	// 关闭所有链接
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


	public int executeUpdateCon(Connection con ,String sql, Object[] param) {
		PreparedStatement pstmt = null;
		int num = 0;
		try {
			conn =con;
			pstmt = conn.prepareStatement(sql);
			if (param != null) {
				for (int i = 0; i < param.length; i++) {
					pstmt.setObject(i + 1, param[i]);
				}
			}
			num = pstmt.executeUpdate();
			printSql(sql, param);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(null, pstmt, null);
		}
		return num;
	}
	public int executeUpdate(String sql, Object[] param) {
		
		PreparedStatement pstmt = null;
		int num = 0;

		try {
			conn = DBPool.getInstance().getConn();
			pstmt = conn.prepareStatement(sql);
			if (param != null) {
				for (int i = 0; i < param.length; i++) {
					pstmt.setObject(i + 1, param[i]);
				}
			}
			num = pstmt.executeUpdate();
			printSql(sql, param);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, null);
		}
		return num;
	}

	// 执行预编译DQL语句
	public List<T> executeQuery(String sql, Object[] param) {
		PreparedStatement stat = null;
		ResultSet rs = null;
		List<T> list = new ArrayList<T>();
		try {
			conn = DBPool.getInstance().getConn();
			stat = conn.prepareStatement(sql);
			if (param != null) {
				for (int i = 0; i < param.length; i++) {
					stat.setObject(i + 1, param[i]);
				}
			}
			rs = stat.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			int columuCount = rsmd.getColumnCount();
			while (rs.next()) {
				T t = (T) clazz.newInstance();
				for (int i = 0; i < columuCount; i++) {
					Field f = clazz.getDeclaredField(rsmd.getColumnName(i + 1));
					f.setAccessible(true);
					f.set(t, rs.getObject(i + 1));
				}
				list.add(t);
			}
			printSql(sql, param);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, stat, null);
		}
		return list;
	}

	// 执行无条件sql语句（分页使用）
	public List<T> executeQuery(String sql) {
		PreparedStatement stat = null;
		ResultSet rs = null;
		List<T> list = new ArrayList<T>();
		try {
			conn = DBPool.getInstance().getConn();
			stat = conn.prepareStatement(sql);
			rs = stat.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			int columuCount = rsmd.getColumnCount();
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
			closeAll(conn, stat, null);
		}
		return list;
	}

	// 获得所有记录条数(分页使用)
	public int executeQueryCount(String sql) {
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn = DBPool.getInstance().getConn();
			stat = conn.prepareStatement(sql);
			rs = stat.executeQuery();
			if (rs.next())
				return rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, stat, null);
		}
		return 0;
	}

	// 输出预编译的sql语句的具体内容(便于调试)
	private void printSql(String sql, Object[] params) {
		StringBuffer sb = new StringBuffer(sql);
		int fromIndex = 0;
		if (params != null) {
			for (int i = 0; i < params.length; i++) {
				int index = sb.indexOf("?", fromIndex);
				if (index == -1) {
					sb.append(" ---> error: value too many   ");
					break;
				}
				if (params[i] instanceof String) {
					sb.replace(index, index + 1, "'" + this.valueOf(params[i]) + "'");
				} else if (params[i] instanceof Number) {
					sb.replace(index, index + 1, this.valueOf(params[i]));
				} else if (params[i] instanceof Character) {
					sb.replace(index, index + 1, "'" + this.valueOf(params[i]) + "'");
				} else if (params[i] instanceof Boolean) {
					sb.replace(index, index + 1, "'" + this.valueOf(params[i]) + "'");
				} else if (params[i] instanceof Object[]) {
					sb.replace(index, index + 1, "'" + this.valueOf(params[i]) + "'");
				} else if (params[i] instanceof java.sql.Date) {
					sb.replace(index, index + 1, " date '" + this.valueOf(params[i]) + "'");
				} else if (params[i] instanceof java.util.Date) {
					sb.replace(index, index + 1, "'java.util.Date'");
				}
				fromIndex = index + 1;
			}
		}
		System.out.println(sb.toString());
	}

	public String valueOf(Object obj) {
		return (obj == null) ? "" : obj.toString();
	}
}
