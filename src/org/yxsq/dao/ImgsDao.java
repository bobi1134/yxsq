package org.yxsq.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.tool.page.PageModel;
import org.yxsq.dto.Img;

public interface ImgsDao {

	/**
	 * 准备轮播的6张火图
	 * @param connection
	 * @return
	 * @throws SQLException
	 */
	List<Img> selectAllImg(Connection connection) throws SQLException;

	/**
	 * 准备换肤的6张背景图
	 * @param connection
	 * @return
	 */
	List<Img> selectAllImg_2(Connection connection) throws SQLException;

	/**
	 * 准备session_user的个人主页的12张头部背景图片
	 * @param connection
	 * @return
	 * @throws SQLException
	 */
	List<Img> selectAHeadBgImg(Connection connection)throws SQLException;

	/**
	 * 后台管理系统 - 查询首页的所有图片
	 * @param connection
	 * @param pageModel
	 * @return
	 * @throws SQLException
	 */
	List<Img> admin_selectImgs(Connection connection, PageModel pageModel)throws SQLException;

	/**
	 * 后台管理系统 - 预览首页滚动图片
	 * @param connection
	 * @param id 
	 * @return
	 * @throws SQLException
	 */
	Img admin_prevImg_1(Connection connection, String id)throws SQLException;

	/**
	 * 后台管理系统 - 预览首页背景图片
	 * @param connection
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	Img admin_prevImg_2(Connection connection, String id)throws SQLException;

	/**
	 * 后台管理系统 - 查询所有的导航图片
	 * @param connection
	 * @param pageModel
	 * @return 
	 * @throws SQLException
	 */
	List<Img> admin_selectdhImg(Connection connection, PageModel pageModel)throws SQLException;

	/**
	 * 首页导航图片更新信息
	 * @param connection
	 * @param ghId
	 * @param imgSrc
	 * @param imgHref
	 * @param imgTitle
	 * @throws SQLException
	 */
	void admin_updateDhImg(Connection connection, String ghId, String imgSrc,
			String imgHref, String imgTitle)throws SQLException;

	/**
	 * 后台管理系统 - 查询首页所有的背景图片
	 * @param connection
	 * @param pageModel
	 * @return
	 * @throws SQLException
	 */
	List<Img> admin_selectbjImg(Connection connection, PageModel pageModel)throws SQLException;

	/**
	 * 后台管理系统 - 跳转到修改背景图片页面
	 * @param connection
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	Img admin_updateBjPage(Connection connection, String id)throws SQLException;

	/**
	 * 后台管理系统 - 更新imgs表信息
	 * @param connection
	 * @param id
	 * @param fileName
	 * @param img_title
	 * @throws SQLException
	 */
	void updateBjImg(Connection connection, String id, String fileName,
			String img_title)throws SQLException;

	/**
	 * 后台管理系统 - 查询所有的用户头部背景图片
	 * @param connection
	 * @param pageModel
	 * @return
	 * @throws SQLException
	 */
	List<Img> admin_selectHomeImgs(Connection connection, PageModel pageModel)throws SQLException;

	/**
	 * 后台管理系统 - 预览用户主页头部背景图片
	 * @param connection
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	Img admin_prevHomeImg(Connection connection, String id)throws SQLException;


}
