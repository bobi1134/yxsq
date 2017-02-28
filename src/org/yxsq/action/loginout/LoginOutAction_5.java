package org.yxsq.action.loginout;


import org.apache.struts2.ServletActionContext;
import org.tool.characterprocess.CharacterProcess;
import org.yxsq.action.base.AbstractAction;
import org.yxsq.dto.Sq;
import org.yxsq.service.YxsqService;
import org.yxsq.service.impl.YxsqServiceImpl;
import org.yxsq.service.proxy.ProxyFactory;

public class LoginOutAction_5 extends AbstractAction {

	private static final long serialVersionUID = 1L;
	private YxsqService yxsqService = ProxyFactory.getProxy(new YxsqServiceImpl());
	
	private Sq sq;
	private int ftzs;
	private String sqId;
	private String sqName;
	
	public String execute(){
		ServletActionContext.getRequest().getSession().invalidate();
		/**
		 * 查询该社区相关信息
		 */
		sq = yxsqService.selectSqBySqId(sqId);
		/**
		 * 查询相应社区的帖子总数
		 */
		ftzs = yxsqService.selectSqTzCount(sqName);
		return SUCCESS;
	}
	
	/** setter and getter ethod */
	public Sq getSq() {
		return sq;
	}

	public void setSq(Sq sq) {
		this.sq = sq;
	}

	public int getFtzs() {
		return ftzs;
	}

	public void setFtzs(int ftzs) {
		this.ftzs = ftzs;
	}

	public String getSqId() {
		return sqId;
	}

	public void setSqId(String sqId) {
		this.sqId = sqId;
	}

	public String getSqName() {
		return sqName;
	}

	public void setSqName(String sqName) {
		this.sqName = CharacterProcess.isoToUtf8(sqName);
	}
}
