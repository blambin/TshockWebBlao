package org.blambin.entity;


public class User {

	
	private String id; //用户Id
	private String displayName; //昵称
	private String userName; //用户登陆名
	private String password; //密码
	private String pics; //用户头像
	private int qq;
	private String email;
	private String website;
	private String userToken; //存在cookie里的token
	private String userCookieString; //存在cookie里的标识
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDisplayName() {
		return displayName;
	}
	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPics() {
		return pics;
	}
	public void setPics(String pics) {
		this.pics = pics;
	}
	public int getQq() {
		return qq;
	}
	public void setQq(int qq) {
		this.qq = qq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getUserToken() {
		return userToken;
	}
	public void setUserToken(String userToken) {
		this.userToken = userToken;
	}
	public String getUserCookieString() {
		return userCookieString;
	}
	public void setUserCookieString(String userCookieString) {
		this.userCookieString = userCookieString;
	}

	
}
