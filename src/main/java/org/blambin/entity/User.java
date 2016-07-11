package org.blambin.entity;

import lombok.Data;

@Data
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

}
