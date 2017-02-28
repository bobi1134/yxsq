package org.yxsq.service.impl;

import java.io.File;
import java.sql.Connection;
import java.util.List;
import java.util.UUID;

import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.struts2.ServletActionContext;
import org.tool.consts.WebConstant;
import org.tool.ecxeption.YxsqException;
import org.tool.page.PageModel;
import org.yxsq.dao.ImgsDao;
import org.yxsq.dao.SqDao;
import org.yxsq.dao.TzDao;
import org.yxsq.dao.UserDao;
import org.yxsq.dao.impl.ImgsDaoImpl;
import org.yxsq.dao.impl.SqDaoImpl;
import org.yxsq.dao.impl.TzDaoImpl;
import org.yxsq.dao.impl.UserDaoImpl;
import org.yxsq.dto.Img;
import org.yxsq.dto.PrepareSq;
import org.yxsq.dto.PrepareYZ;
import org.yxsq.dto.Sq;
import org.yxsq.dto.SqVo;
import org.yxsq.dto.Tz;
import org.yxsq.dto.User;
import org.yxsq.dto.UserVo;
import org.yxsq.service.AdminService;

import com.opensymphony.xwork2.ActionContext;

/**
 * 处理后台所有的业务逻辑
 * @author: Nothing
 * @email: 761328790@qq.com
 * @company: Sichuan Agricultural University
 * @date 2015年4月26日
 */
public class AdminServiceImpl implements AdminService {
	
	private UserDao userDao;
	private SqDao sqDao;
	private TzDao tzDao;
	private ImgsDao imgDao;
	
	private Connection connection;
	
	public void setConnection(Connection connection){
		this.connection = connection;
	}
	
	public AdminServiceImpl(){
		userDao = new UserDaoImpl();
		sqDao = new SqDaoImpl();
		tzDao = new TzDaoImpl();
		imgDao = new ImgsDaoImpl();
	}
	
	/**
	 * admin -- 后台管理系统 异步登陆
	 * @param username
	 * @param password
	 * @return
	 */
	@Override
	public String admin_userLoginAjax(String username, String password) {
		// TODO Auto-generated method stub
		try {
			JSONObject json = new JSONObject();
			User user = userDao.admin_userLoginAjax(connection, username, password);
			if (user != null) {
				ActionContext.getContext().getSession().put(WebConstant.SESSION_USER, user);
				json.put("flag", 1);
			}
			return json.toString();
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("admin -- 后台管理系统 异步登陆时出现异常！");
		}
	}

	/**
	 * 后台管理系统 - 多条件查询所有用户
	 * @return
	 */
	@Override
	public List<User> admin_selectAllUser(PageModel pageModel, String username, String nickname) {
		// TODO Auto-generated method stub
		try {
			return userDao.admin_selectAllUser(connection, pageModel, username, nickname);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 多条件查询所有用户时出现异常！");
		}
	}

	/**
	 * 先按条件查询满足条件的所有会员信息，不分页，查询所有
	 * @param username
	 * @param nickname
	 * @return
	 */
	@Override
	public List<UserVo> select_Admin_excelHY(String username, String nickname) {
		// TODO Auto-generated method stub
		try {
			return userDao.select_Admin_excelHY(connection, username, nickname);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("先按条件查询满足条件的所有会员信息，不分页，查询所有时出现异常！");
		}
	}

	/**
	 * 后台管理系统 - 多条件查询社区
	 * @param pageModel
	 * @return
	 */
	@Override
	public List<Sq> admin_selectAllSq(PageModel pageModel, String sq_name, String sq_location) {
		// TODO Auto-generated method stub
		try {
			return sqDao.admin_selectAllSq(connection, pageModel, sq_name, sq_location);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 多条件查询社区时出现异常！");
		}
	}

	/**
	 * 先查询满足条件的社区 -- 不分页
	 * @param sq_name
	 * @param sq_location
	 * @return
	 */
	@Override
	public List<SqVo> select_Admin_excelSQ(String sq_name, String sq_location) {
		// TODO Auto-generated method stub
		try {
			return sqDao.select_Admin_excelSQ(connection, sq_name, sq_location);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("先查询满足条件的社区 -- 不分页时出现异常！");
		}
	}

	/**
	 * 后台管理系统  - 先准备还需要处理条数
	 * @return
	 */
	@Override
	public int admin_selectPrepareSqCount() {
		// TODO Auto-generated method stub
		try {
			return sqDao.admin_selectPrepareSqCount(connection);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("先查询满足条件的社区 -- 不分页时出现异常！");
		}
	}

	/**
	 * 后台管理系统 - 查询所有建立社区申请
	 * @param pageModel
	 * @return
	 */
	@Override
	public List<PrepareSq> admin_selectAllPrepareSq(PageModel pageModel) {
		// TODO Auto-generated method stub
		try {
			return sqDao.admin_selectAllPrepareSq(connection, pageModel);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 查询所有建立社区申请时出现异常！");
		}
	}

	/**
	 * 后台管理系统 - 通过请求
	 * @param id
	 */
	@Override
	public void admin_passPrepareSq(String id) {
		// TODO Auto-generated method stub
		try {
			PrepareSq prepareSq = sqDao.admin_selectPrepareById(connection, id);
			/**
			 * 添加新社区
			 */
			sqDao.admin_insertNewSq(connection, prepareSq);
			/**
			 * 添加第一条帖子
			 */
			Sq sq = sqDao.admin_selectMaxId(connection);
			tzDao.admin_insertNewSqFirstTz(connection, sq.getId());
			/**
			 * 删除申请的社区
			 */
			sqDao.admin_deletePrapareSl(connection, id);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 通过请求时出现异常！");
		}
		
	}

	/**
	 * 后台管理系统 - 拦截社区建立请求：即根据id删除相应id
	 * @param id
	 */
	@Override
	public void admin_failPrepareSq(String id) {
		// TODO Auto-generated method stub
		try {
			sqDao.admin_failPrepareSq(connection, id);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 拦截社区建立请求：即根据id删除相应id时出现异常！");
		}
		
	}

	/**
	 * 后台管理系统 - 跳到修改社区资料页面
	 * @param id
	 * @return
	 */
	@Override
	public Sq admin_selectSqById(String id) {
		// TODO Auto-generated method stub
		try {
			return sqDao.admin_selectSqById(connection, id);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 跳到修改社区资料页面时出现异常！");
		}
	}

	/**
	 * 后台管理系统 - 修改社区资料
	 * @param id
	 * @param sq_name
	 * @param sq_introduction
	 * @param sq_location
	 * @param sq_pano
	 */
	@Override
	public void updateSqById(String id, String sq_name, String sq_introduction,
			String sq_location, String sq_pano) {
		// TODO Auto-generated method stub
		try {
			sqDao.updateSqById(connection, id, sq_name, sq_introduction, sq_location, sq_pano);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 修改社区资料时出现异常！");
		}
	}

	/**
	 * 后台管理系统 - 跳到修改用户资料界面
	 * @param userId
	 * @return
	 */
	@Override
	public User admin_selectUserById(String userId) {
		// TODO Auto-generated method stub
		try {
			return userDao.selectUserById(connection, Integer.valueOf(userId));
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 跳到修改用户资料界面时出现异常！");
		}
	}

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
	@Override
	public void admin_updateUserById(String id, String username,
			String password, String nickname, String email, String sex,
			String status) {
		// TODO Auto-generated method stub
		try {
			userDao.admin_updateUserById(connection, id, username, password, nickname, email, sex, status);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 修改用户资料时出现异常！");
		}
	}

	/**
	 * 后台管理系统 - 添加用户
	 * @param username
	 * @param password
	 * @param nickname
	 * @param email
	 * @param sex
	 * @param status
	 */
	@Override
	public void admin_addUser(String username, String password,
			String nickname, String email, String sex, String status) {
		// TODO Auto-generated method stub 
		try {
			userDao.admin_addUser(connection, username, password, nickname, email, sex, status);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 添加用户时出现异常！");
		}
	}

	/**
	 * 后台管理系统 - 查询各个社区的Y主申请
	 * @return
	 */
	@Override
	public List<PrepareYZ> admin_selectAllPrepareUserYZ(PageModel pageModel) {
		// TODO Auto-generated method stub
		try {
			return userDao.admin_selectAllPrepareUserYZ(connection, pageModel);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 查询各个社区的Y主申请时出现异常！");
		}
	}

	/**
	 * 后台管理系统 - 查询所有Y主申请总数Count
	 * @return
	 */
	@Override
	public int admin_selectPrepareUserCount() {
		// TODO Auto-generated method stub
		try {
			return userDao.admin_selectPrepareUserCount(connection);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 查询所有Y主申请总数Count时出现异常！");
		}
	}

	/**
	 * 后台管理系统 - 通过用户Y主申请
	 * @param userId
	 */
	@Override
	public void admin_passPrepareUser(String userId, String sqId, String id) {
		// TODO Auto-generated method stub
		try {
			/**
			 * 修改user表的yz_sqId
			 */
			userDao.admin_passPrepareUser(connection, userId, sqId);
			/**
			 * 修改sq变的sq_yz状态
			 */
			sqDao.admin_updateSqYzStatus(connection, sqId);
			/**
			 * 删除刚刚的prepare_yz通过的那条记录
			 */
			userDao.admin_deletePrepareUserById(connection, id);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 后台管理系统 - 通过用户Y主申请时出现异常！");
		}
		
	}

	/**
	 * 后台管理系统 - 不通过用户Y主申请
	 * @param id
	 */
	@Override
	public void admin_failPrepareUser(String id) {
		// TODO Auto-generated method stub
		try {
			userDao.admin_failPrepareUser(connection, id);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 不通过用户Y主申请时出现异常！");
		}
		
	}

	/**
	 * 后台管理系统 - 多条件查询所有的帖子
	 * @param pageModel
	 * @return
	 */
	@Override
	public List<Tz> admin_selectAllTz(String sqName, String tzTitle, PageModel pageModel) {
		// TODO Auto-generated method stub
		try {
			return tzDao.admin_selectAllTz(connection, sqName, tzTitle, pageModel);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 多条件查询所有的帖子时出现异常！");
		}
	}

	/**
	 * 后台管理系统 - 预览帖子
	 * @param id
	 * @return
	 */
	@Override
	public Tz admin_prevTz(String id) {
		// TODO Auto-generated method stub
		try {
			return tzDao.admin_prevTz(connection, id);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 预览帖子时出现异常！");
		}
	}

	/**
	 * 后台管理系统 - 首页加精
	 * @param id
	 */
	@Override
	public void addTojingTz(String id) {
		// TODO Auto-generated method stub
		try {
			tzDao.addTojingTz(connection, id);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 首页加精时出现异常！");
		}
	}

	/**
	 * 后台管理系统 - 首页加火
	 * @param id
	 */
	@Override
	public void addTohuoTz(String id) {
		// TODO Auto-generated method stub
		try {
			tzDao.addTohuoTz(connection, id);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 首页加火时出现异常！");
		}
	}

	/**
	 * 后台管理系统 - 取消首页加精
	 * @param id
	 */
	@Override
	public void deleteTojingTz(String id) {
		// TODO Auto-generated method stub
		try {
			tzDao.deleteTojingTz(connection, id);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 取消首页加精时出现异常！");
		}
		
	}

	/**
	 * 后台管理系统 - 取消首页加火
	 * @param id
	 */
	@Override
	public void deleteTohuoTz(String id) {
		try {
			tzDao.deleteTohuoTz(connection, id);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 取消首页加火时出现异常！");
		}
	}

	/**
	 * 后台管理系统 - 查询首页所有精帖
	 * @return
	 */
	@Override
	public List<Tz> admin_selectAllIndexJingTz(String sqName, String tzTitle, PageModel pageModel) {
		// TODO Auto-generated method stub
		try {
			return tzDao.admin_selectAllIndexJingTz(connection, sqName, tzTitle, pageModel);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 查询首页所有精帖时出现异常！");
		}
	}

	/**
	 * 后台管理系统 - 查询首页所有热帖
	 * @param sqName
	 * @param tzTitle
	 * @param pageModel
	 * @return
	 */
	@Override
	public List<Tz> admin_selectAllIndexHuoTz(String sqName, String tzTitle,
			PageModel pageModel) {
		// TODO Auto-generated method stub
		try {
			return tzDao.admin_selectAllIndexHuoTz(connection, sqName, tzTitle, pageModel);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 查询首页所有精帖时出现异常！");
		}
	}

	/**
	 * 后台管理系统 - 查询首页的所有图片
	 * @param pageModel
	 * @return
	 */
	@Override
	public List<Img> admin_selectImgs(PageModel pageModel) {
		// TODO Auto-generated method stub
		try {
			return imgDao.admin_selectImgs(connection, pageModel);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 查询首页的所有图片时出现异常！");
		}
	}

	/**
	 * 后台管理系统 - 预览首页滚动图片
	 * @return
	 */
	@Override
	public Img admin_prevImg_1(String id) {
		// TODO Auto-generated method stub
		try {
			return imgDao.admin_prevImg_1(connection, id);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 预览首页滚动图片时出现异常！");
		}
	}

	/**
	 * 后台管理系统 - 预览首页背景图片
	 * @param id
	 */
	@Override
	public Img admin_prevImg_2(String id) {
		// TODO Auto-generated method stub
		try {
			return imgDao.admin_prevImg_2(connection, id);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 预览首页背景图片时出现异常！");
		}
	}

	/**
	 * 后台管理系统 - 查询所有的导航图片
	 * @param pageModel
	 * @return
	 */
	@Override
	public List<Img> admin_selectdhImg(PageModel pageModel) {
		// TODO Auto-generated method stub
		try {
			return imgDao.admin_selectdhImg(connection, pageModel);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 查询所有的导航图片时出现异常！");
		}
	}

	/**
	 * 后台管理系统 - 查询所有带<img>属性的所有帖子
	 * @return
	 */
	@Override
	public List<Tz> admin_selectAllImgTz(PageModel pageModel) {
		// TODO Auto-generated method stub
		try {
			return tzDao.admin_selectAllImgTz(connection, pageModel);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 查询所有带<img>属性的所有帖子时出现异常！");
		}
	}

	/**
	 * 后台管理系统 - 确认更换该图片导航信息
	 * @param ghId
	 * @param okId
	 */
	@Override
	public void admin_dhOk(String ghId, String okId) {
		// TODO Auto-generated method stub
		try {
			/**
			 * 查询要更换帖子的信息
			 */
			Tz tz = tzDao.admin_selectTzById(connection, okId);
			/** 准备更新进imgs表的信息 */
			String str = tz.getTz_content().substring(tz.getTz_content().indexOf("http://"), tz.getTz_content().indexOf(" style"));
			String imgSrc = str.substring(0, str.length()-1);
			String imgHref = "yxsq/tz/selectAllRemark.action?tzId="+tz.getId()+"&sqId="+tz.getSqId();
			String imgTitle = tz.getTz_title();
			/**
			 * 首页导航图片更新信息
			 */
			imgDao.admin_updateDhImg(connection, ghId, imgSrc, imgHref, imgTitle);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 确认更换该图片导航信息时出现异常！");
		}
	}

	/**
	 * 后台管理系统 - 查询首页所有的背景图片
	 * @param pageModel
	 * @return
	 */
	@Override
	public List<Img> admin_selectbjImg(PageModel pageModel) {
		// TODO Auto-generated method stub
		try {
			return imgDao.admin_selectbjImg(connection, pageModel);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 查询首页所有的背景图片时出现异常！");
		}
	}

	/**
	 * 后台管理系统 - 跳转到修改背景图片页面
	 * @param id
	 * @return
	 */
	@Override
	public Img admin_updateBjPage(String id) {
		// TODO Auto-generated method stub
		try {
			return imgDao.admin_updateBjPage(connection, id);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 跳转到修改背景图片页面时出现异常！");
		}
	}

	/**
	 * 后台管理系统 - 修改首页背景图片
	 * @param id
	 * @param img_title
	 * @param img_src
	 * @param bjImg
	 * @param bjImgFileName
	 */
	@Override
	public void admin_updateBjImg(String id, String img_title, String img_src,
			File bjImg, String bjImgFileName) {
		// TODO Auto-generated method stub
		try {
			String realPath = ServletActionContext.getServletContext().getRealPath("/");
			String ccPath = realPath+File.separator+"images"+File.separator+"bg";
			File file = new File(ccPath+File.separator+img_src);
			if (file != null) file.delete();
			//String fileName = UUID.randomUUID().toString()+"."+FilenameUtils.getExtension(bjImgFileName);
			String fileName = String.valueOf(Integer.valueOf(id)-5)+"."+FilenameUtils.getExtension(bjImgFileName);
			FileUtils.copyFile(bjImg, new File(ccPath+File.separator+fileName));
			/**
			 * 更新imgs表信息
			 */
			imgDao.updateBjImg(connection, id, fileName, img_title);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 修改首页背景图片时出现异常！");
		}
	}

	/**
	 * 后台管理系统 - 查询所有的用户头部背景图片
	 * @param pageModel
	 * @return
	 */
	@Override
	public List<Img> admin_selectHomeImgs(PageModel pageModel) {
		// TODO Auto-generated method stub
		try {
			return imgDao.admin_selectHomeImgs(connection, pageModel);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 查询所有的用户头部背景图片时出现异常！");
		}
	}

	/**
	 * 后台管理系统 - 预览用户主页头部背景图片
	 * @param id
	 * @return
	 */
	@Override
	public Img admin_prevHomeImg(String id) {
		// TODO Auto-generated method stub
		try {
			return imgDao.admin_prevHomeImg(connection, id);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 预览用户主页头部背景图片时出现异常！");
		}
		
	}

	/**
	 * 后台管理系统 - 修改用户主页头部背景
	 * @param id
	 * @param img_title
	 * @param img_src
	 * @param homeTbImg
	 * @param homeTbImgFileName
	 */
	@Override
	public void admin_updateHomeTbBjImg(String id, String img_title,
			String img_src, File homeTbImg, String homeTbImgFileName) {
		// TODO Auto-generated method stub
		try {
			String realPath = ServletActionContext.getServletContext().getRealPath("/");
			String ccPath = realPath+File.separator+"images"+File.separator+"homepage";
			File file = new File(ccPath+File.separator+img_src);
			if (file != null) file.delete();
			String fileName = String.valueOf(Integer.valueOf(id)-11)+"."+FilenameUtils.getExtension(homeTbImgFileName);
			FileUtils.copyFile(homeTbImg, new File(ccPath+File.separator+fileName));
			/**
			 * 更新imgs表信息-->重复调用方法
			 */
			imgDao.updateBjImg(connection, id, fileName, img_title);
			
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("后台管理系统 - 修改用户主页头部背景时出现异常！");
		}
	}

}
