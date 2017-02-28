package org.yxsq.action.loginout;


import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.yxsq.action.base.AbstractAction;
import org.yxsq.dto.Sq;
import org.yxsq.service.YxsqService;
import org.yxsq.service.impl.YxsqServiceImpl;
import org.yxsq.service.proxy.ProxyFactory;

public class LoginOutAction_2 extends AbstractAction {

	private static final long serialVersionUID = 1L;
	private YxsqService yxsqService = ProxyFactory.getProxy(new YxsqServiceImpl());
	
	private List<Sq> sqs;

	public String execute(){
		ServletActionContext.getRequest().getSession().invalidate();
		sqs = yxsqService.selectSq();
		return SUCCESS;
	}

	/** setter and getter method */
	public List<Sq> getSqs() {
		return sqs;
	}

	public void setSqs(List<Sq> sqs) {
		this.sqs = sqs;
	}
}
