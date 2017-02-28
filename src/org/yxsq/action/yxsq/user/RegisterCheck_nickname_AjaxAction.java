package org.yxsq.action.yxsq.user;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import org.yxsq.action.base.AbstractAjaxAction;
import org.yxsq.service.YxsqService;
import org.yxsq.service.impl.YxsqServiceImpl;
import org.yxsq.service.proxy.ProxyFactory;

public class RegisterCheck_nickname_AjaxAction extends AbstractAjaxAction {
	private static final long serialVersionUID = 1L;

	private YxsqService yxsqService = ProxyFactory.getProxy(new YxsqServiceImpl());
	
	private String nickname;
	
	@Override
	protected String getJson() throws Exception {
		// TODO Auto-generated method stub
		return yxsqService.check_nicknamenameAjax(nickname);
	}

	
	/** setter and getter method */
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		try {
			this.nickname = URLDecoder.decode(nickname, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
