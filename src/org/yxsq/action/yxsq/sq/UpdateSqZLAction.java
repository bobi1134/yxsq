package org.yxsq.action.yxsq.sq;

import java.io.File;

import org.yxsq.action.base.AbstractAction;
import org.yxsq.dto.Sq;
import org.yxsq.dto.User;
import org.yxsq.service.YxsqService;
import org.yxsq.service.impl.YxsqServiceImpl;
import org.yxsq.service.proxy.ProxyFactory;

public class UpdateSqZLAction extends AbstractAction {

	private static final long serialVersionUID = 1L;
	private YxsqService yxsqService = ProxyFactory.getProxy(new YxsqServiceImpl());
	
	private String sq_introduction;
	private String sq_logo_imgUrl;
	private String sq_imgUrl;
	
	private File sq_logo_img;
	private String sq_logo_imgFileName;
	
	private File sq_img;
	private String sq_imgFileName;
	
	private String sqId;
	private String userId;
	
	private Sq sq;
	private User user;

	/**
	 * Y主异步修改社区资料
	 */
	public String updateSqZL() {
		// TODO Auto-generated method stub
		try {
			yxsqService.updateSqZL(sq_introduction, sq_logo_imgUrl, sq_logo_img,  sq_logo_imgFileName, sq_imgUrl, sq_img, sq_imgFileName, sqId);
			sq = yxsqService.selectSqBySqId(sqId);
			user = yxsqService.selectUserById(Integer.valueOf(userId));
			setTip("修改成功！");
		} catch (Exception e) {
			// TODO: handle exception
			setTip("修改失败！");
			e.printStackTrace();
		}
		return SUCCESS;
	}



	/** setter and getter method */
	public String getSq_introduction() {
		return sq_introduction;
	}
	public void setSq_introduction(String sq_introduction) {
		this.sq_introduction = sq_introduction;
	}
	public String getSq_logo_imgFileName() {
		return sq_logo_imgFileName;
	}
	public void setSq_logo_imgFileName(String sq_logo_imgFileName) {
		this.sq_logo_imgFileName = sq_logo_imgFileName;
	}
	public String getSq_imgFileName() {
		return sq_imgFileName;
	}
	public void setSq_imgFileName(String sq_imgFileName) {
		this.sq_imgFileName = sq_imgFileName;
	}
	public File getSq_logo_img() {
		return sq_logo_img;
	}
	public void setSq_logo_img(File sq_logo_img) {
		this.sq_logo_img = sq_logo_img;
	}
	public File getSq_img() {
		return sq_img;
	}
	public void setSq_img(File sq_img) {
		this.sq_img = sq_img;
	}
	public String getSq_logo_imgUrl() {
		return sq_logo_imgUrl;
	}
	public void setSq_logo_imgUrl(String sq_logo_imgUrl) {
		this.sq_logo_imgUrl = sq_logo_imgUrl;
	}
	public String getSq_imgUrl() {
		return sq_imgUrl;
	}
	public void setSq_imgUrl(String sq_imgUrl) {
		this.sq_imgUrl = sq_imgUrl;
	}
	public String getSqId() {
		return sqId;
	}
	public void setSqId(String sqId) {
		this.sqId = sqId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Sq getSq() {
		return sq;
	}
	public void setSq(Sq sq) {
		this.sq = sq;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}
