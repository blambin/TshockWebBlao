package mapper;

import entity.User;

public interface IUserMapping {

	public User login(User user);
	
	public void saveUser(User user);
	
}
