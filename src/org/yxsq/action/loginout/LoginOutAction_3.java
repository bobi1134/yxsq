package org.yxsq.action.loginout;


import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.tool.characterprocess.CharacterProcess;
import org.yxsq.action.base.AbstractAction;
import org.yxsq.dto.Sq;
import org.yxsq.dto.Tz;
import org.yxsq.service.YxsqService;
import org.yxsq.service.impl.YxsqServiceImpl;
import org.yxsq.service.proxy.ProxyFactory;

public class LoginOutAction_3 extends AbstractAction {

	private static final long serialVersionUID = 1L;
	private YxsqService yxsqService = ProxyFactory.getProxy(new YxsqServiceImpl());
	
	private int ftzs;
	private List<Tz> tzs;
	private String flag;
	private String tz_title;
	private String ckeditor;
	private String sqName;
	private Sq sq;

	public String execute(){
		ServletActionContext.getRequest().getSession().invalidate();
		/**
		 * 查询该社区的相关信息
		 */
		sq = yxsqService.sqGo(sqName);
		/**
		 * 查询相应社区的帖子总数
		 */
		ftzs = yxsqService.selectSqTzCount(sqName);
		/**
		 * 查询所有帖子、发帖人、发帖时间、最后评论者
		 */
		pageModel.setPageSize(15);
		tzs = yxsqService.selectTzsBySqName(sqName, pageModel);
		if (flag != null) {
			setTz_title("");
			setCkeditor("");
		}
		return SUCCESS;
	}

	
	/** setter and getter method */
	public int getFtzs() {
		return ftzs;
	}

	public void setFtzs(int ftzs) {
		this.ftzs = ftzs;
	}

	public List<Tz> getTzs() {
		return tzs;
	}

	public void setTzs(List<Tz> tzs) {
		this.tzs = tzs;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getTz_title() {
		return tz_title;
	}

	public void setTz_title(String tz_title) {
		this.tz_title = tz_title;
	}

	public String getCkeditor() {
		return ckeditor;
	}

	public void setCkeditor(String ckeditor) {
		this.ckeditor = ckeditor;
	}
	public String getSqName() {
		return sqName;
	}
	public void setSqName(String sqName) {
		this.sqName = CharacterProcess.isoToUtf8(sqName);
	}


	public Sq getSq() {
		return sq;
	}


	public void setSq(Sq sq) {
		this.sq = sq;
	}
}
