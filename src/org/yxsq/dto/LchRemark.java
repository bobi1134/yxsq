package org.yxsq.dto;

import java.util.Date;

public class LchRemark {

	private int id;
	private String lch_remark_content;
	private Date lch_remark_time;
	private User user;
	
	
	/** setter and getter method */
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLch_remark_content() {
		return lch_remark_content;
	}
	public void setLch_remark_content(String lch_remark_content) {
		this.lch_remark_content = lch_remark_content;
	}
	public Date getLch_remark_time() {
		return lch_remark_time;
	}
	public void setLch_remark_time(Date lch_remark_time) {
		this.lch_remark_time = lch_remark_time;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}
