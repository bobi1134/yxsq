package org.yxsq.action.loginout;


import org.apache.struts2.ServletActionContext;
import org.yxsq.action.base.AbstractAction;
import org.yxsq.service.YxsqService;
import org.yxsq.service.impl.YxsqServiceImpl;
import org.yxsq.service.proxy.ProxyFactory;

public class LoginOutAction_模板 extends AbstractAction {

	private static final long serialVersionUID = 1L;
	private YxsqService yxsqService = ProxyFactory.getProxy(new YxsqServiceImpl());
	

	public String execute(){
		ServletActionContext.getRequest().getSession().invalidate();
		return SUCCESS;
	}
	
	
}
