package org.yxsq.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.tool.page.PageModel;
import org.yxsq.dao.TzRemarkDao;
import org.yxsq.dao.support.QueryRunner;
import org.yxsq.dao.support.ResultSetHandler;
import org.yxsq.dto.Tz;
import org.yxsq.dto.TzRemark;
import org.yxsq.dto.User;

public class TzRemarkDaoImpl implements TzRemarkDao {

	/**
	 * 查询帖子最后评论者
	 * @param connection
	 * @param tzId
	 * @return
	 */
	@Override
	public TzRemark selectRemarkNameByTzId(Connection connection, String tzId)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from tz_remark inner join user on user.id = tz_remark.userId where tzId = ? order by tz_remark_time desc limit 0,1";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, new Object[]{tzId}, new ResultSetHandler<TzRemark>() {
			@Override
			public TzRemark execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				if (rs.next()) {
					TzRemark tzRemark = new TzRemark();
					tzRemark.setId(rs.getInt("id"));
					User user = new User();
					user.setId(rs.getShort("id"));
					user.setNickname(rs.getString("nickname"));
					tzRemark.setUser(user);
					return tzRemark;
				}
				return null;
			}
		});
	}
	
	/**
	 * 查询该帖的所有一级评论
	 * @param connection
	 * @param tzId
	 * @return
	 * @throws SQLException
	 */
	@Override
	public List<TzRemark> selectAllRemark(Connection connection, String tzId, PageModel pageModel)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from tz_remark inner join tz on tz_remark.tzId = tz.id inner join user on tz_remark.userId = user.id where tz.id = ? order by tz_remark.tz_remark_time asc";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.queryByPage(connection, sql, new Object[]{tzId}, pageModel, new ResultSetHandler<List<TzRemark>>() {
			@Override
			public List<TzRemark> execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				List<TzRemark> tzRemarks = new ArrayList<>();
				while (rs.next()) {
					TzRemark tzRemark = new TzRemark();
					tzRemark.setId(rs.getInt("id"));
					tzRemark.setTz_remark_content(rs.getString("tz_remark_content"));
					tzRemark.setTz_remark_time(rs.getTimestamp("tz_remark_time"));
					tzRemark.setLcNum(rs.getInt("lcNum"));
					User user = new User();
					user.setNickname(rs.getString("nickname"));
					user.setImg(rs.getString("img"));
					Tz tz = new Tz();
					tz.setId(rs.getInt("id"));
					tzRemark.setUser(user);
					tzRemark.setTz(tz);
					tzRemarks.add(tzRemark);
				}
				return tzRemarks;
			}
		});
	}

	/**
	 * 查询该帖子的最后一条评论
	 * @param connection
	 * @param tzId
	 * @return
	 */
	@Override
	public TzRemark selectFirstOneRemark(Connection connection, String tzId)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from tz_remark where tzId = ? order by tz_remark_time desc limit 0,1";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, new Object[]{tzId}, new ResultSetHandler<TzRemark>() {
			@Override
			public TzRemark execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				if (rs.next()) {
					TzRemark tzRemark = new TzRemark();
					tzRemark.setTz_remark_content(rs.getString("tz_remark_content"));
					tzRemark.setUserId(rs.getInt("userId"));
					return tzRemark;
				}
				else{
					TzRemark tzRemark = new TzRemark();
					tzRemark.setTz_remark_content("默认值");
					tzRemark.setUserId(1);
					return tzRemark;
				}
			}
		});
	}

	/**
	 * 查询lcNum
	 * @param connection
	 * @param tzId
	 * @return
	 * @throws SQLException
	 */
	@Override
	public TzRemark selectjMaxLcNum(Connection connection, String tzId)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from tz_remark where tzId = ? order by tz_remark_time desc limit 0,1";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, new Object[]{tzId}, new ResultSetHandler<TzRemark>() {
			@Override
			public TzRemark execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				if (rs.next()) {
					TzRemark tzRemark = new TzRemark();
					tzRemark.setLcNum(rs.getInt("lcNum"));
					return tzRemark;
				}else{
					TzRemark tzRemark = new TzRemark();
					tzRemark.setLcNum(0);
					return tzRemark;
				}
			}
		});
	}





}
