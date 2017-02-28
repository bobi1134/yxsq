package org.yxsq.service;

import java.io.File;
import java.util.List;

import org.tool.page.PageModel;
import org.yxsq.dto.Agsq;
import org.yxsq.dto.Bb;
import org.yxsq.dto.Img;
import org.yxsq.dto.Sq;
import org.yxsq.dto.Tz;
import org.yxsq.dto.TzRemark;
import org.yxsq.dto.User;

/**
 * 处理前台所有的业务逻辑
 * @author: Nothing
 * @email: 761328790@qq.com
 * @company: Sichuan Agricultural University
 * @date 2015年4月26日
 */
public interface YxsqService {

	/**
	 * 用户异步登陆
	 * @param username
	 * @param password
	 * @param vcode
	 * @return
	 */
	String userLogin(String username, String password, String vcode);

	/**
	 * 查询用户的详细信息
	 * @param username
	 * @return
	 */
	User selectUser(String nickname);
	
	/**
	 * 查询用户的详细信息
	 * @param userId
	 * @return
	 */
	User selectUser(Integer userId);

	/**
	 * 查询该用户所有爱逛的社区
	 * @param id
	 * @return
	 */
	List<Agsq> selectAgsq(int id);

	/**
	 * 发帖总数
	 * @param id
	 * @return
	 */
	int selectTzCount(int id);

	/**
	 * 查看该用户的所用帖子
	 * @param id
	 * @return
	 */
	List<Tz> selectTzs(int id);

	/**
	 * 查询所有社区
	 * @return
	 */
	List<Sq> selectSq();

	/**
	 * 根据社区名进入社区
	 * @param sqName
	 * @return
	 */
	Sq sqGo(String sqName);

	/**
	 * 查询相应社区的帖子总数
	 * @param sqName
	 * @return
	 */
	int selectSqTzCount(String sqName);

	/**
	 * 查询所有帖子、发帖人、发帖时间、最后评论者
	 * @param sqName
	 * @return
	 */
	List<Tz> selectTzsBySqName(String sqName, PageModel pageModel);

	/**
	 * 添加帖子
	 * @param insert_title
	 * @param ckeditor
	 * @param userId
	 * @param sqId
	 */
	void insertTz(String insert_title, String ckeditor, int userId, String sqId);

	/**
	 * 简单表单重复提交测试，按时间查询最后一个发帖者
	 * @param sqId
	 * @return
	 */
	Tz select(String sqId);

	/**
	 * 查询该帖子下面的所有评论
	 * @param tzId
	 * @param pageModel 
	 * @return
	 */
	List<TzRemark> selectAllRemark(String tzId, PageModel pageModel);

	/**
	 * 根据社区id查询相应社区的详细信息
	 * @param sqId
	 * @return
	 */
	Sq selectSqBySqId(String sqId);

	/**
	 * 根据帖子id查询该帖子的详细信息
	 * @param tzId
	 * @return
	 */
	Tz selectTzByTzId(String tzId);

	/**
	 * 异步添加二级评论
	 * @param lch_text
	 * @param tzRemarkId
	 * @param userId
	 * @return 
	 */
	String insertLchRemark(String lch_text, String tzRemarkId, String userId);
	
	/**
	 * 添加一级评论
	 * @param remarkText
	 * @param tzId
	 * @param userId
	 */
	void insertOneRemark(String remarkText, String tzId, String userId);

	/**
	 * 查询该帖子的最后一条评论
	 * @param tzId
	 * @return
	 */
	TzRemark selectFirstOneRemark(String tzId);

	/**
	 * 准备轮播的6张火图
	 * @return
	 */
	List<Img> selectAllImg();

	/**
	 * 准备welcome.jsp页面的精品帖子
	 * @return
	 */
	List<Tz> selectAlJpTz();

	/**
	 * 准备welcome.jsp页面的精品帖子 后7条
	 * @return
	 */
	List<Tz> selectAlJpTz_2();

	/**
	 * 准备高校热帖
	 * @return
	 */
	List<Tz> selectAlJpTz_3();

	/**
	 * 新会员
	 * @return
	 */
	List<User> selectNewUser();

	/**
	 *  准备社区总数
	 * @return
	 */
	int selectSqCount();

	/**
	 * 准备换肤的6张背景图
	 * @return
	 */
	List<Img> selectAllImg_2();

	/**
	 * 异步查询天气
	 * @param city 
	 * @param province 
	 * @return
	 */
	String selectTqAjx(String province, String city);

	/**
	 * 查询所点击的该用户的发帖情况
	 * @param id
	 * @return
	 */
	List<Tz> selectClickUserTzs(int id);

	/**
	 * 准备session_user的个人主页的12张头部背景图片
	 * @return
	 */
	List<Img> selectAHeadBgImg();

	/**
	 * 异步修改用户主页头部背景
	 * @param img_src
	 * @param userId
	 * @return
	 */
	String updateHomepageImgAjax(String img_src, String userId);

	/**
	 * 根据userId查询该用户的相关信息
	 * @param userId
	 * @return
	 */
	User selectUserById(int userId);
	
	/**
	 * Y主异步修改社区资料
	 * @param sq_introduction
	 * @param sq_logo_imgUrl 
	 * @param sq_logo_img
	 * @param sq_logo_imgFileName
	 * @param sq_imgUrl 
	 * @param sq_img
	 * @param sq_imgFileName
	 * @param sqId 
	 * @return
	 */
	void updateSqZL(String sq_introduction, String sq_logo_imgUrl, File sq_logo_img,
			String sq_logo_imgFileName, String sq_imgUrl, File sq_img, String sq_imgFileName, String sqId);

	/**
	 * 异步修改用户的基本信息
	 * @param nickname
	 * @param userId
	 * @param sex 
	 * @return
	 */
	String updateHomePageUserMesAjax(String nickname, String userId, String sex);

	/**
	 * 用户异步修改自己主页的图片
	 * @param userId
	 * @param txFileName 
	 * @param tx 
	 * @param imgUrl 
	 * @return
	 */
	String updateHomePageUserTxAjax(String userId, File tx, String txFileName, String imgUrl);

	/**
	 * 发送建立社区请求
	 * @param sqName
	 * @param sqIntroduction
	 * @param sqLocation
	 */
	void addSqRequest(String sqName, String sqIntroduction, String sqLocation);

	/**
	 * 查询该社区所有表白信
	 * @param sqId
	 * @param pageModel 
	 * @return
	 */
	List<Bb> selectBbsBySqId(String sqId, PageModel pageModel);

	/**
	 * 异步添加表白
	 * @param sqId
	 * @param bb_user 
	 * @param bb_content 
	 * @return
	 */
	String addBb(String sqId, String bb_content, String bb_user);

	/**
	 * 注册用户时 异步校验username是否存在
	 * @param username
	 * @return
	 */
	String check_usernameAjax(String username);

	/**
	 * 注册用户时 异步校验nickname是否存在
	 * @param nickname
	 * @return
	 */
	String check_nicknamenameAjax(String nickname);

	/**
	 * 注册用户时 异步校验email是否存在
	 * @param email
	 * @return
	 */
	String check_emailAjax(String email);

	/**
	 * 添加用户
	 * @param username
	 * @param password
	 * @param nickname
	 * @param email
	 * @param yzm
	 * @return 
	 */
	int addUser(String username, String password, String nickname,
			String email, String yzm);

	/**
	 * 激活用户
	 * @param username
	 */
	void activeUser(String username);

	/**
	 * 用户异步申请社区Y主
	 * @param apply_sq
	 * @param apply_usernickname
	 * @param introduce
	 * @param apply_reason
	 * @param userId
	 * @param sqId 
	 * @return
	 */
	String applySqYZFormAjax(String apply_sq, String apply_usernickname,
			String introduce, String apply_reason, String userId, String sqId);

	/**
	 * 修改用户最近浏览信息
	 * @param nickname
	 * @param zjll
	 */
	void updateUserZjll(String nickname, String zjll);

	/**
	 * 异步添加用户爱逛社区
	 * @param agsq_name
	 * @param userId
	 * @return
	 */
	String addAgsqAjax(String agsq_name, String userId);

	

	



}
