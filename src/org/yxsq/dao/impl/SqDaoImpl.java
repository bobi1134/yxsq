package org.yxsq.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.tool.page.PageModel;
import org.yxsq.dao.SqDao;
import org.yxsq.dao.support.QueryRunner;
import org.yxsq.dao.support.ResultSetHandler;
import org.yxsq.dto.Bb;
import org.yxsq.dto.PrepareSq;
import org.yxsq.dto.Sq;
import org.yxsq.dto.SqVo;

public class SqDaoImpl implements SqDao {

	/**
	 * 查询所有的社区
	 * @param connection
	 * @return
	 */
	@Override
	public List<Sq> selectSq(Connection connection) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from sq order by sq_location asc , sq_name desc";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, null, new ResultSetHandler<List<Sq>>() {

			@Override
			public List<Sq> execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				List<Sq> sqs = new ArrayList<>();
				while (rs.next()) {
					Sq sq = new Sq();
					sq.setId(rs.getString("id"));
					sq.setSq_name(rs.getString("sq_name"));
					sq.setSq_introduction(rs.getString("sq_introduction"));
					sq.setSq_img(rs.getString("sq_img"));
					sqs.add(sq);
				}
				return sqs;
			}
		});
	}

	/**
	 * 根据社区名进入社区
	 * @param connection
	 * @param sqName
	 * @return
	 */
	@Override
	public Sq sqGo(Connection connection, String sqName)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from sq where sq_name = ?";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, new Object[]{sqName}, new ResultSetHandler<Sq>() {
			@Override
			public Sq execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				if (rs.next()) {
					Sq sq = new Sq();
					sq.setId(rs.getString("id"));
					sq.setSq_name(rs.getString("sq_name"));
					sq.setSq_introduction(rs.getString("sq_introduction"));
					sq.setSq_logo_img(rs.getString("sq_logo_img"));
					sq.setSq_img(rs.getString("sq_img"));
					sq.setSq_location(rs.getString("sq_location"));
					sq.setSq_yz(rs.getString("sq_yz"));
					return sq;
				}
				return null;
			}
		});
	}

	/**
	 * 根据社区id查询相应社区的详细信息
	 * @param connection
	 * @param sqId
	 * @return
	 * @throws SQLException
	 */
	@Override
	public Sq selectSqBySqId(Connection connection, String sqId)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from sq where id = ?";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, new Object[]{sqId}, new ResultSetHandler<Sq>() {
			@Override
			public Sq execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				if (rs.next()) {
					Sq sq = new Sq();
					sq.setId(rs.getString("id"));
					sq.setSq_name(rs.getString("sq_name"));
					sq.setSq_introduction(rs.getString("sq_introduction"));
					sq.setSq_logo_img(rs.getString("sq_logo_img"));
					sq.setSq_img(rs.getString("sq_img"));
					sq.setSq_location(rs.getString("sq_location"));
					sq.setSq_pano(rs.getString("sq_pano"));
					sq.setSq_yz(rs.getString("sq_yz"));
					return sq;
				}
				return null;
			}
		});
	}

	/**
	 * 准备社区总数
	 * @return
	 * @throws SQLException
	 */
	@Override
	public int selectSqCount(Connection connection) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from sq";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, null, new ResultSetHandler<Integer>() {
			@Override
			public Integer execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				int sqCount = 0;
				while (rs.next()) {
					sqCount++;
				}
				return sqCount;
			}
		});
	}

	/**
	 * 修改社区基本资料
	 * @param connection
	 * @param fileName_1
	 * @param fileName_2
	 * @throws SQLException
	 */
	@Override
	public void updateSqZL(Connection connection, String sq_introduction, String fileName_1,
			String fileName_2, String sqId) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "update sq set sq_introduction = ?, sq_logo_img = ?, sq_img = ? where id = ?";
		new QueryRunner().update(connection, sql, new Object[]{sq_introduction, fileName_1, fileName_2, sqId});
	}

	/**
	 * 发送建立社区请求
	 * @param connection
	 * @param sqName
	 * @param sqIntroduction
	 * @param sqLocation
	 * @throws SQLException
	 */
	@Override
	public void addSqRequest(Connection connection, String sqName,
			String sqIntroduction, String sqLocation) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "insert into prepare_sq (sq_name, sq_introduction, sq_location) values(?,?,?)";
		new QueryRunner().update(connection, sql, new Object[]{sqName, sqIntroduction, sqLocation});
		
	}

	/**
	 * 后台管理系统 - 多条件查询社区
	 * @param connection
	 * @param pageModel
	 * @return
	 * @throws SQLException
	 */
	@Override
	public List<Sq> admin_selectAllSq(Connection connection, PageModel pageModel, String sq_name, String sq_location)
			throws SQLException {
		// TODO Auto-generated method stub
		StringBuilder sb = new StringBuilder();
		sb.append("select * from sq where 1 = 1");
		List<Object> params = new ArrayList<>();
		if (sq_name != null && !sq_name.equals("")) {
			sb.append(" and sq_name like ?");
			params.add("%" + sq_name + "%");
		}
		if (sq_location != null && !sq_location.equals("")) {
			sb.append(" and sq_location like ?");
			params.add("%" + sq_location + "%");
		}
		sb.append(" order by sq_location asc , sq_name desc");
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.queryByPage(connection, sb.toString(), params.toArray(), pageModel, new ResultSetHandler<List<Sq>>() {
			@Override
			public List<Sq> execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				List<Sq> sqs = new ArrayList<>();
				while (rs.next()) {
					Sq sq = new Sq();
					sq.setId(rs.getString("id"));
					sq.setSq_name(rs.getString("sq_name"));
					sq.setSq_introduction(rs.getString("sq_introduction"));
					sq.setSq_logo_img(rs.getString("sq_logo_img"));
					sq.setSq_img(rs.getString("sq_img"));
					sq.setSq_location(rs.getString("sq_location"));
					sq.setSq_pano(rs.getString("sq_pano"));
					sqs.add(sq);
				}
				return sqs;
			}
		});
	}

	/**
	 * 先查询满足条件的社区 -- 不分页
	 * @param connection
	 * @param sq_name
	 * @param sq_location
	 * @return
	 * @throws SQLException
	 */
	@Override
	public List<SqVo> select_Admin_excelSQ(Connection connection, String sq_name,
			String sq_location) throws SQLException {
		// TODO Auto-generated method stub
		StringBuilder sb = new StringBuilder();
		sb.append("select * from sq where 1 = 1");
		List<Object> params = new ArrayList<>();
		if (sq_name != null && !sq_name.equals("")) {
			sb.append(" and sq_name like ?");
			params.add("%" + sq_name + "%");
		}
		if (sq_location != null && !sq_location.equals("")) {
			sb.append(" and sq_location like ?");
			params.add("%" + sq_location + "%");
		}
		sb.append(" order by sq_location asc");
		System.out.println(sb.toString());
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sb.toString(), params.toArray(), new ResultSetHandler<List<SqVo>>() {
			@Override
			public List<SqVo> execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				List<SqVo> sqs = new ArrayList<>();
				while (rs.next()) {
					SqVo sqVo = new SqVo();
					sqVo.setId(rs.getString("id"));
					sqVo.setSq_name(rs.getString("sq_name"));
					sqVo.setSq_introduction(rs.getString("sq_introduction"));
					sqVo.setSq_logo_img(rs.getString("sq_logo_img"));
					sqVo.setSq_img(rs.getString("sq_img"));
					sqVo.setSq_location(rs.getString("sq_location"));
					sqs.add(sqVo);
				}
				return sqs;
			}
		});
	}

	/**
	 * 先准备还需要处理条数
	 * @param connection
	 * @return
	 * @throws SQLException
	 */
	@Override
	public int admin_selectPrepareSqCount(Connection connection)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from prepare_sq";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, null, new ResultSetHandler<Integer>() {
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
	 * 后台管理系统 - 查询所有建立社区申请
	 * @param connection
	 * @param pageModel
	 * @return
	 * @throws SQLException
	 */
	@Override
	public List<PrepareSq> admin_selectAllPrepareSq(Connection connection,
			PageModel pageModel) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from prepare_sq";
		QueryRunner queryRunner = new QueryRunner(); 
		return queryRunner.queryByPage(connection, sql, null, pageModel, new ResultSetHandler<List<PrepareSq>>() {
			@Override
			public List<PrepareSq> execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				List<PrepareSq> prepareSqs = new ArrayList<>();
				while (rs.next()) {
					PrepareSq prepareSq = new PrepareSq();
					prepareSq.setId(rs.getString("id"));
					prepareSq.setSq_name(rs.getString("sq_name"));
					prepareSq.setSq_introduction(rs.getString("sq_introduction"));
					prepareSq.setSq_location(rs.getString("sq_location"));
					prepareSqs.add(prepareSq);
				}
				return prepareSqs;
			}
		});
	}

	/**
	 * 根据id获取申请社区
	 * @param connection
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	@Override
	public PrepareSq admin_selectPrepareById(Connection connection, String id)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from prepare_sq where id = ?";
		QueryRunner queryRunner = new QueryRunner(); 
		return queryRunner.query(connection, sql, new Object[]{id}, new ResultSetHandler<PrepareSq>() {
			@Override
			public PrepareSq execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				if (rs.next()) {
					PrepareSq prepareSq = new PrepareSq();
					prepareSq.setId(rs.getString("id"));
					prepareSq.setSq_name(rs.getString("sq_name"));
					prepareSq.setSq_introduction(rs.getString("sq_introduction"));
					prepareSq.setSq_location(rs.getString("sq_location"));
					return prepareSq;
				}
				return null;
			}
		});
	}

	/**
	 * 添加新社区
	 * @param connection
	 * @param prepareSq
	 * @throws SQLException
	 */
	@Override
	public void admin_insertNewSq(Connection connection, PrepareSq prepareSq)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "insert into sq(sq_name, sq_introduction, sq_logo_img, sq_img, sq_location) value(?,?,?,?,?);";
		new QueryRunner().update(connection, sql, new Object[]{prepareSq.getSq_name(), 
															   prepareSq.getSq_introduction(), 
															   "sq_logo_img_mr.png",
															   "sq_img_mr.jpg",
															   prepareSq.getSq_location()});
	}

	/**
	 * 后台管理系统 - 查询该社区最大id
	 * @param connection
	 * @return
	 * @throws SQLException
	 */
	@Override
	public Sq admin_selectMaxId(Connection connection) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from sq order by id desc limit 0,1";
		QueryRunner queryRunner = new QueryRunner(); 
		return queryRunner.query(connection, sql, null, new ResultSetHandler<Sq>() {
			@Override
			public Sq execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				if (rs.next()) {
					Sq sq = new Sq();
					sq.setId(rs.getString("id"));
					return sq;
				}
				return null;
			}
		});
	}

	/**
	 * 后台管理系统 - 删除申请的社区
	 * @param connection
	 * @param id
	 */
	@Override
	public void admin_deletePrapareSl(Connection connection, String id)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "delete from prepare_sq where id = ?";
		new QueryRunner().update(connection, sql, new Object[]{id});
	}

	/**
	 * 后台管理系统 - 拦截社区建立请求：即根据id删除相应id
	 * @param connection
	 * @param id
	 * @throws SQLException
	 */
	@Override
	public void admin_failPrepareSq(Connection connection, String id)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "delete from prepare_sq where id = ?";
		new QueryRunner().update(connection, sql, new Object[]{id});
	}

	/**
	 * 查询该社区所有表白信
	 * @param connection
	 * @param sqId
	 * @return
	 * @throws SQLException
	 */
	@Override
	public List<Bb> selectBbsBySqId(Connection connection, String sqId, PageModel pageModel)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from bb where sqId = ? order by bb_time desc";
		QueryRunner queryRunner = new QueryRunner(); 
		return queryRunner.queryByPage(connection, sql, new Object[]{sqId}, pageModel, new ResultSetHandler<List<Bb>>() {
			@Override
			public List<Bb> execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				List<Bb> bbs = new ArrayList<>();
				while (rs.next()) {
					Bb bb = new Bb();
					bb.setId(rs.getInt("id"));
					bb.setBb_content(rs.getString("bb_content"));
					bb.setBb_user(rs.getString("bb_user"));
					bbs.add(bb);
				}
				return bbs;
			}
		});
	}

	/**
	 * 社区异步添加表白
	 * @param connection
	 * @param sqId
	 * @return
	 * @throws SQLException
	 */
	@Override
	public int addBb(Connection connection, String sqId, String bb_content, String bb_user) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "insert into bb(bb_content,bb_user,bb_time,sqId) values(?,?,?,?)";
		return new QueryRunner().update(connection, sql, new Object[]{bb_content,
																	  bb_user,
																	  new Date(),
																	  sqId
																		
		});
	}

	/**
	 * 后台管理系统 - 跳到修改社区资料页面
	 * @param connection
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	@Override
	public Sq admin_selectSqById(Connection connection, String id)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from sq where id = ?";
		QueryRunner queryRunner = new QueryRunner(); 
		return queryRunner.query(connection, sql, new Object[]{id}, new ResultSetHandler<Sq>() {
			@Override
			public Sq execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				if (rs.next()) {
					Sq sq = new Sq();
					sq.setId(rs.getString("id"));
					sq.setSq_name(rs.getString("sq_name"));
					sq.setSq_introduction(rs.getString("sq_introduction"));
					sq.setSq_location(rs.getString("sq_location"));
					sq.setSq_pano(rs.getString("sq_pano"));
					return sq;
				}
				return null;
			}
		});
	}

	/**
	 * 后台管理系统 - 修改社区资料
	 * @param connection
	 * @param id
	 * @param sq_name
	 * @param sq_introduction
	 * @param sq_location
	 * @param sq_pano
	 * @throws SQLException
	 */
	@Override
	public void updateSqById(Connection connection, String id, String sq_name,
			String sq_introduction, String sq_location, String sq_pano)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "update sq set sq_name=?,sq_introduction=?,sq_location=?,sq_pano=? where id = ?";
		new QueryRunner().update(connection, sql, new Object[]{sq_name,
															   sq_introduction,
															   sq_location,
															   sq_pano,
															   id});
	}

	/**
	 * 用户异步申请社区Y主
	 * @param connection
	 * @param apply_sq
	 * @param apply_usernickname
	 * @param introduce
	 * @param apply_reason
	 * @param userId
	 * @return
	 * @throws SQLException
	 */
	@Override
	public int applySqYZFormAjax(Connection connection, String apply_sq,
			String apply_usernickname, String introduce, String apply_reason,
			String userId, String sqId) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "insert into prepare_yz (apply_sq,apply_usernickname,introduce,apply_reason,sqId,userId) values(?,?,?,?,?,?)";
		return new QueryRunner().update(connection, sql, new Object[]{apply_sq,
																	  apply_usernickname,
																	  introduce,
																	  apply_reason,
																	  sqId,
																	  userId});
	}

	/**
	 * 后台管理系统 - 修改sq变的sq_yz状态
	 * @param connection
	 * @param sqId
	 * @throws SQLException
	 */
	@Override
	public void admin_updateSqYzStatus(Connection connection, String sqId)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "update sq set sq_yz = ? where id = ?";
		new QueryRunner().update(connection, sql, new Object[]{"1", sqId});
	}

	/**
	 * 异步添加用户爱逛社区
	 * @param connection
	 * @param agsq_name
	 * @throws SQLException
	 */
	@Override
	public void addAgsqAjax(Connection connection, String agsq_name, String userId)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "insert into agsq(agsq_name, userId, add_Time) values(?,?,?)";
		new QueryRunner().update(connection, sql, new Object[]{agsq_name, userId, new Date()});
	}


}
