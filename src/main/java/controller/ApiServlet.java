package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import common.ServerConnection;
import entity.User;

public class ApiServlet {

	private String sufixUrl;
	private String status;

	public String v2TokenCreate(HttpServletResponse res,User user) throws IOException {
		sufixUrl = "/v2/token/create?username="+user.getUsername()+"&password="+user.getPassword() ;
		return this.getStatus(sufixUrl);
	}
	
	public String getStatus(String sufixUrl) throws IOException {
		ServerConnection sc = new ServerConnection(sufixUrl);
		status = sc.connection();
		return status;
	}
}
