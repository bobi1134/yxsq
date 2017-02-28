package org.yxsq.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.tool.page.PageModel;
import org.yxsq.dao.ImgsDao;
import org.yxsq.dao.support.QueryRunner;
import org.yxsq.dao.support.ResultSetHandler;
import org.yxsq.dto.Img;

public class ImgsDaoImpl implements ImgsDao {

	/**
	 * 准备轮播的6张火图
	 * @param connection
	 * @return
	 * @throws SQLException
	 */
	@Override
	public List<Img> selectAllImg(Connection connection) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from imgs where status = 1";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, null, new ResultSetHandler<List<Img>>() {
			@Override
			public List<Img> execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				List<Img> indexImgs = new ArrayList<>();
				while (rs.next()) {
					Img indexImg = new Img();
					indexImg.setId(rs.getInt("id"));
					indexImg.setImg_src(rs.getString("img_src"));
					indexImg.setImg_href(rs.getString("img_href"));
					indexImgs.add(indexImg);
				}
				return indexImgs;
			}
		});
	}

	/**
	 * 准备换肤的6张背景图
	 * @param connection
	 * @return
	 */
	@Override
	public List<Img> selectAllImg_2(Connection connection) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from imgs where status = 2";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, null, new ResultSetHandler<List<Img>>() {
			@Override
			public List<Img> execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				List<Img> indexImgs = new ArrayList<>();
				while (rs.next()) {
					Img indexImg = new Img();
					indexImg.setId(rs.getInt("id"));
					indexImg.setImg_src(rs.getString("img_src"));
					indexImg.setImg_href(rs.getString("img_href"));
					indexImgs.add(indexImg);
				}
				return indexImgs;
			}
		});
	}

	/**
	 * 准备session_user的个人主页的12张头部背景图片
	 * @param connection
	 * @return
	 * @throws SQLException
	 */
	@Override
	public List<Img> selectAHeadBgImg(Connection connection) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from imgs where status = 3";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, null, new ResultSetHandler<List<Img>>() {
			@Override
			public List<Img> execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				List<Img> imgs = new ArrayList<>();
				while (rs.next()) {
					Img img = new Img();
					img.setId(rs.getInt("id"));
					img.setImg_src(rs.getString("img_src"));
					img.setImg_href(rs.getString("img_href"));
					img.setImg_title(rs.getString("img_title"));
					imgs.add(img);
				}
				return imgs;
			}
		});
	}

	/**
	 * 后台管理系统 - 查询首页的所有图片
	 * @param connection
	 * @param pageModel
	 * @return
	 * @throws SQLException
	 */
	@Override
	public List<Img> admin_selectImgs(Connection connection,
			PageModel pageModel) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from imgs where status = 1 or status = 2";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.queryByPage(connection, sql, null, pageModel, new ResultSetHandler<List<Img>>() {
			@Override
			public List<Img> execute(ResultSet rs) throws SQLException {
				List<Img> imgs = new ArrayList<>();
				while (rs.next()) {
					Img img = new Img();
					img.setId(rs.getInt("id"));
					img.setImg_src(rs.getString("img_src"));
					img.setImg_href(rs.getString("img_href"));
					img.setImg_title(rs.getString("img_title"));
					img.setStatus(rs.getInt("status"));
					imgs.add(img);
				}
				return imgs;
			}
			
		});
	}

	/**
	 * 后台管理系统 - 预览首页滚动图片
	 * @param connection
	 * @return
	 * @throws SQLException
	 */
	@Override
	public Img admin_prevImg_1(Connection connection, String id) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from imgs where id = ? and status = 1";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, new Object[]{id}, new ResultSetHandler<Img>() {
			@Override
			public Img execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				if (rs.next()) {
					Img img = new Img();
					img.setImg_title(rs.getString("img_title"));
					img.setImg_src(rs.getString("img_src"));
					return img;
				}
				return null;
			}
		});
	}

	/**
	 * 后台管理系统 - 预览首页背景图片
	 * @param connection
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	@Override
	public Img admin_prevImg_2(Connection connection, String id)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from imgs where id = ? and status = 2";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, new Object[]{id}, new ResultSetHandler<Img>() {
			@Override
			public Img execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				if (rs.next()) {
					Img img = new Img();
					img.setId(rs.getInt("id"));
					img.setImg_title(rs.getString("img_title"));
					img.setImg_src(rs.getString("img_src"));
					return img;
				}
				return null;
			}
		});
	}

	/**
	 * 后台管理系统 - 查询所有的导航图片
	 * @param connection
	 * @param pageModel
	 * @return 
	 * @throws SQLException
	 */
	@Override
	public List<Img> admin_selectdhImg(Connection connection, PageModel pageModel)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from imgs where status = 1";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.queryByPage(connection, sql, null, pageModel, new ResultSetHandler<List<Img>>() {
			@Override
			public List<Img> execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				List<Img> imgs = new ArrayList<>();
				while (rs.next()) {
					Img img = new Img();
					img.setId(rs.getInt("id"));
					img.setImg_src(rs.getString("img_src"));
					img.setImg_href(rs.getString("img_href"));
					img.setImg_title(rs.getString("img_title"));
					img.setStatus(rs.getInt("status"));
					imgs.add(img);
				}
				return imgs;
			}
		});
	}


	/**
	 * 首页导航图片更新信息
	 * @param connection
	 * @param ghId
	 * @param imgSrc
	 * @param imgHref
	 * @param imgTitle
	 * @throws SQLException
	 */
	@Override
	public void admin_updateDhImg(Connection connection, String ghId,
			String imgSrc, String imgHref, String imgTitle)throws SQLException {
		// TODO Auto-generated method stub
		String sql = "update imgs set img_src = ?, img_href = ?, img_title = ? where id = ?";
		new QueryRunner().update(connection, sql, new Object[]{imgSrc, imgHref, imgTitle, ghId});
	}

	/**
	 * 后台管理系统 - 查询首页所有的背景图片
	 * @param connection
	 * @param pageModel
	 * @return
	 * @throws SQLException
	 */
	@Override
	public List<Img> admin_selectbjImg(Connection connection,
			PageModel pageModel) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from imgs where status = 2";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.queryByPage(connection, sql, null, pageModel, new ResultSetHandler<List<Img>>() {
			@Override
			public List<Img> execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				List<Img> imgs = new ArrayList<>();
				while (rs.next()) {
					Img img = new Img();
					img.setId(rs.getInt("id"));
					img.setImg_src(rs.getString("img_src"));
					img.setImg_href(rs.getString("img_href"));
					img.setImg_title(rs.getString("img_title"));
					img.setStatus(rs.getInt("status"));
					imgs.add(img);
				}
				return imgs;
			}
		});
	}

	/**
	 * 后台管理系统 - 跳转到修改背景图片页面
	 * @param connection
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	@Override
	public Img admin_updateBjPage(Connection connection, String id)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from imgs where id = ? and status = 2";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, new Object[]{id}, new ResultSetHandler<Img>() {
			@Override
			public Img execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				if (rs.next()) {
					Img img = new Img();
					img.setId(rs.getInt("id"));
					img.setImg_title(rs.getString("img_title"));
					img.setImg_src(rs.getString("img_src"));
					return img;
				}
				return null;
			}
		});
	}

	/**
	 * 后台管理系统 - 更新imgs表信息
	 * @param connection
	 * @param id
	 * @param fileName
	 * @param img_title
	 * @throws SQLException
	 */
	@Override
	public void updateBjImg(Connection connection, String id, String fileName,
			String img_title) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "update imgs set img_src=?, img_title=? where id = ?";
		new QueryRunner().update(connection, sql, new Object[]{fileName, img_title, id});
	}

	/**
	 * 后台管理系统 - 查询所有的用户头部背景图片
	 * @param connection
	 * @param pageModel
	 * @return
	 * @throws SQLException
	 */
	@Override
	public List<Img> admin_selectHomeImgs(Connection connection,
			PageModel pageModel) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from imgs where status = 3";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.queryByPage(connection, sql, null, pageModel, new ResultSetHandler<List<Img>>() {
			@Override
			public List<Img> execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				List<Img> imgs = new ArrayList<>();
				while (rs.next()) {
					Img img = new Img();
					img.setId(rs.getInt("id"));
					img.setImg_src(rs.getString("img_src"));
					img.setImg_title(rs.getString("img_title"));
					imgs.add(img);
				}
				return imgs;
			}
		});
	}

	/**
	 * 后台管理系统 - 预览用户主页头部背景图片
	 * @param connection
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	@Override
	public Img admin_prevHomeImg(Connection connection, String id)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from imgs where id = ? and status = 3";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, new Object[]{id}, new ResultSetHandler<Img>() {
			@Override
			public Img execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				if (rs.next()) {
					Img img = new Img();
					img.setId(rs.getInt("id"));
					img.setImg_title(rs.getString("img_title"));
					img.setImg_src(rs.getString("img_src"));
					return img;
				}
				return null;
			}
		});
	}

	
}
