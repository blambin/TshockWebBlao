package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import entity.Server;
import service.IServerService;

@Controller
public class ServerController {

	@Autowired
	private IServerService serverService;
	
	@RequestMapping("saveserver")
	public String saveServer(Server server){
		
		serverService.saveServer(server);
		return "main";
	}
}
