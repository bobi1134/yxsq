package org.yxsq.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.yxsq.dto.LchRemark;

public interface LchRemarkDao {

	/**
	 * 查询该帖子的所有二级评论
	 * @param connection
	 * @param tzId
	 * @return
	 * @throws SQLException
	 */
	List<LchRemark> selectAllLchReamrk(Connection connection, String tzId) throws SQLException;

	/**
	 * 异步添加二级评论
	 * @param connection
	 * @param lch_text
	 * @param date
	 * @param tzRemarkId
	 * @param userId
	 * @return 
	 */
	int insertLchRemark(Connection connection, String lch_text,
			String tzRemarkId, String userId)throws SQLException;

}
