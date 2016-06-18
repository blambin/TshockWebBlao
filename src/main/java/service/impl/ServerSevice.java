package service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import entity.Server;
import entity.User;
import mapper.IServerMapping;
import service.IServerService;

@Service
public class ServerSevice implements IServerService {

	@Autowired
	private IServerMapping serverMapping;

	@Override
	public void saveServer(Server server) {
		serverMapping.saveServer(server);
		
	}

	@Override
	public List<Server> queryServerByUser(User user) {
		return serverMapping.queryServerByUser(user);
	}

	@Override
	public Server queryServerByServerId(Server server) {
		
		return serverMapping.queryServerByServerId(server);
	}

	@Override
	public void updateserver(Server server) {
		serverMapping.updateserver(server);
		
	}

	@Override
	public void deleteserver(Server server) {
		serverMapping.deleteserver(server);
		
	}
}
