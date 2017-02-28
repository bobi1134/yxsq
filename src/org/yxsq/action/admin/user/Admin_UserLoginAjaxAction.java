package org.yxsq.action.admin.user;

import org.yxsq.action.base.AbstractAjaxAction;
import org.yxsq.service.AdminService;
import org.yxsq.service.impl.AdminServiceImpl;
import org.yxsq.service.proxy.ProxyFactory;

public class Admin_UserLoginAjaxAction extends AbstractAjaxAction{

	private static final long serialVersionUID = 1L;
	private AdminService adminService = ProxyFactory.getProxy(new AdminServiceImpl());

	private String username;
	private String password;
	
	/**
	 * admin -- 后台管理系统 异步登陆
	 */
	@Override
	protected String getJson() throws Exception {
		// TODO Auto-generated method stub
		return adminService.admin_userLoginAjax(username, password);
	}
	
	
	/** setter and getter method */
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
}
