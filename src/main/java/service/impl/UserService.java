package service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import entity.User;
import mapper.IUserMapping;
import service.IUserService;

@Service
public class UserService implements IUserService {

	@Autowired
	private IUserMapping userMapping;

	@Override
	public void register(User user) {
		userMapping.saveUser(user);
	}

	@Override
	public User login(User user) {
		return userMapping.login(user);
	}

	@Override
	public int queryUserNameCount(User user) {
		return userMapping.queryUserNameCount(user);
	}

}
