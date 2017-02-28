package org.yxsq.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.tool.page.PageModel;
import org.yxsq.dao.UserDao;
import org.yxsq.dao.support.QueryRunner;
import org.yxsq.dao.support.ResultSetHandler;
import org.yxsq.dto.Agsq;
import org.yxsq.dto.PrepareYZ;
import org.yxsq.dto.Sq;
import org.yxsq.dto.Tz;
import org.yxsq.dto.User;
import org.yxsq.dto.UserVo;

public class UserDaoImpl implements UserDao {

	/**
	 * 用户登陆
	 * @param connection
	 * @param username
	 * @param password
	 * @return
	 */
	@Override
	public User userLogin(Connection connection, String username,
			String password) throws SQLException {
		String sql = "select * from user where username = ? and password = ? and active = 1";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, new Object[]{username, password}, new ResultSetHandler<User>() {

			@Override
			public User execute(ResultSet rs) throws SQLException {
				if (rs.next()) {
					User user = new User();
					user.setId(rs.getInt("id"));
					user.setUsername(rs.getString("username"));
					user.setNickname(rs.getString("nickname"));
					user.setAge(rs.getTimestamp("age"));
					user.setImg(rs.getString("img"));
					user.setStatus(rs.getInt("status"));
					user.setYz_sqId(rs.getString("yz_sqId"));
					return user;
				}
				return null;
			}
		});
	}

	/**
	 * 查询用户的详细信息
	 * @param connection
	 * @param username
	 * @return
	 */
	@Override
	public User selectUser(Connection connection, String nickname)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from user where nickname = ?";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, new Object[]{nickname}, new ResultSetHandler<User>() {

			@Override
			public User execute(ResultSet rs) throws SQLException {
				if (rs.next()) {
					User user = new User();
					user.setId(rs.getInt("id"));
					user.setUsername(rs.getString("username"));
					user.setNickname(rs.getString("nickname"));
					user.setAge(rs.getTimestamp("age"));
					user.setImg(rs.getString("img"));
					user.setHomepage_img(rs.getString("homepage_img"));
					user.setSex(rs.getInt("sex"));
					user.setSee_Id(rs.getString("see_Id"));
					return user;
				}
				return null;
			}
		});
	}

	/**
	 *  查询该用户所有爱逛的社区
	 * @param connection
	 * @param id
	 * @return
	 */
	@Override
	public List<Agsq> selectAgsq(Connection connection, int id)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from user inner join agsq on user.id = agsq.userId where user.id = ? order by agsq.add_time desc";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, new Object[]{id}, new ResultSetHandler<List<Agsq>>() {

			@Override
			public List<Agsq> execute(ResultSet rs) throws SQLException {
				List<Agsq> agsqs = new ArrayList<>();
				while (rs.next()) {
					Agsq agsq = new Agsq();
					agsq.setId(rs.getInt("id"));
					agsq.setAgsq_name(rs.getString("agsq_name"));
					agsqs.add(agsq);
				}
				return agsqs;
			}

			
		});
	}

	/**
	 * 发帖总数
	 * @param connection
	 * @param id
	 * @return
	 */
	@Override
	public int selectTzCount(Connection connection, int id) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from user inner join tz on user.id = tz.userId where user.id = ?";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, new Object[]{id}, new ResultSetHandler<Integer>() {

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
	 * 查看该用户的所用帖子
	 * @param connection
	 * @param id
	 * @return
	 */
	@Override
	public List<Tz> selectTzs(Connection connection, int id)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from tz inner join user on user.id = tz.userId inner join sq on tz.sqId = sq.id where sq.sq_name in (select agsq.agsq_name from user inner join agsq on user.id = agsq.userId where user.id = ?)";
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
					sq.setSq_logo_img(rs.getString("sq_logo_img"));
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
	 * 根据userId查询用户信息
	 * @param connection
	 * @param valueOf
	 * @return
	 */
	@Override
	public User selectUser(Connection connection, Integer userId)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from user where id = ?";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, new Object[]{userId}, new ResultSetHandler<User>() {
			@Override
			public User execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				if (rs.next()) {
					User user = new User();
					user.setId(rs.getInt("id"));
					user.setUsername(rs.getString("username"));
					user.setNickname(rs.getString("nickname"));
					user.setAge(rs.getTimestamp("age"));
					user.setImg(rs.getString("img"));
					user.setHomepage_img(rs.getString("homepage_img"));
					user.setSex(rs.getInt("sex"));
					user.setSee_Id(rs.getString("see_Id"));
					return user;
				}
				return null;
			}
		});
	}

	/**
	 * 查询新会员
	 * @param connection
	 * @return
	 * @throws SQLException
	 */
	@Override
	public List<User> selectNewUser(Connection connection) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from user order by age desc limit 0, 10";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, null, new ResultSetHandler<List<User>>() {
			@Override
			public List<User> execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				List<User> users = new ArrayList<>();
				while (rs.next()) {
					User user = new User();
					user.setNickname(rs.getString("nickname"));
					user.setAge(rs.getTimestamp("age"));
					users.add(user);
				}
				return users;
			}
		});
	}

	/**
	 * 异步修改用户主页头部背景
	 * @param connection
	 * @param img_src
	 * @param userId
	 * @return
	 * @throws SQLException
	 */
	@Override
	public int updateHomepageImgAjax(Connection connection, String img_src,
			String userId) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "update user set homepage_img = ? where id = ?";
		return new QueryRunner().update(connection, sql, new Object[]{img_src, userId});
	}

	/**
	 * 根据userId查询该用户的相关信息
	 * @param connection
	 * @param userId
	 * @return
	 */
	@Override
	public User selectUserById(Connection connection, int userId)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from user where id = ?";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, new Object[]{userId}, new ResultSetHandler<User>() {
			@Override
			public User execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				if (rs.next()) {
					User user = new User();
					user.setId(rs.getInt("id"));
					user.setUsername(rs.getString("username"));
					user.setPassword(rs.getString("password"));
					user.setNickname(rs.getString("nickname"));
					user.setEmail(rs.getString("email"));
					user.setSex(rs.getInt("sex"));
					user.setStatus(rs.getInt("status"));
					user.setImg(rs.getString("img"));
					return user;
				}
				return null;
			}
		});
	}

	/**
	 * 异步修改用户的基本信息
	 * @param connection
	 * @param nickname
	 * @param userId
	 * @return
	 * @throws SQLException
	 */
	@Override
	public int updateHomePageUserMesAjax(Connection connection,
			String nickname, String userId, String sex) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "update user set nickname = ?, sex = ? where id = ?";
		return new QueryRunner().update(connection, sql, new Object[]{nickname, sex, userId});
	}

	/**
	 * 修改img的路径
	 * @param connection
	 * @param fileName
	 * @param userId
	 */
	@Override
	public void updateImgsrc(Connection connection, String fileName,
			String userId) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "update user set img = ? where id = ?";
		new QueryRunner().update(connection, sql, new Object[]{fileName, userId});
	}

	/**
	 * admin -- 后台管理系统 异步登陆
	 * @param connection
	 * @param username
	 * @param password
	 * @return
	 * @throws SQLException
	 */
	@Override
	public User admin_userLoginAjax(Connection connection, String username,
			String password) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from user where status = 1 and username = ? and password = ? and active = 1";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, new Object[]{username, password}, new ResultSetHandler<User>() {
			@Override
			public User execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				if (rs.next()) {
					User user = new User();
					user.setId(rs.getInt("id"));
					user.setNickname(rs.getString("nickname"));
					user.setStatus(rs.getInt("status"));
					user.setImg(rs.getString("img"));
					return user;
				}
				return null;
			}
		});
	}

	/**
	 * 后台管理系统 - 多条件查询所有用户
	 * @param connection
	 * @return
	 * @throws SQLException
	 */
	@Override
	public List<User> admin_selectAllUser(Connection connection, PageModel pageModel, String username, String nickname)
			throws SQLException {
		// TODO Auto-generated method stub
		StringBuilder sb = new StringBuilder();
		sb.append("select * from user where 1 = 1");
		List<Object> params = new ArrayList<>();
		if (username != null && !username.equals("")) {
			sb.append(" and username like ?");
			params.add("%" + username + "%");
		}
		if (nickname != null && !nickname.equals("")) {
			sb.append(" and nickname like ?");
			params.add("%" + nickname + "%");
		}
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.queryByPage(connection, sb.toString(), params.toArray(), pageModel, new ResultSetHandler<List<User>>() {
			@Override
			public List<User> execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				List<User> users = new ArrayList<>();
				while (rs.next()) {
					User user = new User();
					user.setId(rs.getInt("id"));
					user.setUsername(rs.getString("username"));
					user.setNickname(rs.getString("nickname"));
					user.setSex(rs.getInt("sex"));
					user.setAge(rs.getTimestamp("age"));
					user.setStatus(rs.getInt("status"));
					users.add(user);
				}
				return users;
			}
		});
	}

	/**
	 * 先按条件查询满足条件的所有会员信息，不分页，查询所有
	 * @param connection
	 * @param username
	 * @param nickname
	 * @return
	 * @throws SQLException
	 */
	@Override
	public List<UserVo> select_Admin_excelHY(Connection connection,
			String username, String nickname) throws SQLException {
		// TODO Auto-generated method stub
		StringBuilder sb = new StringBuilder();
		sb.append("select * from user where 1 = 1");
		List<Object> params = new ArrayList<>();
		if (username != null && !username.equals("")) {
			sb.append(" and username like ?");
			params.add("%" + username + "%");
		}
		if (nickname != null && !nickname.equals("")) {
			sb.append(" and nickname like ?");
			params.add("%" + nickname + "%");
		}
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sb.toString(), params.toArray(), new ResultSetHandler<List<UserVo>>() {
			@Override
			public List<UserVo> execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				List<UserVo> userVos = new ArrayList<>();
				while (rs.next()) {
					UserVo userVo = new UserVo();
					userVo.setId(rs.getInt("id"));
					userVo.setUsername(rs.getString("username"));
					userVo.setNickname(rs.getString("nickname"));
					userVo.setSex(rs.getInt("sex"));
					userVo.setStatus(rs.getInt("status"));
					userVo.setAge(rs.getString("age"));
					userVos.add(userVo);
					
				}
				return userVos;
			}
		});
	}

	/**
	 * 注册用户时 异步校验username是否存在
	 * @param connection
	 * @param username
	 * @return
	 * @throws SQLException
	 */
	@Override
	public User check_usernameAjax(Connection connection, String username)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from user where username = ?";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, new Object[]{username}, new ResultSetHandler<User>() {
			@Override
			public User execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				if (rs.next()) {
					User user = new User();
					user.setUsername(rs.getString("username"));
					return user;
				}
				return null;
			}
		});
	}

	/**
	 * 注册用户时 异步校验nickname是否存在
	 * @param connection
	 * @param nickname
	 * @return
	 * @throws SQLException
	 */
	@Override
	public User check_nicknamenameAjax(Connection connection, String nickname)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from user where nickname = ?";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, new Object[]{nickname}, new ResultSetHandler<User>() {
			@Override
			public User execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				if (rs.next()) {
					User user = new User();
					user.setNickname(rs.getString("nickname"));
					return user;
				}
				return null;
			}
		});
	}

	/**
	 * 注册用户时 异步校验email是否存在
	 * @param connection
	 * @param email
	 * @return
	 * @throws SQLException
	 */
	@Override
	public User check_emailAjax(Connection connection, String email)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from user where email = ?";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.query(connection, sql, new Object[]{email}, new ResultSetHandler<User>() {
			@Override
			public User execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				if (rs.next()) {
					User user = new User();
					user.setEmail(rs.getString("email"));
					return user;
				}
				return null;
			}
		});
	}

	/**
	 * 添加用户
	 * @param connection
	 * @param username
	 * @param password
	 * @param nickname
	 * @param email
	 * @param yzm
	 * @throws SQLException
	 */
	@Override
	public void addUser(Connection connection, String username,
			String password, String nickname, String email, String yzm)
			throws SQLException {
		// TODO Auto-generated method stub
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String sql = "insert into USER(username,password,sex,nickname,age,email,img,homepage_img,status,active) values(?,?,?,?,?,?,?,?,?,?)";
		new QueryRunner().update(connection, sql, new Object[]{username,
															   password, 
															   "1",
															   nickname,
															   sdf.format(date),
															   email,
															   "user_mr.jpg",
															   "1.jpg",
															   "3",
															   "2"});
	}

	/**
	 * 激活用户
	 * @param connection
	 * @param username
	 * @throws SQLException
	 */
	@Override
	public void activeUser(Connection connection, String username)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "update user set active = 1 where username = ?";
		new QueryRunner().update(connection, sql, new Object[]{username});
	}

	/**
	 * 后台管理系统 - 修改用户资料
	 * @param connection
	 * @param id
	 * @param username
	 * @param password
	 * @param nickname
	 * @param email
	 * @throws SQLException
	 */
	@Override
	public void admin_updateUserById(Connection connection, String id,
			String username, String password, String nickname, String email, String sex, String status)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "update user set username=?,password=?,sex=?,nickname=?,email=?,status=? where id = ?";
		new QueryRunner().update(connection, sql, new Object[]{username, password, sex, nickname, email, status, id});
	}

	/**
	 * 后台管理系统 - 添加用户
	 * @param connection
	 * @param username
	 * @param password
	 * @param nickname
	 * @param email
	 * @param sex
	 * @param status
	 * @throws SQLException
	 */
	@Override
	public void admin_addUser(Connection connection, String username,
			String password, String nickname, String email, String sex,
			String status) throws SQLException {
		// TODO Auto-generated method stub
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String sql = "insert into USER(username,password,sex,nickname,age,email,img,homepage_img,status,active) values(?,?,?,?,?,?,?,?,?,?)";
		new QueryRunner().update(connection, sql, new Object[]{username,
															   password,
															   sex,
															   nickname,
															   sdf.format(date),
															   email,
															   "user_mr.jpg",
															   "1.jpg",
															   status,
															   "1"
															  });
	}

	/**
	 * 后台管理系统 - 查询各个社区的Y主申请
	 * @param connection
	 * @return
	 * @throws SQLException
	 */
	@Override
	public List<PrepareYZ> admin_selectAllPrepareUserYZ(Connection connection, PageModel pageModel)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from prepare_yz order by apply_sq asc";
		QueryRunner queryRunner = new QueryRunner();
		return queryRunner.queryByPage(connection, sql, null, pageModel, new ResultSetHandler<List<PrepareYZ>>() {
			@Override
			public List<PrepareYZ> execute(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				List<PrepareYZ> prepareYZs = new ArrayList<>();
				while (rs.next()) {
					PrepareYZ prepareYZ = new PrepareYZ();
					prepareYZ.setId(rs.getString("id"));
					prepareYZ.setApply_sq(rs.getString("apply_sq"));
					prepareYZ.setApply_usernickname(rs.getString("apply_usernickname"));
					prepareYZ.setIntroduce(rs.getString("introduce"));
					prepareYZ.setApply_reason(rs.getString("apply_reason"));
					prepareYZ.setSqId(rs.getString("sqId"));
					prepareYZ.setUserId(rs.getString("userId"));
					prepareYZs.add(prepareYZ);
				}
				return prepareYZs;
			}
		});
	}

	/**
	 * 后台管理系统 - 查询所有Y主申请总数Count
	 * @param connection
	 * @return
	 * @throws SQLException
	 */
	@Override
	public int admin_selectPrepareUserCount(Connection connection)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from prepare_yz";
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
	 * 修改user表的yz_sqId
	 * @param connection
	 * @param userId
	 * @param sqId
	 * @throws SQLException
	 */
	@Override
	public void admin_passPrepareUser(Connection connection, String userId,
			String sqId) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "update user set yz_sqId = ?, status = ? where id = ?";
		new QueryRunner().update(connection, sql, new Object[]{sqId, "2", userId});
	}

	/**
	 * 删除刚刚的prepare_yz通过的那条记录
	 * @param connection
	 * @param id
	 * @throws SQLException
	 */
	@Override
	public void admin_deletePrepareUserById(Connection connection, String id)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "delete from prepare_yz where id = ?";
		new QueryRunner().update(connection, sql, new Object[]{id});
	}

	/**
	 * 后台管理系统 - 不通过用户Y主申请
	 * @param connection
	 * @param id
	 * @throws SQLException
	 */
	@Override
	public void admin_failPrepareUser(Connection connection, String id)
			throws SQLException {
		// TODO Auto-generated method stub
		String sql = "delete from prepare_yz where id = ?";
		new QueryRunner().update(connection, sql, new Object[]{id});
	}

	
	/**
	 * 修改用户最近浏览信息
	 * @param connection
	 * @param nickname
	 * @param zjll
	 * @throws SQLException
	 */
	@Override
	public void updateUserZjll(Connection connection, String nickname,
			String zjll) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "update user set see_Id = ? where nickname = ?";
		new QueryRunner().update(connection, sql, new Object[]{zjll, nickname});
	}


}
