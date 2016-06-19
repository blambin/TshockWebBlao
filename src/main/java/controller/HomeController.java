package controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import common.ContentType;
import common.JSONHelper;
import common.RestServer;
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
			 ServerDetail(session, contentid, request);
		}
		if (contentid == ContentType.ServerBaseCommand) {
			ServerBaseCommand(session, request);
		}
		
		return "main";
		
	}
	
	/***
	 * 服务器详情单页
	 * @param session
	 * @param contentid
	 * @param request
	 */
	
	public void ServerDetail(HttpSession session,Integer contentid,HttpServletRequest request){
		Server server = new Server();
		server.setId(Integer.parseInt((String) request.getParameter("serverid")));
		
		// 设置当前服务器并设置token
		session.setAttribute("currentServer", serverService.queryServerByServerId(server));
		RestServer rs = new RestServer(session);
		if (null==rs.getToken() || ""== rs.getToken()) {
			rs.setServerToken();
		}
		
		session.setAttribute("rs", rs);
	}
	
	
	public void ServerBaseCommand(HttpSession session,HttpServletRequest request){
		
		RestServer rs = (RestServer) session.getAttribute("rs");
		rs.setServerToken();
		request.setAttribute("status",JSONHelper.jsonToMap(rs.status()));
	}
	
	
	@RequestMapping("/rawcmd")
	public @ResponseBody Map<String, Object> rawcmd(HttpSession session,String cmd){
		RestServer rs = (RestServer) session.getAttribute("rs");
		rs.setServerToken();
		return JSONHelper.jsonToMap(rs.rawcmd(cmd));
	}
}
