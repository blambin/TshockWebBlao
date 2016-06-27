package org.blambin.dao;

import org.blambin.entity.User;

public interface IUserMapping {

	public User login(User user);
	
	public void saveUser(User user);
	
	public int queryUserNameCount(User user);
}
