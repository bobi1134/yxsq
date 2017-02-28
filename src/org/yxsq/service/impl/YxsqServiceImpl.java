package org.yxsq.service.impl;

import java.io.File;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.struts2.ServletActionContext;
import org.tool.annotation.Transcation;
import org.tool.consts.WebConstant;
import org.tool.ecxeption.YxsqException;
import org.tool.email.EmailUtil;
import org.tool.page.PageModel;
import org.tool.weather.WeatherUtil;
import org.yxsq.dao.ImgsDao;
import org.yxsq.dao.LchRemarkDao;
import org.yxsq.dao.SqDao;
import org.yxsq.dao.TzDao;
import org.yxsq.dao.TzRemarkDao;
import org.yxsq.dao.UserDao;
import org.yxsq.dao.impl.ImgsDaoImpl;
import org.yxsq.dao.impl.LchRemarkDaoImpl;
import org.yxsq.dao.impl.SqDaoImpl;
import org.yxsq.dao.impl.TzDaoImpl;
import org.yxsq.dao.impl.TzRemarkDaoImpl;
import org.yxsq.dao.impl.UserDaoImpl;
import org.yxsq.dto.Agsq;
import org.yxsq.dto.Bb;
import org.yxsq.dto.Img;
import org.yxsq.dto.LchRemark;
import org.yxsq.dto.Sq;
import org.yxsq.dto.Tz;
import org.yxsq.dto.TzRemark;
import org.yxsq.dto.User;
import org.yxsq.service.YxsqService;

import com.opensymphony.xwork2.ActionContext;

/**
 * 处理前台所有的业务逻辑
 * @author: Nothing
 * @email: 761328790@qq.com
 * @company: Sichuan Agricultural University
 * @date 2015年4月26日
 */
public class YxsqServiceImpl implements YxsqService {
	
	private UserDao userDao;
	private SqDao sqDao;
	private TzDao tzDao;
	private TzRemarkDao tzRemarkDao;
	private LchRemarkDao lchRemarkDao;
	private ImgsDao imgsDao;
	
	private Connection connection;
	
	public void setConnection(Connection connection){
		this.connection = connection;
	}
	
	public YxsqServiceImpl(){
		userDao = new UserDaoImpl();
		sqDao = new SqDaoImpl();
		tzDao = new TzDaoImpl();
		tzRemarkDao = new TzRemarkDaoImpl();
		lchRemarkDao = new LchRemarkDaoImpl();
		imgsDao = new ImgsDaoImpl();
	}

	/**
	 * 用户异步登陆
	 * @param username
	 * @param password
	 * @param vcode
	 * @return
	 */
	@Override
	public String userLogin(String username, String password, String vcode) {
		String oldCode = (String)ActionContext.getContext().getSession().get(WebConstant.VERIFY_CODE);
		JSONObject json = new JSONObject();
		if (oldCode.equals(vcode)) {
			try {
				User user = userDao.userLogin(connection, username, password);
				if (user == null) {
					json.put("tip", "用户名或密码不正确！");
					json.put("flag", 1);
				}else {
					ActionContext.getContext().getSession().put(WebConstant.SESSION_USER, user);
					json.put("tip", "登陆成功，马上跳转，请稍后~");
					json.put("flag", 2);
				}
			} catch (SQLException e) {
				throw new YxsqException("用户异步登陆时出现异常", e);
			}
		}else {
			json.put("tip", "验证码错误！");
			json.put("flag", 0);
		}
		return json.toString();
	}

	/**
	 * 查询用户的详细信息
	 * @param username
	 * @return
	 */
	@Override
	public User selectUser(String nickname) {
		try {
			return userDao.selectUser(connection, nickname);
		} catch (Exception e) {
			throw new YxsqException("查询用户的详细信息时出现异常", e);
		}
	}
	
	/**
	 * 查询用户的详细信息
	 * @param userId
	 * @return
	 */
	@Override
	public User selectUser(Integer userId) {
		try {
			return userDao.selectUser(connection, userId);
		} catch (Exception e) {
			throw new YxsqException("查询用户的详细信息时出现异常", e);
		}
	}

	/**
	 * 查询该用户所有爱逛的社区
	 * @param id
	 * @return
	 */
	@Override
	public List<Agsq> selectAgsq(int id) {
		try {
			return userDao.selectAgsq(connection, id);
		} catch (Exception e) {
			throw new YxsqException("查询该用户所有爱逛的社区出现异常");
		}
	}

	/**
	 * 发帖总数
	 * @param id
	 * @return
	 */
	@Override
	public int selectTzCount(int id) {
		try {
			return userDao.selectTzCount(connection, id);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("发帖总数出现异常！");
		}
	}

	/**
	 * 查看该用户的所用帖子
	 * @param id
	 * @return
	 */
	@Override
	public List<Tz> selectTzs(int id) {
		// TODO Auto-generated method stub
		try {
			return userDao.selectTzs(connection, id);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("查看该用户的所用帖子时出现异常！");
		}
	}

	/**
	 * 查询所有社区
	 */
	@Override
	public List<Sq> selectSq() {
		// TODO Auto-generated method stub
		try {
			return sqDao.selectSq(connection);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("查询所有社区出现异常！");
		}
	}

	/**
	 * 根据社区名进入社区
	 * @param sqName
	 * @return
	 */
	@Override
	public Sq sqGo(String sqName) {
		// TODO Auto-generated method stub
		try {
			return sqDao.sqGo(connection, sqName);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("根据社区名进入社区时出现异常！");
		}
	}

	/**
	 * 查询相应社区的帖子总数
	 * @param sqName
	 * @return
	 */
	@Override
	public int selectSqTzCount(String sqName) {
		// TODO Auto-generated method stub
		try {
			return tzDao.selectSqTzCount(connection, sqName);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("查询相应社区的帖子总数时出现异常！");
		}
	}

	/**
	 * 查询所有帖子、发帖人、发帖时间、最后评论者
	 * @param sqName
	 * @return
	 */
	@Override
	public List<Tz> selectTzsBySqName(String sqName, PageModel pageModel) {
		// TODO Auto-generated method stub
		try {
			List<Tz> tzs = tzDao.selectTzsBySqName(connection, sqName, pageModel);
			for (Tz t : tzs) {
				/**
				 * 查询帖子评论总数
				 */
				String tzId = String.valueOf(t.getId());
				int count = tzDao.selectRemarkCount(connection, tzId);
				tzDao.updtaeRemarkCount(connection, count, tzId);
				/**
				 * 查询帖子最后评论者
				 */
				TzRemark tzRemark = tzRemarkDao.selectRemarkNameByTzId(connection, tzId);
				if (tzRemark!=null) {
					String lastRemark = tzRemark.getUser().getNickname();
					tzDao.updtaelastRemark(connection, lastRemark, tzId);
				}
				else{
					String lastRemark = "暂无评论";
					tzDao.updtaelastRemark(connection, lastRemark, tzId);
				}
			}
			return tzDao.selectTzsBySqName(connection, sqName, pageModel);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("查询所有帖子、发帖人、发帖时间、最后评论者时出现异常！");
		}
	}

	/**
	 * 添加帖子
	 * @param insert_title
	 * @param ckeditor
	 * @param userId
	 * @param sqId
	 */
	@Override
	public void insertTz(String insert_title, String ckeditor, int userId,
			String sqId) {
		// TODO Auto-generated method stub
		try {
			tzDao.insertTz(connection, insert_title, ckeditor, userId, sqId);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("添加帖子时出现异常！");
		}
		
	}

	/**
	 * 简单表单重复提交测试，按时间查询最后一个发帖者
	 * @param sqId
	 * @return
	 */
	@Override
	public Tz select(String sqId) {
		// TODO Auto-generated method stub
		try {
			return tzDao.select(connection, sqId);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("查询最后一条帖子时出现异常！");
		}
	}

	/**
	 * 查询该帖子下面的所有评论
	 * @param tzId
	 * @return
	 */
	@Override
	public List<TzRemark> selectAllRemark(String tzId, PageModel pageModel) {
		// TODO Auto-generated method stub
		try {
			List<TzRemark> tzRemarks = tzRemarkDao.selectAllRemark(connection, tzId, pageModel);
			for (TzRemark t : tzRemarks) {
				/**
				 * 查询该帖子的所有二级评论
				 */
				List<LchRemark> lchRemarks = lchRemarkDao.selectAllLchReamrk(connection, String.valueOf(t.getId()));
				t.setLchRemarks(lchRemarks);
				t.setLchCount(lchRemarks.size());
			}
			return tzRemarks;
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("查询该帖子的所有评论时出现异常！");
		}
	}

	/**
	 * 根据社区id查询相应社区的详细信息
	 * @param sqId
	 * @return
	 */
	@Override
	public Sq selectSqBySqId(String sqId) {
		// TODO Auto-generated method stub
		try {
			return sqDao.selectSqBySqId(connection, sqId);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("根据社区id查询该社区信息时出现异常！");
		}
	}

	/**
	 * 根据帖子id查询该帖子的详细信息
	 * @param tzId
	 * @return
	 */
	@Override
	public Tz selectTzByTzId(String tzId) {
		// TODO Auto-generated method stub
		try {
			return tzDao.selectTzByTzId(connection, tzId);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("根据帖子id查询该帖子的详细信息时出现异常！");
		}
	}

	/**
	 * 异步添加二级评论
	 * @param lch_text
	 * @param tzRemarkId
	 * @param userId
	 */
	@Transcation(readOnly=false)	//开启事务
	public String insertLchRemark(String lch_text, String tzRemarkId,
			String userId) {
		// TODO Auto-generated method stub
		try {
			JSONObject json = new JSONObject();
			Date date = new Date();
			int num = lchRemarkDao.insertLchRemark(connection, lch_text, tzRemarkId, userId);
			User user = userDao.selectUser(connection, Integer.valueOf(userId));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
			String newDate = sdf.format(date);
			if (num == 1) {
				json.put("flag", 1);
				json.put("date", String.valueOf(newDate));
				json.put("nickname", user.getNickname());
			}
			return json.toString();
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("异步添加二级评论时出现异常！");
		}
		
	}

	/**
	 * 添加一级评论
	 * @param remarkText
	 * @param tzId
	 * @param userId
	 */
	@Override
	public void insertOneRemark(String remarkText, String tzId, String userId) {
		// TODO Auto-generated method stub
		try {
			/**
			 * 查询lcNum
			 */
			TzRemark tzRemark = tzRemarkDao.selectjMaxLcNum(connection, tzId);
			int lcNum = tzRemark.getLcNum();
			lcNum++;
			tzDao.insertOneRemark(connection, remarkText, lcNum, tzId, userId);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("添加一级评论时出现异常！");
		}
	}

	/**
	 * 查询该帖子的最后一条评论
	 * @param tzId
	 * @return
	 */
	@Override
	public TzRemark selectFirstOneRemark(String tzId) {
		// TODO Auto-generated method stub
		try {
			return tzRemarkDao.selectFirstOneRemark(connection, tzId);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("查询该帖子的最后一条评论时出现异常！");
		}
	}

	/**
	 * 准备轮播的6张火图
	 * @return
	 */
	@Override
	public List<Img> selectAllImg() {
		// TODO Auto-generated method stub
		try {
			return imgsDao.selectAllImg(connection);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("准备轮播的6张火图时出现异常！");
		}
	}

	/**
	 * 准备welcome.jsp页面的精品帖子
	 * @return
	 */
	@Override
	public List<Tz> selectAlJpTz() {
		// TODO Auto-generated method stub
		try {
			return tzDao.selectAlJpTz(connection);
			
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("准备welcome.jsp页面的精品帖子时出现异常！");
		}
	}

	/**
	 * 准备welcome.jsp页面的精品帖子 后7条
	 * @return
	 */
	@Override
	public List<Tz> selectAlJpTz_2() {
		// TODO Auto-generated method stub
		try {
			return tzDao.selectAlJpTz_2(connection);
			
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("准备welcome.jsp页面的精品帖子（后7条）时出现异常！");
		}
	}

	/**
	 * 准备高校热帖
	 * @return
	 */
	@Override
	public List<Tz> selectAlJpTz_3() {
		// TODO Auto-generated method stub
		try {
			return tzDao.selectAlJpTz_3(connection);
			
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("准备高校热帖时出现异常！");
		}
	}

	/**
	 * 新会员
	 * @return
	 */
	@Override
	public List<User> selectNewUser() {
		// TODO Auto-generated method stub
		try {
			return userDao.selectNewUser(connection);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("查询新会员时出现异常！");
		}
	}

	/**
	 * 准备社区总数
	 * @return
	 */
	@Override
	public int selectSqCount() {
		// TODO Auto-generated method stub
		try {
			return sqDao.selectSqCount(connection);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("准备社区总数时出现异常！");
		}
	}

	/**
	 * 准备换肤的6张背景图
	 * @return
	 */
	@Override
	public List<Img> selectAllImg_2() {
		// TODO Auto-generated method stub
		try {
			return imgsDao.selectAllImg_2(connection);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("准备换肤的6张背景图时出现异常！");
		}
	}

	/**
	 * 异步查询天气
	 * @return
	 */
	@Override
	public String selectTqAjx(String province, String city) {
		// TODO Auto-generated method stub
		try {
			JSONObject json = new JSONObject();
			int provinceCode = WeatherUtil.getProinceCode(province);
			int cityCode = WeatherUtil.getCityCode(provinceCode, city);
			List<String> list = WeatherUtil.getWeather(cityCode);
			String sj_1 = list.get(7).substring(list.get(7).indexOf(" "));
			if (list != null) {
				json.put("flag", 1);
				json.put("sj_1", sj_1);
				json.put("sj_2", list.get(8));
			}
			return json.toString();
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("异步查询天气时出现异常！");
		}
	}

	/**
	 * 查询所点击的该用户的发帖情况
	 * @param id
	 * @return
	 */
	@Override
	public List<Tz> selectClickUserTzs(int id) {
		// TODO Auto-generated method stub
		try { 
			return tzDao.selectClickUserTzs(connection, id);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("查询所点击的该用户的发帖情况时出现异常！");
		}
	}

	/**
	 * 准备session_user的个人主页的12张头部背景图片
	 */
	@Override
	public List<Img> selectAHeadBgImg() {
		// TODO Auto-generated method stub
		try {
			return imgsDao.selectAHeadBgImg(connection);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("准备session_user的个人主页的12张头部背景图片时出现异常！");
		}
	}

	/**
	 * 异步修改用户主页头部背景
	 * @param img_src
	 * @param userId
	 * @return
	 */
	@Override
	public String updateHomepageImgAjax(String img_src, String userId) {
		// TODO Auto-generated method stub
		try {
			JSONObject json = new JSONObject();
			int num = userDao.updateHomepageImgAjax(connection, img_src, userId);
			if (num == 1) {
				json.put("flag", 1);
			}
			return json.toString();
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("异步修改用户主页头部背景时出现异常！");
		}
	}

	/**
	 * 根据userId查询该用户的相关信息
	 */
	@Override
	public User selectUserById(int userId) {
		// TODO Auto-generated method stub
		try {
			return userDao.selectUserById(connection, userId);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("根据userId查询该用户的相关信息时出现异常！");
		}
	}

	/**
	 * Y主异步修改社区资料
	 * @param sq_introduction
	 * @param sq_logo_img
	 * @param sq_logo_imgFileName
	 * @param sq_img
	 * @param sq_imgFileName
	 * @return
	 */
	@Transcation(readOnly=false)
	public void updateSqZL(String sq_introduction, 
			String sq_logo_imgUrl, File sq_logo_img, String sq_logo_imgFileName, 
			String sq_imgUrl, File sq_img, String sq_imgFileName,
			String sqId) {
		// TODO Auto-generated method stub
		System.out.println("sq_introduction:"+sq_introduction);
		System.out.println("sq_logo_imgFileName:"+sq_logo_imgFileName);
		System.out.println("sq_imgFileName:"+sq_imgFileName);
		try {
			String realPath = ServletActionContext.getServletContext().getRealPath("/");
			String ccPath = realPath+File.separator+"images"+File.separator+"sq_img";
			File file_1 = new File(ccPath+File.separator+sq_logo_imgUrl);
			File file_2 = new File(ccPath+File.separator+sq_imgUrl);
			if (file_1 != null) file_1.delete();
			if (file_2 != null) file_2.delete();
			String fileName_1 = UUID.randomUUID().toString()+"."+FilenameUtils.getExtension(sq_logo_imgFileName);
			System.out.println("fileName_1:"+fileName_1);
			String fileName_2 = UUID.randomUUID().toString()+"."+FilenameUtils.getExtension(sq_imgFileName);
			System.out.println("fileName_2:"+fileName_2);
			FileUtils.copyFile(sq_logo_img, new File(ccPath+File.separator+fileName_1));
			FileUtils.copyFile(sq_img, new File(ccPath+File.separator+fileName_2));
			sqDao.updateSqZL(connection, sq_introduction, fileName_1, fileName_2, sqId);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("Y主异步修改社区资料时出现异常！");
		}
	}

	/**
	 * 异步修改用户的基本信息
	 */
	@Override
	public String updateHomePageUserMesAjax(String nickname, String userId, String sex) {
		// TODO Auto-generated method stub
		try {
			JSONObject json = new JSONObject();
			int num = userDao.updateHomePageUserMesAjax(connection, nickname, sex, userId);
			if (num == 1) {
				json.put("flag", 1);
			}
			return json.toString();
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("异步修改用户的基本信息时出现异常！");
		}
	}

	/**
	 * 用户异步修改自己主页的图片
	 */
	@Override
	public String updateHomePageUserTxAjax(String userId, File tx, String txFileName, String imgUrl) {
		// TODO Auto-generated method stub
		try {
			String realPath = ServletActionContext.getServletContext().getRealPath("/");
			String ccPath = realPath+File.separator+"images"+File.separator+"user";
			File file = new File(ccPath+File.separator+imgUrl);
			if (file != null) {
				file.delete();
			}
			String fileName = UUID.randomUUID().toString()+"."+FilenameUtils.getExtension(txFileName);
			FileUtils.copyFile(tx, new File(ccPath+File.separator+fileName));
			userDao.updateImgsrc(connection, fileName, userId);
			return fileName;
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("用户异步修改自己主页的图片时出现异常！");
		}
	}

	/**
	 * 发送建立社区请求
	 * @param sqName
	 * @param sqIntroduction
	 * @param sqLocation
	 */
	@Override
	public void addSqRequest(String sqName, String sqIntroduction,
			String sqLocation) {
		// TODO Auto-generated method stub
		try {
			sqDao.addSqRequest(connection, sqName, sqIntroduction, sqLocation);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("用户异步修改自己主页的图片时出现异常！");
		}
		
	}

	/**
	 * 查询该社区所有表白信
	 * @param sqId
	 * @return
	 */
	@Override
	public List<Bb> selectBbsBySqId(String sqId, PageModel pageModel) {
		// TODO Auto-generated method stub
		try {
			return sqDao.selectBbsBySqId(connection, sqId, pageModel);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("查询该社区所有表白信时出现异常！");
		}
	}

	/**
	 * 社区异步添加表白
	 * @param sqId
	 * @return
	 */
	@Override
	public String addBb(String sqId, String bb_content, String bb_user) {
		// TODO Auto-generated method stub
		try {
			JSONObject json = new JSONObject();
			int num = sqDao.addBb(connection, sqId, bb_content, bb_user);
			if (num == 1) {
				json.put("flag", 1);
			}
			return json.toString();
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("异步添加表白时出现异常！");
		}
	}

	/**
	 * 注册用户时 异步校验username是否存在
	 * @param username
	 * @return
	 */
	@Override
	public String check_usernameAjax(String username) {
		// TODO Auto-generated method stub
		try {
			JSONObject json = new JSONObject();
			User user = userDao.check_usernameAjax(connection, username);
			if (user != null) {
				json.put("flag", 1);
			}else{
				json.put("flag", 2);
			}
			return json.toString();
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("注册用户时 异步校验username是否存在时出现异常！");
		}
	}

	/**
	 * 注册用户时 异步校验nickname是否存在
	 * @param nickname
	 * @return
	 */
	@Override
	public String check_nicknamenameAjax(String nickname) {
		// TODO Auto-generated method stub
		try {
			JSONObject json = new JSONObject();
			User user = userDao.check_nicknamenameAjax(connection, nickname);
			if (user != null) {
				json.put("flag", 1);
			}else{
				json.put("flag", 2);
			}
			return json.toString();
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("注册用户时 异步校验nickname是否存在时出现异常！");
		}
	}

	/**
	 * 注册用户时 异步校验email是否存在
	 * @param email
	 * @return
	 */
	@Override
	public String check_emailAjax(String email) {
		// TODO Auto-generated method stub
		try {
			JSONObject json = new JSONObject();
			User user = userDao.check_emailAjax(connection, email);
			if (user != null) {
				json.put("flag", 1);
			}else{
				json.put("flag", 2);
			}
			return json.toString();
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("注册用户时 异步校验email是否存在时出现异常！");
		}
	}

	/**
	 * 添加用户
	 * @param username
	 * @param password
	 * @param nickname
	 * @param email
	 * @param yzm
	 */
	@Override
	public int addUser(String username, String password, String nickname,
			String email, String yzm) {
		// TODO Auto-generated method stub
		try {
			int flag = 0;
			String oldCode = (String)ActionContext.getContext().getSession().get(WebConstant.VERIFY_CODE);
			if (yzm.equals(oldCode)) {
				flag = 1;
				userDao.addUser(connection, username, password, nickname, email, yzm);
				String url = "http://www.xlbweb.cn/yxsq/yxsq/user/activeUser.action?username="+username;
				String msg = "注册成功，请点此链接进行激活！<br>";
				msg += "<a href="+url+">"+url+"</a>";
				EmailUtil.send(email, "月下社区会员注册", msg);
			}else{
				flag = 0;
			}
			return flag;
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("添加用户时出现异常！");
		}
	}

	/**
	 * 激活用户
	 * @param username
	 */
	@Override
	public void activeUser(String username) {
		// TODO Auto-generated method stub
		try {
			userDao.activeUser(connection, username);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("激活用户时出现异常！");
		}
		
	}

	/**
	 * 用户异步申请社区Y主
	 * @param apply_sq
	 * @param apply_usernickname
	 * @param introduce
	 * @param apply_reason
	 * @param userId
	 * @return
	 */
	@Override
	public String applySqYZFormAjax(String apply_sq, String apply_usernickname,
			String introduce, String apply_reason, String userId, String sqId) {
		// TODO Auto-generated method stub
		try {
			JSONObject json = new JSONObject();
			int num = sqDao.applySqYZFormAjax(connection, apply_sq, apply_usernickname, introduce, apply_reason, userId, sqId);
			if (num == 1) {
				json.put("flag", 1);
			}
			return json.toString();
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("用户异步申请社区Y主时出现异常！");
		}
	}

	/**
	 * 修改用户最近浏览信息
	 * @param nickname
	 * @param zjll
	 */
	@Override
	public void updateUserZjll(String nickname, String zjll) {
		// TODO Auto-generated method stub
		try {
			userDao.updateUserZjll(connection, nickname, zjll);
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("修改用户最近浏览信息时出现异常！");
		}
	}

	/**
	 * 异步添加用户爱逛社区
	 * @param agsq_name
	 * @param userId
	 * @return
	 */
	@Override
	public String addAgsqAjax(String agsq_name, String userId) {
		// TODO Auto-generated method stub
		try {
			JSONObject json = new JSONObject();
			//复用方法查询社区是否存在
			Sq sq = sqDao.sqGo(connection, agsq_name);
			if (sq != null) {
				sqDao.addAgsqAjax(connection, agsq_name, userId);
				json.put("flag", 1);
			}else{
				json.put("flag", 2);
			}
			return json.toString();
		} catch (Exception e) {
			// TODO: handle exception
			throw new YxsqException("异步添加用户爱逛社区时出现异常！");
		}
	}

	
}
