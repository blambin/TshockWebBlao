package org.blambin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.blambin.common.AESUtil;
import org.blambin.common.ConfigInfo;
import org.blambin.common.RestServer;
import org.blambin.common.ServerCommon;
import org.blambin.entity.Server;
import org.blambin.entity.User;
import org.blambin.service.IServerService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/server")

public class ServerController {

	@Autowired
	private IServerService serverService;

	@Autowired
	private ConfigInfo configInfo;
	
	
	@Autowired
	private ServerCommon serverCommon;
	
	
	@RequestMapping("/api/saveserver")
	public @ResponseBody Map<String, Object> apiSaveServer(Server server) {

		String adminPassword = server.getServerAdminPassword();
		byte[] BytenewAdminPassword = AESUtil.encrypt(adminPassword, configInfo.getRc4Pwd());
		String newAdminPassword = AESUtil.parseByte2HexStr(BytenewAdminPassword);
		server.setServerAdminPassword(newAdminPassword);

		Map<String, Object> success = new HashMap<>();
		success.put("msg", "success");
		return success;
	}

	@RequestMapping("/saveserver")
	public String saveServer(Server server, HttpSession session) {
		User user = (User) session.getAttribute("user");
		server.setServerOwner(user);
		
		
		//加密保存用户密码
		String adminPassword = server.getServerAdminPassword();
		byte[] BytenewAdminPassword = AESUtil.encrypt(adminPassword, configInfo.getRc4Pwd());
		String newAdminPassword = AESUtil.parseByte2HexStr(BytenewAdminPassword);
		server.setServerAdminPassword(newAdminPassword);
		
		serverService.saveServer(server);

		// 刚添加完肯定会有一个服务器
		// 设置当前服务器并设置token
		// 解密后放到session里
		
		Server currentServer = serverService.queryServerByUser(user).get(0);
		serverCommon.SetServerInSession(currentServer, session);
		

		RestServer rs = new RestServer(session);
		if (null == (rs.getToken())) {
			rs.setServerToken();
		}
		session.setAttribute("rs", rs);

		// 刷新服务器列表
		session.setAttribute("servers", serverService.queryServerByUser(user));
		return "main";
	}

	/***
	 * 保存server之前简单测试保存的信息是否正确
	 * @param server 
	 * @param session 
	 * @return
	 */
	@RequestMapping("/validserverinfo")
	public @ResponseBody JSONObject validServerInfo(Server server, HttpSession session){
		
		User user = (User) session.getAttribute("user");
		server.setServerOwner(user);
		//传入未经验证的server
		RestServer rs = new RestServer();
		rs.setServer(server);
		
		JSONObject jo = rs.setServerToken();
		if (jo==null) {
			JSONObject errerJson = new JSONObject();
			errerJson.append("status", "未知错误");
			return errerJson;
		}else if ("200".equals(jo.getString("status"))) {
			return jo;
		}else if ("403".equals(jo.getString("status"))) {
			return jo;
		}
		return null;
	}
	
	
	@RequestMapping("api/queryServerByUserId")
	public @ResponseBody List<Server> queryServerByUserId(String id) {
		User user = new User();
		user.setId(id);
		return serverService.queryServerByUser(user);

	}

	/***
	 * 用服务器id来查询单个服务器
	 * @param id
	 * @param ra
	 * @param response
	 * @param request
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/queryServerByServerId")
	public String queryServerByServerId(int id, RedirectAttributes ra, HttpServletResponse response,
			HttpServletRequest request) throws ServletException, IOException {

		ra.addAttribute("serverid", id);
		ra.addAttribute("contentid", "2");

		return "redirect:/home/content.action";
	}

	/***
	 * 更新服务器信息
	 * @param server
	 * @param session
	 * @return
	 */
	@RequestMapping("updateserver")
	public String updateserver(Server server, HttpSession session) {

		// 判断是不是这个人的服务器，不能乱改233
		User user = (User) session.getAttribute("user");

		if (serverService.queryServerByServerId(server).getServerOwner().getId().equals(user.getId())) {

			server.setServerOwner(user);
			
			String adminPassword = server.getServerAdminPassword();
			byte[] BytenewAdminPassword = AESUtil.encrypt(adminPassword, configInfo.getRc4Pwd());
			String newAdminPassword = AESUtil.parseByte2HexStr(BytenewAdminPassword);
			server.setServerAdminPassword(newAdminPassword);
			
			serverService.updateserver(server);

			// 刷新服务器列表
			session.setAttribute("servers", serverService.queryServerByUser(user));
		}
		return "main";

	}

	/***
	 * 删除服务器信息
	 * @param server
	 * @param session
	 * @return
	 */
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
