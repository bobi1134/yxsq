package org.yxsq.dto;

public class Img {

	private int id;
	private String img_src;
	private String img_href;
	private String img_title;
	private int status;
	
	/** setter and getter method */
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getImg_src() {
		return img_src;
	}
	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}
	public String getImg_href() {
		return img_href;
	}
	public void setImg_href(String img_href) {
		this.img_href = img_href;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getImg_title() {
		return img_title;
	}
	public void setImg_title(String img_title) {
		this.img_title = img_title;
	}
}
