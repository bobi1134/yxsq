package org.yxsq.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.tool.page.PageModel;
import org.yxsq.dto.Bb;
import org.yxsq.dto.PrepareSq;
import org.yxsq.dto.Sq;
import org.yxsq.dto.SqVo;

public interface SqDao {

	/**
	 * 查询所有的社区
	 * @param connection
	 * @return
	 */
	List<Sq> selectSq(Connection connection) throws SQLException;

	/**
	 * 根据社区名进入社区
	 * @param connection
	 * @param sqName
	 * @return
	 */
	Sq sqGo(Connection connection, String sqName) throws SQLException;

	/**
	 * 根据社区id查询相应社区的详细信息
	 * @param connection
	 * @param sqId
	 * @return
	 * @throws SQLException
	 */
	Sq selectSqBySqId(Connection connection, String sqId)throws SQLException;

	/**
	 * 准备社区总数
	 * @return
	 * @throws SQLException
	 */
	int selectSqCount(Connection connection)throws SQLException;

	/**
	 * 修改社区基本资料
	 * @param connection
	 * @param fileName_1
	 * @param fileName_2
	 * @param sq_introduction 
	 * @throws SQLException
	 */
	void updateSqZL(Connection connection, String sq_introduction, String fileName_1, String fileName_2, String sqId)throws SQLException;

	/**
	 * 发送建立社区请求
	 * @param connection
	 * @param sqName
	 * @param sqIntroduction
	 * @param sqLocation
	 * @throws SQLException
	 */
	void addSqRequest(Connection connection, String sqName,
			String sqIntroduction, String sqLocation)throws SQLException;

	/**
	 * 后台管理系统 - 多条件查询社区
	 * @param connection
	 * @param pageModel
	 * @return
	 * @throws SQLException
	 */
	List<Sq> admin_selectAllSq(Connection connection, PageModel pageModel, String sq_name, String sq_location)throws SQLException;

	/**
	 * 先查询满足条件的社区 -- 不分页
	 * @param connection
	 * @param sq_name
	 * @param sq_location
	 * @return
	 * @throws SQLException
	 */
	List<SqVo> select_Admin_excelSQ(Connection connection, String sq_name,
			String sq_location)throws SQLException;

	/**
	 * 先准备还需要处理条数
	 * @param connection
	 * @return
	 * @throws SQLException
	 */
	int admin_selectPrepareSqCount(Connection connection)throws SQLException;

	/**
	 * 后台管理系统 - 查询所有建立社区申请
	 * @param connection
	 * @param pageModel
	 * @return
	 * @throws SQLException
	 */
	List<PrepareSq> admin_selectAllPrepareSq(Connection connection,
			PageModel pageModel)throws SQLException;

	/**
	 * 后台管理系统 - 根据id获取申请社区
	 * @param connection
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	PrepareSq admin_selectPrepareById(Connection connection, String id)throws SQLException;

	/**
	 * 后台管理系统 - 添加新社区
	 * @param connection
	 * @param prepareSq
	 * @throws SQLException
	 */
	void admin_insertNewSq(Connection connection, PrepareSq prepareSq)throws SQLException;

	/**
	 * 后台管理系统 - 查询该社区最大id
	 * @param connection
	 * @return
	 * @throws SQLException
	 */
	Sq admin_selectMaxId(Connection connection)throws SQLException;

	/**
	 * 后台管理系统 - 删除申请的社区
	 * @param connection
	 * @param id
	 */
	void admin_deletePrapareSl(Connection connection, String id)throws SQLException;

	/**
	 * 后台管理系统 - 拦截社区建立请求：即根据id删除相应id
	 * @param connection
	 * @param id
	 * @throws SQLException
	 */
	void admin_failPrepareSq(Connection connection, String id)throws SQLException;

	/**
	 * 查询该社区所有表白信
	 * @param connection
	 * @param sqId
	 * @return
	 * @throws SQLException
	 */
	List<Bb> selectBbsBySqId(Connection connection, String sqId, PageModel pageModel)throws SQLException;

	/**
	 * 社区异步添加表白
	 * @param connection
	 * @param sqId
	 * @return
	 * @throws SQLException
	 */
	int addBb(Connection connection, String sqId, String bb_content, String bb_user)throws SQLException;

	/**
	 * 后台管理系统 - 跳到修改社区资料页面
	 * @param connection
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	Sq admin_selectSqById(Connection connection, String id)throws SQLException;

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
	void updateSqById(Connection connection, String id, String sq_name,
			String sq_introduction, String sq_location, String sq_pano)throws SQLException;

	/**
	 * 用户异步申请社区Y主
	 * @param connection
	 * @param apply_sq
	 * @param apply_usernickname
	 * @param introduce
	 * @param apply_reason
	 * @param userId
	 * @param sqId 
	 * @return
	 * @throws SQLException
	 */
	int applySqYZFormAjax(Connection connection, String apply_sq,
			String apply_usernickname, String introduce, String apply_reason,
			String userId, String sqId) throws SQLException;

	/**
	 * 后台管理系统 - 修改sq变的sq_yz状态
	 * @param connection
	 * @param sqId
	 * @throws SQLException
	 */
	void admin_updateSqYzStatus(Connection connection, String sqId)throws SQLException;

	/**
	 * 异步添加用户爱逛社区
	 * @param connection
	 * @param agsq_name
	 * @param userId 
	 * @throws SQLException
	 */
	void addAgsqAjax(Connection connection, String agsq_name, String userId)throws SQLException;

}
