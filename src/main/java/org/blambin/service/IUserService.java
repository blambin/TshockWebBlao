package org.blambin.service;

import org.blambin.entity.User;

public interface IUserService {

	public void register(User user);
	
	public User login(User user);
	
	public int queryUserNameCount(User user);
	
	public void save(User user);
	
	public User checkToken(User user);
	
	public void updateUser(User user);
}
