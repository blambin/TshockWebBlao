package org.blambin.service.impl;



import org.blambin.dao.IUserMapping;
import org.blambin.entity.User;
import org.blambin.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



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
