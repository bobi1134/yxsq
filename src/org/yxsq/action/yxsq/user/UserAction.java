package org.yxsq.action.yxsq.user;

import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;




import org.tool.characterprocess.CharacterProcess;
import org.yxsq.action.base.AbstractAction;
import org.yxsq.dto.Agsq;
import org.yxsq.dto.Img;
import org.yxsq.dto.Tz;
import org.yxsq.dto.User;
import org.yxsq.service.YxsqService;
import org.yxsq.service.impl.YxsqServiceImpl;
import org.yxsq.service.proxy.ProxyFactory;

public class UserAction extends AbstractAction {

	private static final long serialVersionUID = 1L;
	
	private YxsqService yxsqService = ProxyFactory.getProxy(new YxsqServiceImpl());

	private String nickname;
	private User user;
	private List<Agsq> agsqs;
	private int count;
	private List<Tz> tzs;
	private List<Img> imgs;
	private String userId;
	private String Y_L;
	
	private String username;
	private String password;
	private String email;
	private String yzm;
	
	private String fwId;
	private List<User> zjllUsers = new ArrayList<>();
	private User zjllUser;
	
	/**
	 * 查询对应用户的信息
	 * @return
	 * @throws Exception
	 */
	public String selectUser() throws Exception{
		user = yxsqService.selectUser(nickname);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(String.valueOf(user.getAge()));
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH) + 1;
		int day = c.get(Calendar.DAY_OF_MONTH);
		Calendar nowDate = Calendar.getInstance(), oldDate = Calendar.getInstance();
		nowDate.setTime(new Date());
		oldDate.set(year, month, day);
		double timeNow = nowDate.getTimeInMillis();
		double timeOld = oldDate.getTimeInMillis();
		double age_test =(timeNow-timeOld)/(1000*60*60*24)/365;
		DecimalFormat df = new DecimalFormat("0.0");
		String age = df.format(age_test);
		//更改返回值
		//user.setAge(age);
		if (Float.valueOf(age) < 0) {
			age = "0";
		}
		setY_L(age);
		
		/**
		 * 爱逛的社区
		 */
		agsqs = yxsqService.selectAgsq(user.getId());
		
		/**
		 * 发帖总数
		 */
		count = yxsqService.selectTzCount(user.getId());
		
		/**
		 * 热门动态
		 */
		tzs = yxsqService.selectTzs(user.getId());
		/**
		 * 准备session_user的个人主页的12张头部背景图片
		 */
		imgs = yxsqService.selectAHeadBgImg();
		/**
		 * 最近浏览
		 */
		List<String> lists = new ArrayList<String>();
		if (user.getSee_Id() != "" && user.getSee_Id() != null) {
			for (String str : user.getSee_Id().split("_")) {
				lists.add(str);
			}
		}
		for (int i = 0; i < lists.size(); i++) {
			zjllUser = yxsqService.selectUserById(Integer.valueOf(lists.get(i)));
			zjllUsers.add(zjllUser);
		}
		return SUCCESS;
	}
	
	/**
	 * 返回用户所点击的那个用户的信息
	 * @return
	 * @throws ParseException 
	 * @throws UnsupportedEncodingException 
	 */
	public String selectClickUser() throws ParseException, UnsupportedEncodingException{
		user = yxsqService.selectUser(nickname);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(String.valueOf(user.getAge()));
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH) + 1;
		int day = c.get(Calendar.DAY_OF_MONTH);
		Calendar nowDate = Calendar.getInstance(), oldDate = Calendar.getInstance();
		nowDate.setTime(new Date());
		oldDate.set(year, month, day);
		double timeNow = nowDate.getTimeInMillis();
		double timeOld = oldDate.getTimeInMillis();
		double age_test =(timeNow-timeOld)/(1000*60*60*24)/365;
		DecimalFormat df = new DecimalFormat("0.0");
		String age = df.format(age_test);
		//更改返回值
		//user.setAge(age);
		if (Float.valueOf(age) < 0) {
			age = "0";
		}
		setY_L(age);
		
		/**
		 * 爱逛的社区
		 */
		agsqs = yxsqService.selectAgsq(user.getId());
		
		/**
		 * 发帖总数
		 */
		count = yxsqService.selectTzCount(user.getId());
		
		/**
		 * 该用户所发的帖子
		 */
		tzs = yxsqService.selectClickUserTzs(user.getId());
		
		
		
		/*****最近浏览操作开始*******/
		List<String> lists = new ArrayList<String>();
		if (user.getSee_Id() != "" && user.getSee_Id() != null) {
			for (String str : user.getSee_Id().split("_")) {
				lists.add(str);
			}
			//删除重复访问记录
			for (int i = 0; i < lists.size(); i++) {
				if (lists.get(i).equals(fwId)) {
					lists.remove(i);
				}
			}
			if (lists.size() < 4) { //2_ 、 4_6_ 、 6_3_9_  0 1 2 3
				lists.add(0, fwId);
			}else {
				lists.remove(3);
				lists.add(0, fwId);
			}
		}else{
			lists.add(fwId);
		}
		//保存进数据库
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < lists.size(); i++) {
			sb.append(lists.get(i)+"_");
		}
		yxsqService.updateUserZjll(nickname, sb.toString());
		//发送给页面
		for (int i = 0; i < lists.size(); i++) {
			System.out.println("lists.get(i)-->"+lists.get(i));
			try {
				zjllUser = yxsqService.selectUserById(Integer.valueOf(lists.get(i)));
			} catch (Exception e) {
				zjllUsers.add(zjllUser);
			}
			zjllUsers.add(zjllUser);
		}
		/*****最近浏览操作结束*******/
		
		
		
		return SUCCESS;
	}
	
	/**
	 * 跳转到修改用户资料页面
	 * @return
	 */
	public String goUpdateUserZLpage(){
		user = yxsqService.selectUserById(Integer.valueOf(userId));
		return SUCCESS;
	}

	/**
	 * 添加用户
	 * @return
	 */
	public String addUser(){
		int flag = 0;
		try {
			flag = yxsqService.addUser(username, password, nickname, email, yzm);
			System.out.println("flag:"+flag);
			if (flag == 0) {
				setTip("验证码错误，请重试！");
				return ERROR;
			}
		} catch (Exception e) {
			// TODO: handle exception
			setTip("注册失败，请重试！");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	/**
	 * 激活用户
	 * @return
	 */
	public String activeUser(){
		yxsqService.activeUser(username);
		return SUCCESS;
	}
	
	
	
	/** setter and getter method */
	public User getUser() {
		return user;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Agsq> getAgsqs() {
		return agsqs;
	}

	public void setAgsqs(List<Agsq> agsqs) {
		this.agsqs = agsqs;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public List<Tz> getTzs() {
		return tzs;
	}

	public void setTzs(List<Tz> tzs) {
		this.tzs = tzs;
	}

	public List<Img> getImgs() {
		return imgs;
	}

	public void setImgs(List<Img> imgs) {
		this.imgs = imgs;
	}

	public String getUserId() {
		return userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getYzm() {
		return yzm;
	}

	public void setYzm(String yzm) {
		this.yzm = yzm;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getY_L() {
		return Y_L;
	}

	public void setY_L(String y_L) {
		Y_L = y_L;
	}

	public List<User> getZjllUsers() {
		return zjllUsers;
	}

	public void setZjllUsers(List<User> zjllUsers) {
		this.zjllUsers = zjllUsers;
	}

	public String getFwId() {
		return fwId;
	}

	public void setFwId(String fwId) {
		this.fwId = fwId;
	}

	public User getZjllUser() {
		return zjllUser;
	}

	public void setZjllUser(User zjllUser) {
		this.zjllUser = zjllUser;
	}


}
