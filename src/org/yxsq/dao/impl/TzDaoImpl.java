package org.yxsq.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.tool.page.PageModel;
import org.yxsq.dao.TzDao;
import org.yxsq.dao.support.QueryRunner;
import org.yxsq.dao.support.ResultSetHandler;
import org.yxsq.dto.Sq;
import org.yxsq.dto.Tz;
import org.yxsq.dto.User;

public class TzDaoImpl implements TzDao {

	/**
	 * 查询相应社区的帖子总数
	 * @param connection
	 * @param sqName
	 * @return
	 */
	@Override
	public int selectSqTzCount(Connection connection, String sqName)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from tz inner join sq on tz.sqId = sq.id where sq.sq_name = ?";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, new Object[]{sqName}, new ResultSetHandler<Integer>() {

			@Override
			public Integer execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				int count = 0;
				while (rs.next()) {
					count++;
				}
				return count;
			}
		});
	}

	/**
	 * 查询所有帖子、发帖人、发帖时间、最后评论者
	 * @param connection
	 * @param sqName
	 * @return
	 * @throws SQLException
	 */
	@Override
	public List<Tz> selectTzsBySqName(Connection connection, String sqName, PageModel pageModel)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from tz inner join user on tz.userId = user.id left join  sq on tz.sqId = sq.id where sq.sq_name = ? order by tz.tz_time desc";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.queryByPage(connection, sql, new Object[]{sqName}, pageModel, new ResultSetHandler<List<Tz>>() {
			@Override
			public List<Tz> execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				List<Tz> tzs = new ArrayList<>();
				while (rs.next()) {
					Tz tz = new Tz();
					tz.setId(rs.getInt("id"));
					tz.setTz_title(rs.getString("tz_title"));
					tz.setTz_content(rs.getString("tz_content"));
					tz.setTz_time(rs.getTimestamp("tz_time"));
					tz.setRemarkCount(rs.getShort("remarkCount"));
					tz.setLastRemark(rs.getString("lastRemark"));
					tz.setSqId(rs.getString("sqId"));
					User user = new User();
					user.setNickname(rs.getString("nickname"));
					user.setImg(rs.getString("img"));
					Sq sq = new Sq();
					sq.setId(rs.getString("id"));
					tz.setUser(user);
					tz.setSq(sq);
					tzs.add(tz);
				}
				return tzs;
			}
		});
	}

	/**
	 * 从另外的表中查询评论总数
	 * @param connection
	 * @param tzId
	 * @return
	 * @throws SQLException
	 */
	@Override
	public int selectRemarkCount(Connection connection, String tzId)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from tz_remark inner join tz on tz_remark.tzId = tz.id where tz.id = ?";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, new Object[]{tzId}, new ResultSetHandler<Integer>() {
			@Override
			public Integer execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				int count = 0;
				while (rs.next()) {
					count++;
				}
				return count;
			}
		});
	}

	/**
	 * 从另外的表中查询评论总数后再更新到tz表中的remarkCount字段中去
	 * @param connection
	 * @param count
	 * @param tzId
	 * @throws SQLException
	 */
	@Override
	public void updtaeRemarkCount(Connection connection, int count, String tzId)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "update tz set remarkCount = ? where id = ?";
		new QueryRunner().update(connection, sql, new Object[]{count, tzId});
		
	}

	/**
	 * 修改评论数
	 * @param connection
	 * @param lastRemark
	 * @param tzId
	 * @throws SQLException
	 */
	@Override
	public void updtaelastRemark(Connection connection, String lastRemark,
			String tzId) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "update tz set lastRemark = ? where id = ?";
		new QueryRunner().update(connection, sql, new Object[]{lastRemark, tzId});
		
	}

	/**
	 * 添加帖子
	 * @param insert_title
	 * @param ckeditor
	 * @param userId
	 * @param sqId
	 */
	@Override
	public void insertTz(Connection connection, String insert_title,
			String ckeditor, int userId, String sqId)
			throws SQLException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		String abcValue = sdf.format(now);
		// TODO Auto-generated method stub
		String sql = "insert into tz (tz_title, tz_content, tz_time, userId, sqId) values(?,?,?,?,?)";
		new QueryRunner().update(connection, sql, new Object[]{insert_title, ckeditor, abcValue, userId, sqId});
	}

	/**
	 * 简单表单重复提交测试，按时间查询最后一个发帖者
	 * @param sqId
	 * @return
	 */
	@Override
	public Tz select(Connection connection, String sqId) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from tz inner join user on tz.userId = user.id where sqId = ? order by tz_time desc limit 0,1";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, new Object[]{sqId}, new ResultSetHandler<Tz>() {

			@Override
			public Tz execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				if (rs.next()) {
					Tz tz = new Tz();
					tz.setTz_title(rs.getString("tz_title"));
					tz.setTz_content(rs.getString("tz_content"));
					tz.setTz_time(rs.getTimestamp("tz_time"));
					tz.setUserId(rs.getString("userId"));
					return tz;
				}else{
					Tz tz = new Tz();
					tz.setTz_title("test---");
					tz.setUserId("lalala---");
					return tz;
				}
			}
		});
	}

	/**
	 * 根据帖子id查询该帖子的详细信息
	 * @param connection
	 * @param tzId
	 * @return
	 * @throws SQLException
	 */
	@Override
	public Tz selectTzByTzId(Connection connection, String tzId)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from tz inner join user on tz.userId = user.id where tz.id = ?";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, new Object[]{tzId}, new ResultSetHandler<Tz>() {
			@Override
			public Tz execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				if (rs.next()) {
					Tz tz = new Tz();
					tz.setId(rs.getInt("id"));
					tz.setTz_title(rs.getString("tz_title"));
					tz.setTz_content(rs.getString("tz_content"));
					User user = new User();
					user.setNickname(rs.getString("nickname"));
					user.setImg(rs.getString("img"));
					tz.setUser(user);
					return tz;
				}
				return null;
			}
		});
	}

	/**
	 * 添加一级评论
	 * @param connection
	 * @param remarkText
	 * @param date
	 * @param tzId
	 * @param userId
	 * @throws SQLException
	 */
	@Override
	public void insertOneRemark(Connection connection, String remarkText, int lcNum, 
			String tzId, String userId) throws SQLException {
		// TODO Auto-generated method stub
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		String abcValue = sdf.format(now);
		String sql = "insert into tz_remark(tz_remark_content, tz_remark_time, lcNum, tzId, userId) values(?,?,?,?,?)";
		new QueryRunner().update(connection, sql, new Object[]{remarkText, abcValue, lcNum, tzId, userId});
	}

	/**
	 * 准备welcome.jsp页面的精品帖子
	 * @param connection
	 * @return
	 * @throws SQLException
	 */
	@Override
	public List<Tz> selectAlJpTz(Connection connection) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from tz where status = 1 order by remarkCount desc limit 0,3";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, null, new ResultSetHandler<List<Tz>>() {
			@Override
			public List<Tz> execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				List<Tz> tzs = new ArrayList<>();
				while (rs.next()) {
					Tz tz = new Tz();
					tz.setId(rs.getInt("id"));
					tz.setTz_title(rs.getString("tz_title"));
					tz.setRemarkCount(rs.getInt("remarkCount"));
					tz.setSqId(rs.getString("sqId"));
					tzs.add(tz);
				}
				return tzs;
			}
		});
	}
	
	/**
	 * 准备welcome.jsp页面的精品帖子 后7条
	 * @param connection
	 * @return
	 * @throws SQLException
	 */
	@Override
	public List<Tz> selectAlJpTz_2(Connection connection) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from tz where status = 1 order by remarkCount desc limit 3,7";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, null, new ResultSetHandler<List<Tz>>() {
			@Override
			public List<Tz> execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				List<Tz> tzs = new ArrayList<>();
				while (rs.next()) {
					Tz tz = new Tz();
					tz.setId(rs.getInt("id"));
					tz.setTz_title(rs.getString("tz_title"));
					tz.setRemarkCount(rs.getInt("remarkCount"));
					tz.setSqId(rs.getString("sqId"));
					tzs.add(tz);
				}
				return tzs;
			}
		});
	}

	/**
	 * 准备高校热帖
	 * @param connection
	 * @return
	 * @throws SQLException
	 */
	@Override
	public List<Tz> selectAlJpTz_3(Connection connection) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from tz inner join user on tz.userId = user.id where tz.status = 2 order by tz.remarkCount desc limit 0,8";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, null, new ResultSetHandler<List<Tz>>() {
			@Override
			public List<Tz> execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				List<Tz> tzs = new ArrayList<>();
				while (rs.next()) {
					Tz tz = new Tz();
					tz.setId(rs.getInt("id"));
					tz.setTz_title(rs.getString("tz_title"));
					tz.setRemarkCount(rs.getInt("remarkCount"));
					tz.setSqId(rs.getString("sqId"));
					User user = new User();
					user.setNickname(rs.getString("nickname"));
					tz.setUser(user);
					tzs.add(tz);
				}
				return tzs;
			}
		});
	}

	/**
	 * 查询所点击的该用户的发帖情况
	 * @param connection
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	@Override
	public List<Tz> selectClickUserTzs(Connection connection, int id)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from tz inner join user on user.id = tz.userId inner join sq on tz.sqId = sq.id where user.id = ? order by tz.tz_time desc";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, new Object[]{id}, new ResultSetHandler<List<Tz>>() {
			@Override
			public List<Tz> execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				List<Tz> tzs = new ArrayList<>();
				while (rs.next()) {
					User user = new User();
					//user.setId(rs.getInt("id"));
					user.setNickname(rs.getString("nickname"));
					Sq sq = new Sq();
					sq.setSq_img(rs.getString("sq_img"));
					sq.setSq_name(rs.getString("sq_name"));
					Tz tz = new Tz();
					tz.setId(rs.getInt("id"));
					tz.setTz_title(rs.getString("tz_title"));
					tz.setTz_content(rs.getString("tz_content"));
					tz.setTz_time(rs.getTimestamp("tz_time"));
					tz.setLastRemark(rs.getString("lastRemark"));
					tz.setRemarkCount(rs.getInt("remarkCount"));
					tz.setSqId(rs.getString("sqId"));
					tz.setUser(user);
					tz.setSq(sq);
					tzs.add(tz);
				}
				return tzs;
			}
		});
	}

	/**
	 * 后台管理系统 - 添加第一条帖子
	 * @param id
	 */
	@Override
	public void admin_insertNewSqFirstTz(Connection connection, String id) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "insert into tz(tz_title,tz_content,tz_time,remarkCount,lastRemark,userId,sqId) values(?,?,?,?,?,?,?)";
		new QueryRunner().update(connection, sql, new Object[]{
				"欢迎来到本社区，你可以在这里畅所欲言！",
				"<p>来自社区工作室</p><p>-- By Nothing</p><p><img alt='' src='http://ww3.sinaimg.cn/bmiddle/005SIeiBgw1es7pzfcou3j30dr093dg4.jpg' style='height:291px; width:440px'/></p>",
				new Date(),
				0,
				"暂无评论",
				1,
				id
		});
	}

	/**
	 * 后台管理系统 - 多条件查询所有的帖子
	 * @param connection
	 * @param pageModel
	 * @throws SQLException
	 */
	@Override
	public List<Tz> admin_selectAllTz(Connection connection, String sqName, String tzTitle, PageModel pageModel)
			throws SQLException {
		// TODO Auto-generated method stub
		StringBuilder sb = new StringBuilder();
		sb.append("select * from tz inner join user on tz.userId = user.id inner join sq on tz.sqId = sq.id where 1=1");
		//String sql = "select * from tz inner join user on tz.userId = user.id inner join sq on tz.sqId = sq.id order by sq.sq_name asc , tz.remarkCount desc";
		List<Object> params = new ArrayList<>();
		if (sqName != null && !sqName.equals("")) {
			sb.append(" and sq.sq_name like ?");
			params.add("%" + sqName + "%");
		}
		if (tzTitle != null && !tzTitle.equals("")) {
			sb.append(" and tz.tz_title like ?");
			params.add("%"+ tzTitle + "%");
		}		
		sb.append(" order by sq.sq_name asc , tz.remarkCount desc");
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.queryByPage(connection, sb.toString(), params.toArray(), pageModel, new ResultSetHandler<List<Tz>>() {
			@Override
			public List<Tz> execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				List<Tz> tzs = new ArrayList<>();
				while (rs.next()) {
					Tz tz = new Tz();
					tz.setId(rs.getInt("id"));
					tz.setTz_title(rs.getString("tz_title"));
					tz.setRemarkCount(rs.getInt("remarkCount"));
					tz.setStatus(rs.getString("status"));
					User user = new User();
					user.setNickname(rs.getString("nickname"));
					Sq sq = new Sq();
					sq.setSq_name(rs.getString("sq_name"));
					tz.setUser(user);
					tz.setSq(sq);
					tzs.add(tz);
				}
				return tzs;
			}
		});
	}

	/**
	 * 后台管理系统 - 预览帖子
	 * @param connection
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	@Override
	public Tz admin_prevTz(Connection connection, String id)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from tz where id = ?";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, new Object[]{id}, new ResultSetHandler<Tz>() {
			@Override
			public Tz execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				if (rs.next()) {
					Tz tz = new Tz();
					tz.setTz_title(rs.getString("tz_title"));
					tz.setTz_content(rs.getString("tz_content"));
					return tz;
				}
				return null;
			}
		});
	}

	/**
	 * 后台管理系统 - 首页加精
	 * @param connection
	 * @param id
	 * @throws SQLException
	 */
	@Override
	public void addTojingTz(Connection connection, String id)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "update tz set status = 1 where id = ?";
		new QueryRunner().update(connection, sql, new Object[]{id});
	}

	/**
	 * 后台管理系统 - 首页加火
	 * @param connection
	 * @param id
	 * @throws SQLException
	 */
	@Override
	public void addTohuoTz(Connection connection, String id)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "update tz set status = 2 where id = ?";
		new QueryRunner().update(connection, sql, new Object[]{id});
	}

	/**
	 * 后台管理系统 - 取消首页加精
	 * @param connection
	 * @param id
	 * @throws SQLException
	 */
	@Override
	public void deleteTojingTz(Connection connection, String id)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "update tz set status = 0 where id = ?";
		new QueryRunner().update(connection, sql, new Object[]{id});
	}

	/**
	 * 后台管理系统 - 取消首页加火
	 * @param connection
	 * @param id
	 * @throws SQLException
	 */
	@Override
	public void deleteTohuoTz(Connection connection, String id)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "update tz set status = 0 where id = ?";
		new QueryRunner().update(connection, sql, new Object[]{id});
	}

	/**
	 * 后台管理系统 - 查询首页所有精帖
	 * @param connection
	 * @return
	 * @throws SQLException
	 */
	@Override
	public List<Tz> admin_selectAllIndexJingTz(Connection connection, String sqName, String tzTitle, PageModel pageModel)
			throws SQLException {
		// TODO Auto-generated method stub
		StringBuilder sb = new StringBuilder();
		sb.append("select * from tz inner join user on tz.userId = user.id inner join sq on tz.sqId = sq.id where tz.status = 1 and 1=1");
		//String sql = "select * from tz inner join user on tz.userId = user.id inner join sq on tz.sqId = sq.id where tz.status = 1 and 1=1";
		List<Object> params = new ArrayList<>();
		if (sqName != null && !sqName.equals("")) {
			sb.append(" and sq.sq_name like ?");
			params.add("%" + sqName + "%");
		}
		if (tzTitle != null && !tzTitle.equals("")) {
			sb.append(" and tz.tz_title like ?");
			params.add("%"+ tzTitle + "%");
		}		
		sb.append(" order by sq.sq_name asc , tz.remarkCount desc");
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.queryByPage(connection, sb.toString(), params.toArray(), pageModel, new ResultSetHandler<List<Tz>>() {
			@Override
			public List<Tz> execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				List<Tz> tzs = new ArrayList<>();
				while (rs.next()) {
					Tz tz = new Tz();
					tz.setId(rs.getInt("id"));
					tz.setTz_title(rs.getString("tz_title"));
					tz.setRemarkCount(rs.getInt("remarkCount"));
					tz.setStatus(rs.getString("status"));
					User user = new User();
					user.setNickname(rs.getString("nickname"));
					Sq sq = new Sq();
					sq.setSq_name(rs.getString("sq_name"));
					tz.setUser(user);
					tz.setSq(sq);
					tzs.add(tz);
				}
				return tzs;
			}
		});
	}

	/**
	 * 后台管理系统 - 查询首页所有热帖
	 * @param connection
	 * @param sqName
	 * @param tzTitle
	 * @param pageModel
	 * @return
	 * @throws SQLException
	 */
	@Override
	public List<Tz> admin_selectAllIndexHuoTz(Connection connection,
			String sqName, String tzTitle, PageModel pageModel)
			throws SQLException {
		// TODO Auto-generated method stub
		StringBuilder sb = new StringBuilder();
		sb.append("select * from tz inner join user on tz.userId = user.id inner join sq on tz.sqId = sq.id where tz.status = 2 and 1=1");
		//String sql = "select * from tz inner join user on tz.userId = user.id inner join sq on tz.sqId = sq.id where tz.status = 2 and 1=1";
		List<Object> params = new ArrayList<>();
		if (sqName != null && !sqName.equals("")) {
			sb.append(" and sq.sq_name like ?");
			params.add("%" + sqName + "%");
		}
		if (tzTitle != null && !tzTitle.equals("")) {
			sb.append(" and tz.tz_title like ?");
			params.add("%"+ tzTitle + "%");
		}		
		sb.append(" order by sq.sq_name asc , tz.remarkCount desc");
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.queryByPage(connection, sb.toString(), params.toArray(), pageModel, new ResultSetHandler<List<Tz>>() {
			@Override
			public List<Tz> execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				List<Tz> tzs = new ArrayList<>();
				while (rs.next()) {
					Tz tz = new Tz();
					tz.setId(rs.getInt("id"));
					tz.setTz_title(rs.getString("tz_title"));
					tz.setRemarkCount(rs.getInt("remarkCount"));
					tz.setStatus(rs.getString("status"));
					User user = new User();
					user.setNickname(rs.getString("nickname"));
					Sq sq = new Sq();
					sq.setSq_name(rs.getString("sq_name"));
					tz.setUser(user);
					tz.setSq(sq);
					tzs.add(tz);
				}
				return tzs;
			}
		});
	}

	/**
	 * 后台管理系统 - 查询所有带<img>属性的所有帖子
	 * @param connection
	 * @param pageModel
	 * @return
	 * @throws SQLException
	 */
	@Override
	public List<Tz> admin_selectAllImgTz(Connection connection,
			PageModel pageModel) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from tz inner join user on tz.userId = user.id inner join sq on tz.sqId = sq.id where tz.tz_content like '%<img%' order by sq.sq_name asc, tz.remarkCount desc";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.queryByPage(connection, sql, null, pageModel, new ResultSetHandler<List<Tz>>() {
			@Override
			public List<Tz> execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				List<Tz> tzs = new ArrayList<>();
				while (rs.next()) {
					Tz tz = new Tz();
					tz.setId(rs.getInt("id"));
					tz.setTz_title(rs.getString("tz_title"));
					tz.setRemarkCount(rs.getInt("remarkCount"));
					tz.setStatus(rs.getString("status"));
					User user = new User();
					user.setNickname(rs.getString("nickname"));
					Sq sq = new Sq();
					sq.setSq_name(rs.getString("sq_name"));
					tz.setUser(user);
					tz.setSq(sq);
					tzs.add(tz);
				}
				return tzs;
			}
		});
	}

	/**
	 * 查询要更换帖子的信息
	 * @param connection
	 * @param okId
	 * @return
	 * @throws SQLException
	 */
	@Override
	public Tz admin_selectTzById(Connection connection, String okId)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from tz where id = ?";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, new Object[]{okId}, new ResultSetHandler<Tz>() {
			@Override
			public Tz execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				if (rs.next()) {
					Tz tz = new Tz();
					tz.setId(rs.getInt("id"));
					tz.setTz_content(rs.getString("tz_content"));
					tz.setSqId(rs.getString("sqId"));
					tz.setTz_title(rs.getString("tz_title"));
					return tz;
				}
				return null;
			}
		});
	}


}
