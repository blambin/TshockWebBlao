package org.blambin.dao;



import java.util.List;

import org.blambin.entity.Server;
import org.blambin.entity.User;



public interface IServerMapping {
	 
	public void saveServer(Server server);
	
	public List<Server> queryServerByUser(User user);

	public Server queryServerByServerId(Server server);
	
	public void updateserver(Server server);
	
	public void deleteserver(Server server);
}
