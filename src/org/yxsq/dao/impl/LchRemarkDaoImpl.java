package org.yxsq.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.yxsq.dao.LchRemarkDao;
import org.yxsq.dao.support.QueryRunner;
import org.yxsq.dao.support.ResultSetHandler;
import org.yxsq.dto.LchRemark;
import org.yxsq.dto.User;

public class LchRemarkDaoImpl implements LchRemarkDao {

	/**
	 * 查询该帖子的所有二级评论
	 * @param connection
	 * @param tzId
	 * @return
	 * @throws SQLException
	 */
	@Override
	public List<LchRemark> selectAllLchReamrk(Connection connection, String tzId)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from lch_remark inner join tz_remark on lch_remark.tz_remarkId = tz_remark.id inner join user on lch_remark.userId = user.id where lch_remark.tz_remarkId = ? order by lch_remark.lch_remark_time asc";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, new Object[]{tzId}, new ResultSetHandler<List<LchRemark>>() {
			@Override
			public List<LchRemark> execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				List<LchRemark> lchRemarks = new ArrayList<>();
				while (rs.next()) {
					LchRemark lchRemark = new LchRemark();
					lchRemark.setId(rs.getInt("id"));
					lchRemark.setLch_remark_content(rs.getString("lch_remark_content"));
					lchRemark.setLch_remark_time(rs.getTimestamp("lch_remark_time"));
					User user = new User();
					user.setId(rs.getInt("id"));
					user.setNickname(rs.getString("nickname"));
					user.setImg(rs.getString("img"));
					lchRemark.setUser(user);
					lchRemarks.add(lchRemark);
				}
				return lchRemarks;
			}
		});
	}

	/**
	 * 异步添加二级评论
	 * @param connection
	 * @param lch_text
	 * @param date
	 * @param tzRemarkId
	 * @param userId
	 */
	@Override
	public int insertLchRemark(Connection connection, String lch_text, String tzRemarkId, String userId) throws SQLException {
		// TODO Auto-generated method stub
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		String abcValue = sdf.format(now);
		String sql = "insert into lch_remark (lch_remark_content, lch_remark_time, tz_remarkId, userId) value(?,?,?,?)";
		return new QueryRunner().update(connection, sql, new Object[]{lch_text, abcValue, tzRemarkId, userId});
	}

}
