package org.yxsq.action.loginout;


import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.yxsq.action.base.AbstractAction;
import org.yxsq.dto.Sq;
import org.yxsq.dto.Tz;
import org.yxsq.dto.TzRemark;
import org.yxsq.service.YxsqService;
import org.yxsq.service.impl.YxsqServiceImpl;
import org.yxsq.service.proxy.ProxyFactory;

public class LoginOutAction_4 extends AbstractAction {

	private static final long serialVersionUID = 1L;
	private YxsqService yxsqService = ProxyFactory.getProxy(new YxsqServiceImpl());
	
	private String tzId;
	private String sqId;
	private List<TzRemark> tzRemarks;
	private Sq sq;
	private Tz tz;
	private int count;

	public String execute(){
		ServletActionContext.getRequest().getSession().invalidate();
		tzRemarks = yxsqService.selectAllRemark(tzId, pageModel);//查询该帖子下面的所有评论
		sq = yxsqService.selectSqBySqId(sqId);//根据社区id查询相应社区的详细信息
		tz = yxsqService.selectTzByTzId(tzId);//根据帖子id查询该帖子的详细信息
		count = yxsqService.selectSqTzCount(sq.getSq_name());//根据社区名查询发帖总数
		return SUCCESS;
	}

	
	/** setter and getter method */
	public List<TzRemark> getTzRemarks() {
		return tzRemarks;
	}

	public void setTzRemarks(List<TzRemark> tzRemarks) {
		this.tzRemarks = tzRemarks;
	}

	public Sq getSq() {
		return sq;
	}

	public void setSq(Sq sq) {
		this.sq = sq;
	}

	public Tz getTz() {
		return tz;
	}

	public void setTz(Tz tz) {
		this.tz = tz;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}


	public String getTzId() {
		return tzId;
	}


	public void setTzId(String tzId) {
		this.tzId = tzId;
	}


	public String getSqId() {
		return sqId;
	}


	public void setSqId(String sqId) {
		this.sqId = sqId;
	}
}
