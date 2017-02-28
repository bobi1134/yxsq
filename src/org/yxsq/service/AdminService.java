package org.yxsq.service;

import java.io.File;
import java.util.List;

import org.tool.page.PageModel;
import org.yxsq.dto.Img;
import org.yxsq.dto.PrepareSq;
import org.yxsq.dto.PrepareYZ;
import org.yxsq.dto.Sq;
import org.yxsq.dto.SqVo;
import org.yxsq.dto.Tz;
import org.yxsq.dto.User;
import org.yxsq.dto.UserVo;

/**
 * 处理后台所有的业务逻辑
 * @author: Nothing
 * @email: 761328790@qq.com
 * @company: Sichuan Agricultural University
 * @date 2015年4月26日
 */
public interface AdminService {

	/**
	 * admin -- 后台管理系统 异步登陆
	 * @param username
	 * @param password
	 * @return
	 */
	String admin_userLoginAjax(String username, String password);

	/**
	 * 后台管理系统 - 多条件查询所有用户
	 * @param pageModel 
	 * @param nickname 
	 * @param username 
	 * @return
	 */
	List<User> admin_selectAllUser(PageModel pageModel, String username, String nickname);

	/**
	 * 先按条件查询满足条件的所有会员信息，不分页，查询所有
	 * @param username
	 * @param nickname
	 * @return
	 */
	List<UserVo> select_Admin_excelHY(String username, String nickname);

	/**
	 * 后台管理系统 - 多条件查询社区
	 * @param pageModel
	 * @param sq_location 
	 * @param sq_name 
	 * @return
	 */
	List<Sq> admin_selectAllSq(PageModel pageModel, String sq_name, String sq_location);

	/**
	 * 先查询满足条件的社区 -- 不分页
	 * @param sq_name
	 * @param sq_location
	 * @return
	 */
	List<SqVo> select_Admin_excelSQ(String sq_name, String sq_location);

	/**
	 * 后台管理系统 - 先准备还需要处理条数
	 * @return
	 */
	int admin_selectPrepareSqCount();

	/**
	 * 后台管理系统 - 查询所有建立社区申请
	 * @param pageModel
	 * @return
	 */
	List<PrepareSq> admin_selectAllPrepareSq(PageModel pageModel);

	/**
	 * 后台管理系统 - 通过请求
	 * @param id
	 */
	void admin_passPrepareSq(String id);

	/**
	 * 后台管理系统 - 拦截社区建立请求：即根据id删除相应id
	 * @param id
	 */
	void admin_failPrepareSq(String id);

	/**
	 * 后台管理系统 - 跳到修改社区资料页面
	 * @param id
	 * @return
	 */
	Sq admin_selectSqById(String id);

	/**
	 * 后台管理系统 - 修改社区资料
	 * @param id
	 * @param sq_name
	 * @param sq_introduction
	 * @param sq_location
	 * @param sq_pano
	 */
	void updateSqById(String id, String sq_name, String sq_introduction,
			String sq_location, String sq_pano);

	/**
	 * 后台管理系统 - 跳到修改用户资料界面
	 * @param userId
	 * @return
	 */
	User admin_selectUserById(String userId);

	/**
	 * 后台管理系统 - 修改用户资料
	 * @param id
	 * @param username
	 * @param password
	 * @param nickname
	 * @param email
	 * @param sex
	 * @param status
	 */
	void admin_updateUserById(String id, String username, String password,
			String nickname, String email, String sex, String status);

	/**
	 * 后台管理系统 - 添加用户
	 * @param username
	 * @param password
	 * @param nickname
	 * @param email
	 * @param sex
	 * @param status
	 */
	void admin_addUser(String username, String password, String nickname,
			String email, String sex, String status);

	/**
	 * 后台管理系统 - 查询各个社区的Y主申请
	 * @param pageModel 
	 * @return
	 */
	List<PrepareYZ> admin_selectAllPrepareUserYZ(PageModel pageModel);

	/**
	 * 后台管理系统 - 查询所有Y主申请总数Count
	 * @return
	 */
	int admin_selectPrepareUserCount();

	/**
	 * 后台管理系统 - 通过用户Y主申请
	 * @param userId
	 * @param sqId 
	 * @param id 
	 */
	void admin_passPrepareUser(String userId, String sqId, String id);

	/**
	 * 后台管理系统 - 不通过用户Y主申请
	 * @param id
	 */
	void admin_failPrepareUser(String id);

	/**
	 * 后台管理系统 - 多条件查询所有的帖子
	 * @param tzTitle 
	 * @param sqName 
	 * @param pageModel
	 * @return
	 */
	List<Tz> admin_selectAllTz(String sqName, String tzTitle, PageModel pageModel);

	/**
	 * 后台管理系统 - 预览帖子
	 * @param id
	 * @return
	 */
	Tz admin_prevTz(String id);

	/**
	 * 后台管理系统 - 首页加精
	 * @param id
	 */
	void addTojingTz(String id);

	/**
	 * 后台管理系统 - 首页加火
	 * @param id
	 */
	void addTohuoTz(String id);

	/**
	 * 后台管理系统 - 取消首页加精
	 * @param id
	 */
	void deleteTojingTz(String id);

	/**
	 * 后台管理系统 - 取消首页加火
	 * @param id
	 */
	void deleteTohuoTz(String id);

	/**
	 * 后台管理系统 - 查询首页所有精帖
	 * @param tzTitle 
	 * @param sqName 
	 * @param pageModel 
	 * @return
	 */
	List<Tz> admin_selectAllIndexJingTz(String sqName, String tzTitle, PageModel pageModel);

	/**
	 * 后台管理系统 - 查询首页所有热帖
	 * @param sqName
	 * @param tzTitle
	 * @param pageModel
	 * @return
	 */
	List<Tz> admin_selectAllIndexHuoTz(String sqName, String tzTitle,
			PageModel pageModel);

	/**
	 * 后台管理系统 - 查询首页的所有图片
	 * @param pageModel
	 * @return
	 */
	List<Img> admin_selectImgs(PageModel pageModel);

	/**
	 * 后台管理系统 - 预览首页滚动图片
	 * @param id 
	 * @return
	 */
	Img admin_prevImg_1(String id);

	/**
	 * 后台管理系统 - 预览首页背景图片
	 * @param id
	 * @return 
	 */
	Img admin_prevImg_2(String id);

	/**
	 * 后台管理系统 - 查询所有的导航图片
	 * @param pageModel
	 * @return
	 */
	List<Img> admin_selectdhImg(PageModel pageModel);

	/**
	 * 后台管理系统 - 查询所有带<img>属性的所有帖子
	 * @param pageModel 
	 * @return
	 */
	List<Tz> admin_selectAllImgTz(PageModel pageModel);

	/**
	 * 后台管理系统 - 确认更换该图片导航信息
	 * @param ghId
	 * @param okId
	 */
	void admin_dhOk(String ghId, String okId);

	/**
	 * 后台管理系统 - 查询首页所有的背景图片
	 * @param pageModel
	 * @return
	 */
	List<Img> admin_selectbjImg(PageModel pageModel);

	/**
	 * 后台管理系统 - 跳转到修改背景图片页面
	 * @param id
	 * @return
	 */
	Img admin_updateBjPage(String id);

	/**
	 * 后台管理系统 - 修改首页背景图片
	 * @param id
	 * @param img_title
	 * @param img_src
	 * @param bjImg
	 * @param bjImgFileName
	 */
	void admin_updateBjImg(String id, String img_title, String img_src,
			File bjImg, String bjImgFileName);

	/**
	 * 后台管理系统 - 查询所有的用户头部背景图片
	 * @param pageModel
	 * @return
	 */
	List<Img> admin_selectHomeImgs(PageModel pageModel);

	/**
	 * 后台管理系统 - 预览用户主页头部背景图片
	 * @param id
	 * @return
	 */
	Img admin_prevHomeImg(String id);

	/**
	 * 后台管理系统 - 修改用户主页头部背景
	 * @param id
	 * @param img_title
	 * @param img_src
	 * @param homeTbImg
	 * @param homeTbImgFileName
	 */
	void admin_updateHomeTbBjImg(String id, String img_title, String img_src,
			File homeTbImg, String homeTbImgFileName);


}
