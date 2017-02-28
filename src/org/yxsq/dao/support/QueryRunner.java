package org.yxsq.dao.support;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.tool.page.PageModel;


/**
 * 负责数据库的CRUD
 * @author: Nothing
 * @email: 761328790@qq.com
 * @company: Sichuan Agricultural University
 * @date 2015年4月26日
 * 
 * Explain:QueryRunner是用来简化增删改查的。
 * QueryRunner通过封装update()和query()方法使我们不用那么麻烦的每次都写那些update()和query()方法、
 * 而且可以帮我们自动关闭线程.但是,如果我们需要自己定义一个connection的话我们就需要自动的关闭。
 */
public class QueryRunner{
	/**
	 * 通用查询方法
	 * @param conn 数据连接
	 * @param sql 语句
	 * @param params 参数
	 * @param handler 结果集处理接口
	 * @return T
	 * @throws SQLException
	 */
	public <T> T query(Connection conn, String sql, Object[] params, ResultSetHandler<T> handler) 
			throws SQLException{
		PreparedStatement pstmt = conn.prepareStatement(sql);
		if (params != null && params.length > 0){
			for (int i = 0; i < params.length; i++){
				pstmt.setObject(i + 1, params[i]);
			}
		}
		ResultSet rs = pstmt.executeQuery();
		return handler.execute(rs);
	}
	
	/**
	 * 通用 的CUD方法
	 * @param conn
	 * @param sql
	 * @param params
	 * @return
	 * @throws SQLException
	 */
	public int update(Connection conn, String sql, Object[] params) throws SQLException{
		PreparedStatement pstmt = conn.prepareStatement(sql);
		if (params != null && params.length > 0){
			for (int i = 0; i < params.length; i++){
				pstmt.setObject(i + 1, params[i]);
			}
		}
		return pstmt.executeUpdate();
	}
	
	/**
	 * 通用分页查询方法
	 * @param connection 数据库连接
	 * @param sql SQL语句
	 * @param params 参数
	 * @param pageModel 分页实体
	 * @param resultSetHandler 结果集处理接口
	 * @throws SQLException
	 */
	public <T> T queryByPage(Connection connection, String sql, Object[] params, PageModel pageModel, ResultSetHandler<T> handler) throws SQLException
	{
		// 统计查询语句
		int start= sql.toLowerCase().indexOf("from");
		int end = sql.toLowerCase().indexOf("group by");
		String countSql = "select count(*) " + sql.substring(start, end == -1 ? sql.length() : end);
		// 统计查询
		int recordCount = this.query(connection, countSql, params, new ResultSetHandler<Integer>() 
		{
			@Override
			public Integer execute(ResultSet rs) throws SQLException 
			{
				if (rs.next())
				{
					return rs.getInt(1);
				}
				return 0;
			}
		});
		// 设置记录总条数
		pageModel.setRecordCount(recordCount);
		if (recordCount == 0)
		{
			//return null;
		}
		// 分页查询
		String pageSql = sql + " limit "+ pageModel.getStartRow() + "," + pageModel.getPageSize();
		return this.query(connection, pageSql, params, handler);
	}
}
