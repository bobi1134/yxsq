package org.yxsq.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.tool.page.PageModel;
import org.yxsq.dto.Tz;
import org.yxsq.dto.TzRemark;

public interface TzRemarkDao {

	/**
	 * 查询帖子最后评论者
	 * @param connection
	 * @param tzId
	 * @return
	 */
	TzRemark selectRemarkNameByTzId(Connection connection, String tzId) throws SQLException;

	/**
	 * 查询该帖的所有一级评论
	 * @param connection
	 * @param tzId
	 * @return
	 * @throws SQLException
	 */
	List<TzRemark> selectAllRemark(Connection connection, String tzId, PageModel pageModel)throws SQLException;

	/**
	 * 查询该帖子的最后一条评论
	 * @param connection
	 * @param tzId
	 * @return
	 */
	TzRemark selectFirstOneRemark(Connection connection, String tzId) throws SQLException;

	/**
	 * 查询lcNum
	 * @param connection
	 * @param tzId
	 * @return
	 * @throws SQLException
	 */
	TzRemark selectjMaxLcNum(Connection connection, String tzId)throws SQLException;





}
