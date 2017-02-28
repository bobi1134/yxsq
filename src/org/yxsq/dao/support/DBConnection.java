package org.yxsq.dao.support;

import java.sql.Connection;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;


public class DBConnection{
	
	// Create the C3p0 connection pool
	private static ComboPooledDataSource ds;
	
	static	{
		ds = new ComboPooledDataSource();
	}
	
	/**
	 * get the database connection
	 * @return
	 * @throws SQLException
	 */
	public static Connection getConnection() throws SQLException{
		return ds.getConnection();
	}
	
	/**
	 * close the database connection, the connection to the connection pool
	 * @param conn
	 * @throws SQLException
	 */
	public static void close(Connection conn) throws SQLException{
		if (conn != null){
			conn.close();
		}
	}
}
