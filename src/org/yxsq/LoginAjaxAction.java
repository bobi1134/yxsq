package org.yxsq;

import org.yxsq.action.base.AbstractAjaxAction;
import org.yxsq.service.YxsqService;
import org.yxsq.service.impl.YxsqServiceImpl;
import org.yxsq.service.proxy.ProxyFactory;

/**
 * 用户异步登陆
 * @author: Nothing
 * @email: 761328790@qq.com
 * @company: Sichuan Agricultural University
 * @date 2015年4月28日
 */
public class LoginAjaxAction extends AbstractAjaxAction {
	
	private static final long serialVersionUID = 1L;
	
	private String username;
	private String password;
	private String vcode;
	
	private YxsqService yxsqService = ProxyFactory.getProxy(new YxsqServiceImpl());

	@Override
	protected String getJson() throws Exception {
		return yxsqService.userLogin(username, password, vcode);
	}

	/** setter method */
	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setVcode(String vcode) {
		this.vcode = vcode;
	}
}
