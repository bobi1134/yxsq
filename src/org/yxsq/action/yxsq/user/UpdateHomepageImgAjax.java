package org.yxsq.action.yxsq.user;

import org.yxsq.action.base.AbstractAjaxAction;
import org.yxsq.service.YxsqService;
import org.yxsq.service.impl.YxsqServiceImpl;
import org.yxsq.service.proxy.ProxyFactory;

public class UpdateHomepageImgAjax extends AbstractAjaxAction {

	private static final long serialVersionUID = 1L;
	private YxsqService yxsqService = ProxyFactory.getProxy(new YxsqServiceImpl());
	
	private String img_src;
	private String userId;

	/**
	 * 异步修改用户主页头部背景
	 */
	@Override
	protected String getJson() throws Exception {
		// TODO Auto-generated method stub
		return yxsqService.updateHomepageImgAjax(img_src, userId);
	}

	
	/** setter and getter method */
	public String getImg_src() {
		return img_src;
	}
	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}
}
