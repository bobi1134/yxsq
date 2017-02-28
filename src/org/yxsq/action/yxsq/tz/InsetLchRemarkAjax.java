package org.yxsq.action.yxsq.tz;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import org.yxsq.action.base.AbstractAjaxAction;
import org.yxsq.service.YxsqService;
import org.yxsq.service.impl.YxsqServiceImpl;
import org.yxsq.service.proxy.ProxyFactory;

public class InsetLchRemarkAjax extends AbstractAjaxAction {

	private static final long serialVersionUID = 1L;

	private YxsqService yxsqService = ProxyFactory.getProxy(new YxsqServiceImpl());
	
	private String tzRemarkId;
	private String userId;
	private String lch_text;
	@Override
	protected String getJson() throws Exception {
		return yxsqService.insertLchRemark(lch_text, tzRemarkId, userId);
	}
	
	/** setter and getter method */
	public String getTzRemarkId() {
		return tzRemarkId;
	}
	public void setTzRemarkId(String tzRemarkId) {
		this.tzRemarkId = tzRemarkId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getLch_text() {
		return lch_text;
	}
	public void setLch_text(String lch_text) {
		/**
		 * action请求乱码解决！
		 */
		try {
			this.lch_text = URLDecoder.decode(lch_text, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		//this.lch_text = CharacterProcess.isoToUtf8(lch_text);
	}
}
