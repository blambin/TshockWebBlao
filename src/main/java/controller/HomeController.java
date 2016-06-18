package controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import common.ContentType;
import entity.Server;
import service.IServerService;

@Controller
@RequestMapping("/home")
public class HomeController {

	
	@Autowired
	private IServerService serverService;
	
	@RequestMapping("/content")
	public String selectBodyContent(HttpSession session,Integer contentid,RedirectAttributes ra,HttpServletRequest request){
		
		session.setAttribute("contentid", contentid);
		
		if (contentid == ContentType.AddServer) {
			
		}
		if (contentid == ContentType.ServerDetail){
			Server server = new Server();
			server.setId(Integer.parseInt((String) request.getParameter("serverid")));
			session.setAttribute("currentServer", serverService.queryServerByServerId(server));
		}
		
		return "main";
		
	}
}
