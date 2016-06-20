package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import common.RestServer;
import entity.Server;
import entity.User;
import service.IServerService;

@Controller
@RequestMapping("/server")

public class ServerController {

	@Autowired
	private IServerService serverService;

	@RequestMapping("/api/saveserver")
	public @ResponseBody Map<String, Object> apiSaveServer(Server server) {

		serverService.saveServer(server);

		Map<String, Object> success = new HashMap<>();
		success.put("msg", "success");
		return success;
	}

	@RequestMapping("/saveserver")
	public String saveServer(Server server, HttpSession session) {
		User user = (User) session.getAttribute("user");
		server.setServerOwner(user);
		serverService.saveServer(server);

		// 刚添加完肯定会有一个服务器
		// 设置当前服务器并设置token
		session.setAttribute("currentServer", serverService.queryServerByUser(user).get(0));

		RestServer rs = new RestServer(session);
		if (null == (rs.getToken())) {
			rs.setServerToken();
		}
		session.setAttribute("rs", rs);

		// 刷新服务器列表
		session.setAttribute("servers", serverService.queryServerByUser(user));
		return "main";
	}

	@RequestMapping("api/queryServerByUserId")
	public @ResponseBody List<Server> queryServerByUserId(String id) {
		User user = new User();
		user.setId(id);
		return serverService.queryServerByUser(user);

	}

	@RequestMapping("/queryServerByServerId")
	public String queryServerByServerId(int id, RedirectAttributes ra, HttpServletResponse response,
			HttpServletRequest request) throws ServletException, IOException {

		ra.addAttribute("serverid", id);
		ra.addAttribute("contentid", "2");

		return "redirect:/home/content.action";
	}

	@RequestMapping("updateserver")
	public String updateserver(Server server, HttpSession session) {

		// 判断是不是这个人的服务器，不能乱改233
		User user = (User) session.getAttribute("user");

		if (serverService.queryServerByServerId(server).getServerOwner().getId().equals(user.getId())) {

			server.setServerOwner(user);
			serverService.updateserver(server);

			// 刷新服务器列表
			session.setAttribute("servers", serverService.queryServerByUser(user));
		}
		return "main";

	}

	@RequestMapping("/deleteserver")
	public String deleteserver(Server server, HttpSession session) {
		// 判断是不是这个人的服务器，不能乱改233
		User user = (User) session.getAttribute("user");

		if (serverService.queryServerByServerId(server).getServerOwner().getId().equals(user.getId())) {

			serverService.deleteserver(server);

			// 刷新服务器列表
			session.setAttribute("servers", serverService.queryServerByUser(user));
		}
		return "main";
	}
}
