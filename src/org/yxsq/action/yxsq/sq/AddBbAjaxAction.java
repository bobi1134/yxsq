package org.yxsq.action.yxsq.sq;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import org.yxsq.action.base.AbstractAjaxAction;
import org.yxsq.service.YxsqService;
import org.yxsq.service.impl.YxsqServiceImpl;
import org.yxsq.service.proxy.ProxyFactory;

public class AddBbAjaxAction extends AbstractAjaxAction {

	private static final long serialVersionUID = 1L;
	private YxsqService yxsqService = ProxyFactory.getProxy(new YxsqServiceImpl());
	
	private String sqId;
	private String bb_content;
	private String bb_user;

	@Override
	protected String getJson() throws Exception {
		// TODO Auto-generated method stub
		return yxsqService.addBb(sqId, bb_content, bb_user);
	}

	/** setter and getter method */
	public String getSqId() {
		return sqId;
	}
	public void setSqId(String sqId) {
		this.sqId = sqId;
	}
	public String getBb_content() {
		return bb_content;
	}
	public void setBb_content(String bb_content) {
		try {
			this.bb_content = URLDecoder.decode(bb_content, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public String getBb_user() {
		return bb_user;
	}
	public void setBb_user(String bb_user) {
		try {
			this.bb_user = URLDecoder.decode(bb_user, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
	}
}
