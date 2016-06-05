package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import common.ServerConnection;
import entity.User;

@Controller
public class ApiController {

	public String sufixUrl;
	public String status;
	
	@RequestMapping("/status")
	public String status(HttpServletResponse res) throws IOException {
		sufixUrl = "/status";
		status = this.getStatus(res, sufixUrl);
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.write(status);
		out.flush();
		out.close();
		return null;
	}
	
	
	@RequestMapping("/v2/token/create")
	public String create(HttpServletResponse res,User user) throws IOException {
		sufixUrl = "/v2/token/create?username="+user.getUsername()+"&password="+user.getPassword() ;
		return this.getStatus(res, sufixUrl);
	}
	
	public String getStatus(HttpServletResponse res,String sufixUrl) throws IOException {
		ServerConnection sc = new ServerConnection(sufixUrl);
		status = sc.connection();
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.write(status);
		out.flush();
		out.close();
		return null;
	}
}
