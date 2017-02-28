package org.yxsq.action.yxsq.sq;

import org.yxsq.action.base.AbstractAjaxAction;
import org.yxsq.service.YxsqService;
import org.yxsq.service.impl.YxsqServiceImpl;
import org.yxsq.service.proxy.ProxyFactory;

public class ApplySqYZFormAjaxAction extends AbstractAjaxAction {

	private static final long serialVersionUID = 1L;
	private YxsqService yxsqService = ProxyFactory.getProxy(new YxsqServiceImpl());
	
	private String apply_sq;
	private String apply_usernickname;
	private String introduce;
	private String apply_reason;
	private String userId;
	private String sqId;

	@Override
	protected String getJson() throws Exception {
		// TODO Auto-generated method stub
		return yxsqService.applySqYZFormAjax(apply_sq, apply_usernickname, introduce, apply_reason, userId, sqId);
	}
	
	
	/** setter and getter ethod */
	public String getApply_sq() {
		return apply_sq;
	}
	public void setApply_sq(String apply_sq) {
		this.apply_sq = apply_sq;
	}
	public String getApply_usernickname() {
		return apply_usernickname;
	}
	public void setApply_usernickname(String apply_usernickname) {
		this.apply_usernickname = apply_usernickname;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getApply_reason() {
		return apply_reason;
	}
	public void setApply_reason(String apply_reason) {
		this.apply_reason = apply_reason;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSqId() {
		return sqId;
	}
	public void setSqId(String sqId) {
		this.sqId = sqId;
	}
}
