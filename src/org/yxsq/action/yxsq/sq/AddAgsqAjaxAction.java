package org.yxsq.action.yxsq.sq;

import org.yxsq.action.base.AbstractAjaxAction;
import org.yxsq.service.YxsqService;
import org.yxsq.service.impl.YxsqServiceImpl;
import org.yxsq.service.proxy.ProxyFactory;

public class AddAgsqAjaxAction extends AbstractAjaxAction {

	private static final long serialVersionUID = 1L;
	private YxsqService yxsqService = ProxyFactory.getProxy(new YxsqServiceImpl());
	
	private String userId;
	private String agsq_name;
	
	/**
	 * 异步添加用户爱逛社区
	 */
	@Override
	protected String getJson() throws Exception {
		// TODO Auto-generated method stub
		return yxsqService.addAgsqAjax(agsq_name, userId);
	}

	
	/** setter and getter method */
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getAgsq_name() {
		return agsq_name;
	}
	public void setAgsq_name(String agsq_name) {
		this.agsq_name = agsq_name;
	}
}
