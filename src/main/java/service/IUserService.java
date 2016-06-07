package service;

import entity.User;

public interface IUserService {

	public void register(User user);
	
	public User login(User user);
}
