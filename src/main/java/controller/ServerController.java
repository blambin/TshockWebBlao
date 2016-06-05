package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ServerController {

	@RequestMapping("/broadcast")
	public  String broadcast(HttpSession session, String msg, HttpServletResponse res) throws IOException{
		ApiServlet apiServet = new ApiServlet();
		String json = apiServet.v2ServerBroadcast(session, msg);
		
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.write(json);
		out.flush();
		out.close();
		return null;		
	}
}
