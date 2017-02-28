package org.yxsq.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.tool.page.PageModel;
import org.yxsq.dto.Img;
import org.yxsq.dto.Tz;
import org.yxsq.dto.TzRemark;

public interface TzDao {

	/**
	 * 查询相应社区的帖子总数
	 * @param connection
	 * @param sqName
	 * @return
	 */
	int selectSqTzCount(Connection connection, String sqName) throws SQLException;

	/**
	 * 查询所有帖子、发帖人、发帖时间、最后评论者
	 * @param connection
	 * @param sqName
	 * @return
	 * @throws SQLException
	 */
	List<Tz> selectTzsBySqName(Connection connection, String sqName, PageModel pageModel)throws SQLException;

	/**
	 * 从另外的表中查询评论总数
	 * @param connection
	 * @param tzId
	 * @return
	 * @throws SQLException
	 */
	int selectRemarkCount(Connection connection, String tzId) throws SQLException;

	/**
	 * 从另外的表中查询评论总数后再更新到tz表中的remarkCount字段中去
	 * @param connection
	 * @param count
	 * @param tzId
	 * @throws SQLException
	 */
	void updtaeRemarkCount(Connection connection, int count, String tzId)throws SQLException;

	/**
	 * 修改评论数
	 * @param connection
	 * @param lastRemark
	 * @param tzId
	 * @throws SQLException
	 */
	void updtaelastRemark(Connection connection, String lastRemark, String tzId) throws SQLException;

	/**
	 * 添加帖子
	 * @param insert_title
	 * @param ckeditor
	 * @param userId
	 * @param sqId
	 */
	void insertTz(Connection connection, String insert_title, String ckeditor, int userId, String sqId) throws SQLException;

	/**
	 * 简单表单重复提交测试，按时间查询最后一个发帖者
	 * @param sqId
	 * @return
	 */
	Tz select(Connection connection, String sqId) throws SQLException;

	/**
	 * 根据帖子id查询该帖子的详细信息
	 * @param connection
	 * @param tzId
	 * @return
	 * @throws SQLException
	 */
	Tz selectTzByTzId(Connection connection, String tzId) throws SQLException;

	/**
	 * 添加一级评论
	 * @param connection
	 * @param remarkText
	 * @param date
	 * @param tzId
	 * @param userId
	 * @throws SQLException
	 */
	void insertOneRemark(Connection connection, String remarkText, int lcNum, String tzId,
			String userId)throws SQLException;

	/**
	 * 准备welcome.jsp页面的精品帖子
	 * @param connection
	 * @return
	 * @throws SQLException
	 */
	List<Tz> selectAlJpTz(Connection connection) throws SQLException;

	/**
	 * 准备welcome.jsp页面的精品帖子 后7条
	 * @param connection
	 * @return
	 * @throws SQLException
	 */
	List<Tz> selectAlJpTz_2(Connection connection) throws SQLException;

	/**
	 * 准备高校热帖
	 * @param connection
	 * @return
	 * @throws SQLException
	 */
	List<Tz> selectAlJpTz_3(Connection connection)throws SQLException;

	/**
	 * 查询所点击的该用户的发帖情况
	 * @param connection
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	List<Tz> selectClickUserTzs(Connection connection, int id)throws SQLException;

	/**
	 * 后台管理系统 - 添加第一条帖子
	 * @param connection 
	 * @param id
	 */
	void admin_insertNewSqFirstTz(Connection connection, String id)throws SQLException;

	/**
	 * 后台管理系统 - 多条件查询所有的帖子
	 * @param connection
	 * @param tzTitle 
	 * @param sqName 
	 * @param pageModel
	 * @return 
	 * @throws SQLException
	 */
	List<Tz> admin_selectAllTz(Connection connection, String sqName, String tzTitle, PageModel pageModel)throws SQLException;

	/**
	 * 后台管理系统 - 预览帖子
	 * @param connection
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	Tz admin_prevTz(Connection connection, String id)throws SQLException;

	/**
	 * 后台管理系统 - 首页加精
	 * @param connection
	 * @param id
	 * @throws SQLException
	 */
	void addTojingTz(Connection connection, String id)throws SQLException;

	/**
	 * 后台管理系统 - 首页加火
	 * @param connection
	 * @param id
	 * @throws SQLException
	 */
	void addTohuoTz(Connection connection, String id)throws SQLException;

	/**
	 * 后台管理系统 - 取消首页加精
	 * @param connection
	 * @param id
	 * @throws SQLException
	 */
	void deleteTojingTz(Connection connection, String id)throws SQLException;

	/**
	 * 后台管理系统 - 取消首页加火
	 * @param connection
	 * @param id
	 * @throws SQLException
	 */
	void deleteTohuoTz(Connection connection, String id)throws SQLException;

	/**
	 * 后台管理系统 - 查询首页所有精帖
	 * @param connection
	 * @param tzTitle 
	 * @param sqName 
	 * @return
	 * @throws SQLException
	 */
	List<Tz> admin_selectAllIndexJingTz(Connection connection, String sqName, String tzTitle, PageModel pageModel)throws SQLException;

	/**
	 * 后台管理系统 - 查询首页所有热帖
	 * @param connection
	 * @param sqName
	 * @param tzTitle
	 * @param pageModel
	 * @return
	 * @throws SQLException
	 */
	List<Tz> admin_selectAllIndexHuoTz(Connection connection, String sqName,
			String tzTitle, PageModel pageModel)throws SQLException;

	/**
	 * 后台管理系统 - 查询所有带<img>属性的所有帖子
	 * @param connection
	 * @param pageModel
	 * @return
	 * @throws SQLException
	 */
	List<Tz> admin_selectAllImgTz(Connection connection, PageModel pageModel)throws SQLException;

	/**
	 * 查询要更换帖子的信息
	 * @param connection
	 * @param okId
	 * @return
	 * @throws SQLException
	 */
	Tz admin_selectTzById(Connection connection, String okId)throws SQLException;

}
