package service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import entity.Server;
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
}
