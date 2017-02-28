package org.yxsq.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.tool.page.PageModel;
import org.yxsq.dto.Agsq;
import org.yxsq.dto.PrepareYZ;
import org.yxsq.dto.Tz;
import org.yxsq.dto.User;
import org.yxsq.dto.UserVo;

public interface UserDao {

	/**
	 * 用户登陆
	 * @param connection
	 * @param username
	 * @param password
	 * @return
	 */
	User userLogin(Connection connection, String username, String password) throws SQLException;

	/**
	 * 查询用户的详细信息
	 * @param connection
	 * @param username
	 * @return
	 */
	User selectUser(Connection connection, String nickname) throws SQLException;

	/**
	 *  查询该用户所有爱逛的社区
	 * @param connection
	 * @param id
	 * @return
	 */
	List<Agsq> selectAgsq(Connection connection, int id) throws SQLException;

	/**
	 * 发帖总数
	 * @param connection
	 * @param id
	 * @return
	 */
	int selectTzCount(Connection connection, int id) throws SQLException;

	/**
	 * 查看该用户的所用帖子
	 * @param connection
	 * @param id
	 * @return
	 */
	List<Tz> selectTzs(Connection connection, int id) throws SQLException;

	/**
	 * 根据userId查询用户信息
	 * @param connection
	 * @param valueOf
	 * @return
	 */
	User selectUser(Connection connection, Integer userId)throws SQLException;

	/**
	 * 查询新会员
	 * @param connection
	 * @return
	 * @throws SQLException
	 */
	List<User> selectNewUser(Connection connection) throws SQLException;

	/**
	 * 异步修改用户主页头部背景
	 * @param connection
	 * @param img_src
	 * @param userId
	 * @return
	 * @throws SQLException
	 */
	int updateHomepageImgAjax(Connection connection, String img_src,
			String userId) throws SQLException;

	/**
	 * 根据userId查询该用户的相关信息
	 * @param connection
	 * @param userId
	 * @return
	 */
	User selectUserById(Connection connection, int userId)throws SQLException;

	/**
	 * 异步修改用户的基本信息
	 * @param connection
	 * @param nickname
	 * @param userId
	 * @param sex 
	 * @return
	 * @throws SQLException
	 */
	int updateHomePageUserMesAjax(Connection connection, String nickname,
			String userId, String sex) throws SQLException;

	/**
	 * 修改img的路径
	 * @param connection
	 * @param fileName
	 * @param userId
	 */
	void updateImgsrc(Connection connection, String fileName, String userId)throws SQLException;

	/**
	 * admin -- 后台管理系统 异步登陆
	 * @param connection
	 * @param username
	 * @param password
	 * @return
	 * @throws SQLException
	 */
	User admin_userLoginAjax(Connection connection, String username,
			String password)throws SQLException;

	/**
	 * 后台管理系统 - 多条件查询所有用户
	 * @param connection
	 * @return
	 * @throws SQLException
	 */
	List<User> admin_selectAllUser(Connection connection, PageModel pageModel, String username, String nickname)throws SQLException;

	/**
	 * 先按条件查询满足条件的所有会员信息，不分页，查询所有
	 * @param connection
	 * @param username
	 * @param nickname
	 * @return
	 * @throws SQLException
	 */
	List<UserVo> select_Admin_excelHY(Connection connection, String username,
			String nickname)throws SQLException;

	/**
	 * 注册用户时 异步校验username是否存在
	 * @param connection
	 * @param username
	 * @return
	 * @throws SQLException
	 */
	User check_usernameAjax(Connection connection, String username)throws SQLException;

	/**
	 * 注册用户时 异步校验nickname是否存在
	 * @param connection
	 * @param nickname
	 * @return
	 * @throws SQLException
	 */
	User check_nicknamenameAjax(Connection connection, String nickname)throws SQLException;

	/**
	 * 注册用户时 异步校验email是否存在
	 * @param connection
	 * @param email
	 * @return
	 * @throws SQLException
	 */
	User check_emailAjax(Connection connection, String email)throws SQLException;

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
	void addUser(Connection connection, String username, String password,
			String nickname, String email, String yzm)throws SQLException;

	/**
	 * 激活用户
	 * @param connection
	 * @param username
	 * @throws SQLException
	 */
	void activeUser(Connection connection, String username)throws SQLException;

	/**
	 * 后台管理系统 - 修改用户资料
	 * @param connection
	 * @param id
	 * @param username
	 * @param password
	 * @param nickname
	 * @param email
	 * @param sex 
	 * @param status 
	 * @throws SQLException
	 */
	void admin_updateUserById(Connection connection, String id,
			String username, String password, String nickname, String email, String sex, String status)throws SQLException;

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
	void admin_addUser(Connection connection, String username, String password,
			String nickname, String email, String sex, String status)throws SQLException;

	/**
	 * 后台管理系统 - 查询各个社区的Y主申请
	 * @param connection
	 * @return
	 * @throws SQLException
	 */
	List<PrepareYZ> admin_selectAllPrepareUserYZ(Connection connection, PageModel pageModel)throws SQLException;

	/**
	 * 后台管理系统 - 查询所有Y主申请总数Count
	 * @param connection
	 * @return
	 * @throws SQLException
	 */
	int admin_selectPrepareUserCount(Connection connection)throws SQLException;

	/**
	 * 修改user表的yz_sqId
	 * @param connection
	 * @param userId
	 * @param sqId
	 * @throws SQLException
	 */
	void admin_passPrepareUser(Connection connection, String userId, String sqId)throws SQLException;

	/**
	 * 删除刚刚的prepare_yz通过的那条记录
	 * @param connection
	 * @param id
	 * @throws SQLException
	 */
	void admin_deletePrepareUserById(Connection connection, String id)throws SQLException;

	/**
	 * 后台管理系统 - 不通过用户Y主申请
	 * @param connection
	 * @param id
	 * @throws SQLException
	 */
	void admin_failPrepareUser(Connection connection, String id)throws SQLException;

	/**
	 * 修改用户最近浏览信息
	 * @param connection
	 * @param nickname
	 * @param zjll
	 * @throws SQLException
	 */
	void updateUserZjll(Connection connection, String nickname, String zjll)throws SQLException;


}
