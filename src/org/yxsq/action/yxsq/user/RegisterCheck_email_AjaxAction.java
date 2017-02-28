package org.yxsq.action.yxsq.user;

import org.yxsq.action.base.AbstractAjaxAction;
import org.yxsq.service.YxsqService;
import org.yxsq.service.impl.YxsqServiceImpl;
import org.yxsq.service.proxy.ProxyFactory;

public class RegisterCheck_email_AjaxAction extends AbstractAjaxAction {
	private static final long serialVersionUID = 1L;

	private YxsqService yxsqService = ProxyFactory.getProxy(new YxsqServiceImpl());
	
	private String email;
	
	@Override
	protected String getJson() throws Exception {
		// TODO Auto-generated method stub
		return yxsqService.check_emailAjax(email);
	}

	/** setter and getter method */
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
