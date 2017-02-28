package org.yxsq.action.yxsq.user;

import org.yxsq.action.base.AbstractAjaxAction;
import org.yxsq.service.YxsqService;
import org.yxsq.service.impl.YxsqServiceImpl;
import org.yxsq.service.proxy.ProxyFactory;

public class UpdateHomePageUserMesAjax extends AbstractAjaxAction{

	private static final long serialVersionUID = 1L;
	private YxsqService yxsqService = ProxyFactory.getProxy(new YxsqServiceImpl());
	
	private String userId;
	private String nickname;
	private String sex;

	/**
	 * 异步修改用户的基本信息
	 */
	@Override
	protected String getJson() throws Exception {
		return yxsqService.updateHomePageUserMesAjax(nickname, sex, userId);
	}

	
	/** setter and getter method */
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
}
