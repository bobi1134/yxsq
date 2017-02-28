package org.yxsq.action.yxsq.user;

import java.io.File;

import org.yxsq.action.base.AbstractAjaxAction;
import org.yxsq.service.YxsqService;
import org.yxsq.service.impl.YxsqServiceImpl;
import org.yxsq.service.proxy.ProxyFactory;

public class UpdateHomePageUserTxAjaxAction extends AbstractAjaxAction {

	private static final long serialVersionUID = 1L;
	private YxsqService yxsqService = ProxyFactory.getProxy(new YxsqServiceImpl());
	
	private String userId;
	private File tx;
	private String txFileName;
	private String txContentType;
	private String imgUrl;

	/**
	 * 用户异步修改自己主页的图片
	 */
	@Override
	protected String getJson() throws Exception {
		// TODO Auto-generated method stub
		return yxsqService.updateHomePageUserTxAjax(userId, tx, txFileName, imgUrl);
	}

	/** setter and getter method */
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public File getTx() {
		return tx;
	}
	public void setTx(File tx) {
		this.tx = tx;
	}
	public String getTxFileName() {
		return txFileName;
	}
	public void setTxFileName(String txFileName) {
		this.txFileName = txFileName;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getTxContentType() {
		return txContentType;
	}
	public void setTxContentType(String txContentType) {
		this.txContentType = txContentType;
	}
}
