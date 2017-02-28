package org.yxsq.action.admin.user;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.tool.characterprocess.CharacterProcess;
import org.tool.excel.ExcelDaoChu;
import org.yxsq.action.base.AbstractAction;
import org.yxsq.dto.PrepareYZ;
import org.yxsq.dto.User;
import org.yxsq.dto.UserVo;
import org.yxsq.service.AdminService;
import org.yxsq.service.impl.AdminServiceImpl;
import org.yxsq.service.proxy.ProxyFactory;

public class Admin_UserAction extends AbstractAction {

	private static final long serialVersionUID = 1L;
	private AdminService adminService = ProxyFactory.getProxy(new AdminServiceImpl());
	
	private List<User> users;
	private User user;
	private String username;
	private String nickname;
	private String userId;
	private String id;
	private String password;
	private String email;
	private String sex;
	private String status;
	private List<PrepareYZ> prepareYZs;
	private int prepare_user_Count;
	private String sqId;

	/**
	 * 后台管理系统 - 多条件查询所有用户
	 * @return
	 */
	public String admin_selectAllUser(){
		pageModel.setPageSize(12);
		users = adminService.admin_selectAllUser(pageModel, username, nickname);
		return SUCCESS;
	}

	/**
	 * 后台管理系统 - 导出会员资料
	 * @return
	 */
	public String admin_excelHY(){
		try {
			/**
			 * 先按条件查询满足条件的所有会员信息，不分页，查询所有
			 */
			List<UserVo> userVos = adminService.select_Admin_excelHY(username, nickname);
			/** 导出顺序是按照UserVo.java中的变量名输出 */
			String[] titles = {"编号", "账号", "昵称", "性别", "角色", "注册时间"};
			ExcelDaoChu.exportExcel("会员信息", "会员表", titles, userVos, ServletActionContext.getResponse(), ServletActionContext.getRequest());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return NONE;
	}
	
	/**
	 * 后台管理系统 - 退出
	 * @return
	 */
	public String admin_loginOut(){
		ServletActionContext.getRequest().getSession().invalidate();
		return SUCCESS;
	}
	
	/**
	 * 后台管理系统 - 跳到修改用户资料界面
	 * @return
	 */
	public String admin_updateUserPage(){
		user = adminService.admin_selectUserById(userId);
		return SUCCESS;
	}
	
	/**
	 * 后台管理系统 - 修改用户资料
	 * @return
	 */
	public String admin_updateUser(){
		try {
			adminService.admin_updateUserById(id, username, password, nickname, email, sex, status);
			/**
			 * 准备资料
			 */
			user = adminService.admin_selectUserById(id);
			setTip("修改成功！");
		} catch (Exception e) {
			// TODO: handle exception
			setTip("修改失败！");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	/**
	 * 后台管理系统 - 添加用户
	 * @return
	 */
	public String admin_addUser(){
		try {
			adminService.admin_addUser(username, password, nickname, email, sex, status);
			setTip("添加成功！");
		} catch (Exception e) {
			// TODO: handle exception
			setTip("添加失败！");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	/**
	 * 后台管理系统 - 查询各个社区的Y主申请
	 * @return
	 */
	public String admin_selectAllPrepareUserYZ(){
		pageModel.setPageSize(12);
		/**
		 * 准备数据1
		 */
		prepare_user_Count = adminService.admin_selectPrepareUserCount();
		/**
		 * 准备数据2
		 */
		prepareYZs = adminService.admin_selectAllPrepareUserYZ(pageModel);
		return SUCCESS;
	}
	
	/**
	 * 后台管理系统 - 通过用户Y主申请
	 * @return
	 */
	public String admin_passPrepareUser(){
		try {
			adminService.admin_passPrepareUser(userId, sqId, id);
			/**
			 * 准备数据1
			 */
			prepare_user_Count = adminService.admin_selectPrepareUserCount();
			/**
			 * 准备数据2
			 */
			prepareYZs = adminService.admin_selectAllPrepareUserYZ(pageModel);
			setTip("通过申请成功！");
		} catch (Exception e) {
			// TODO: handle exception
			setTip("通过申请失败！");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	/**
	 * 后台管理系统 - 不通过用户Y主申请
	 * @return
	 */
	public String admin_failPrepareUser(){
		try {
			adminService.admin_failPrepareUser(id);
			setTip("操作成功！");
		} catch (Exception e) {
			// TODO: handle exception
			setTip("操作失败！");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	/** setter and getter method */
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = CharacterProcess.isoToUtf8(nickname);
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public List<PrepareYZ> getPrepareYZs() {
		return prepareYZs;
	}
	public void setPrepareYZs(List<PrepareYZ> prepareYZs) {
		this.prepareYZs = prepareYZs;
	}
	public int getPrepare_user_Count() {
		return prepare_user_Count;
	}
	public void setPrepare_user_Count(int prepare_user_Count) {
		this.prepare_user_Count = prepare_user_Count;
	}
	public String getSqId() {
		return sqId;
	}
	public void setSqId(String sqId) {
		this.sqId = sqId;
	}
}
