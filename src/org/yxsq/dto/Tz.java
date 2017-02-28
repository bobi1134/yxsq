package org.yxsq.dto;

import java.util.Date;

public class Tz {

	private int id;
	private String tz_title;
	private String tz_content;
	private Date tz_time;
	private int remarkCount;
	private String lastRemark;
	private String sqId;
	private User user;
	private Sq sq;
	private TzRemark tz_Remark;
	private String userId;
	private String status;
	
	/** setter and method */
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTz_title() {
		return tz_title;
	}
	public void setTz_title(String tz_title) {
		this.tz_title = tz_title;
	}
	public String getTz_content() {
		return tz_content;
	}
	public void setTz_content(String tz_content) {
		this.tz_content = tz_content;
	}
	public Date getTz_time() {
		return tz_time;
	}
	public void setTz_time(Date tz_time) {
		this.tz_time = tz_time;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Sq getSq() {
		return sq;
	}
	public void setSq(Sq sq) {
		this.sq = sq;
	}
	public TzRemark getTz_Remark() {
		return tz_Remark;
	}
	public void setTz_Remark(TzRemark tz_Remark) {
		this.tz_Remark = tz_Remark;
	}
	public int getRemarkCount() {
		return remarkCount;
	}
	public void setRemarkCount(int remarkCount) {
		this.remarkCount = remarkCount;
	}
	public String getLastRemark() {
		return lastRemark;
	}
	public void setLastRemark(String lastRemark) {
		this.lastRemark = lastRemark;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
