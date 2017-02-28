package org.yxsq.dto;

public class UserVo {

	private int id;
	private String username;
	private String nickname;
	private int sex;
	private int status;
	private String age;
	
	/** setter and getter method */
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	/** 将返回值类型进行修改 */
	public String getSex() {
		/**
		 * set进内存、get出网页！输出时候可以在这里进行修改格式
		 */
		return sex == 1 ? "男" : "女";
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	/** 将返回值类型进行修改 */
	public String getStatus() {
		/**
		 * set进内存、get出网页！输出时候可以在这里进行修改格式
		 */
		String[] roles = {"管理员", "Y主", "普通会员"};
		return roles[this.status - 1];
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
