package common;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Scanner;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import entity.Server;

public class RestServer {

	
	private Server server;
	private String baseUrl;
	
	private URL url;
	
	/***
	 *  伺服器令牌
	 */
	private String token;
	
	
	public Server getServer() {
		return server;
	}

	public void setServerBySession(HttpSession session) {
		try {
			Server server = (Server) session.getAttribute("currentServer");
			this.server = server;
			setBaseUrl();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public RestServer(){
		super();
	}
	
	/***
	 * 从session中获取Server 对象
	 * @param session
	 */
	public RestServer(HttpSession session){
		try {
			Server server = (Server) session.getAttribute("currentServer");
			this.server = server;
			this.baseUrl = "http://" + server.getServerUrl() + ":"+ server.getServerRestAPIPort();
			url = new URL(baseUrl);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	
	/***
	 * 设置基础url
	 * @return
	 */
	public void setBaseUrl() {
		this.baseUrl = "http://" + server.getServerUrl() + ":"+ server.getServerRestAPIPort();

		try {
			url = new URL(baseUrl);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
	}
	
	/***
	 * 设置令牌
	 */
	public void setServerToken(){
		//判断是否为空或过期
		if(token==null || !isTokenValid(token)){
			String exUrl = baseUrl + "/v2/token/create?username="+server.getServerAdminUserName()+"&password="+server.getServerAdminPassword() ;
			JSONObject jo = getJsonFromUrlString(exUrl);
			token = (String) jo.get("token");
		}
	}
	
	/***
	 * 判断token是否还有效
	 * 无效则返回false
	 * @param token
	 * @return
	 */
	public Boolean isTokenValid(String token){
		
		String exUrl = baseUrl + "/tokentest?token="+token ;
		JSONObject jo = getJsonFromUrlString(exUrl);
		if("200".equals(jo.getString("status"))){
			return true;
		}else {
			return false;
		}
		
	}
	/***
	 * 广播功能 
	 * @return
	 */
	
	public JSONObject broadcast(String msg){
		String exUrl = baseUrl + "/v2/server/broadcast?msg="+msg+"&token="+token ;
		return getJsonFromUrlString(exUrl);
	}
	/***
	 * 获取服务器状态
	 * @return
	 */
	public JSONObject status(){
		String exUrl = baseUrl + "/v2/server/status?token="+token+"&players=true&rules=true";
		return getJsonFromUrlString(exUrl);
		
	}
	
	/***
	 * 运行命令
	 * @param cmd
	 * @return
	 */
	public JSONObject rawcmd(String cmd){
		String exUrl = baseUrl + "/v2/server/rawcmd?token="+token+"&cmd="+cmd;
		return getJsonFromUrlString(exUrl);
	}

	
	public String getToken() {
		return token;
	}
	
	/***
	 * 根据url字符串连接远程,获取json对象
	 * @param urlString
	 * @return
	 */
	public JSONObject getJsonFromUrlString(String urlString){
		try {
			
			String encodeUrlString  = urlString.replace(" ", "%20");
			url = new URL(encodeUrlString);
			
			
			String contentBuffer = "";
			
			Scanner sc = new Scanner(url.openStream(),"utf-8");
			while (sc.hasNextLine()) {
				contentBuffer += sc.nextLine();
			}
			sc.close();
			
			JSONObject ja = new JSONObject(contentBuffer);
			
			if (ja.get("status").equals("200")) {
				return ja;
			}else {
				return ja;
			}
			//System.out.println(ja.get("status"));
			
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return null;
	}
}
