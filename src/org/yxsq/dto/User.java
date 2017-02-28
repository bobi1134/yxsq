package org.yxsq.dto;

import java.util.Date;


public class User {
	private int id;
	private String username;
	private String password;
	private String nickname;
	private Date age;
	private String img;
	private String homepage_img;
	private int status;
	private int sex;
	private String email;
	private String yz_sqId;
	private String see_Id;
	
	/** setter and getter method */
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Date getAge() {
		return age;
	}
	public void setAge(Date age) {
		this.age = age;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getHomepage_img() {
		return homepage_img;
	}
	public void setHomepage_img(String homepage_img) {
		this.homepage_img = homepage_img;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getYz_sqId() {
		return yz_sqId;
	}
	public void setYz_sqId(String yz_sqId) {
		this.yz_sqId = yz_sqId;
	}
	public String getSee_Id() {
		return see_Id;
	}
	public void setSee_Id(String see_Id) {
		this.see_Id = see_Id;
	}
}
