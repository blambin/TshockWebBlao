package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import common.ServerConnection;

@Controller
public class ApiController {

	public String sufixUrl;
	public String status;
	
	@RequestMapping("/status")
	public String status(HttpServletResponse res) throws IOException {
		sufixUrl = "/status";
		ServerConnection sc = new ServerConnection(sufixUrl);
		status = sc.connection();
		PrintWriter out = res.getWriter();
		out.write(status);
		out.flush();
		out.close();
		return null;
	}
}
