package org.yxsq.dto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TzRemark {

	private int id;
	private String tz_remark_content;
	private Date tz_remark_time;
	private int tzId;
	private Tz tz;
	private User user;
	private List<LchRemark> lchRemarks; 
	private int lchCount;
	private int userId;
	private int lcNum;
	
	
	/** setter and getter method */
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTz_remark_content() {
		return tz_remark_content;
	}
	public void setTz_remark_content(String tz_remark_content) {
		this.tz_remark_content = tz_remark_content;
	}
	public Date getTz_remark_time() {
		return tz_remark_time;
	}
	public void setTz_remark_time(Date tz_remark_time) {
		this.tz_remark_time = tz_remark_time;
	}
	public int getTzId() {
		return tzId;
	}
	public void setTzId(int tzId) {
		this.tzId = tzId;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Tz getTz() {
		return tz;
	}
	public void setTz(Tz tz) {
		this.tz = tz;
	}
	public List<LchRemark> getLchRemarks() {
		return lchRemarks;
	}
	public void setLchRemarks(List<LchRemark> lchRemarks) {
		this.lchRemarks = lchRemarks;
	}
	public int getLchCount() {
		return lchCount;
	}
	public void setLchCount(int lchCount) {
		this.lchCount = lchCount;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getLcNum() {
		return lcNum;
	}
	public void setLcNum(int lcNum) {
		this.lcNum = lcNum;
	}
}
