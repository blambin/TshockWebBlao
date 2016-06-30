package org.blambin.common;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Scanner;

import javax.servlet.http.HttpSession;

import org.blambin.common.exception.ErrorAPIException;
import org.blambin.common.exception.ServerUnreachException;
import org.blambin.common.exception.TokenUnvalidException;
import org.blambin.common.exception.URLErrorException;
import org.blambin.common.exception.UnKnownErrorException;
import org.blambin.entity.Server;
import org.json.JSONObject;



public class RestServer {

	private Server server;
	private String baseUrl;

	private URL url;

	/***
	 * 伺服器令牌
	 */
	private String token;

	public Server getServer() {
		return server;
	}

	public void setServer(Server server) {
		this.server = server;
		setBaseUrl();
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

	public RestServer() {
		super();
	}

	/***
	 * 从session中获取Server 对象
	 * 
	 * @param session
	 */
	public RestServer(HttpSession session) {
		try {
			Server server = (Server) session.getAttribute("currentServer");
			this.server = server;
			this.baseUrl = "http://" + server.getServerUrl() + ":" + server.getServerRestAPIPort();
			url = new URL(baseUrl);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/***
	 * 设置基础url @author blambin @since 2016年6月22日 @category : @throws void
	 */
	public void setBaseUrl() {
		this.baseUrl = "http://" + server.getServerUrl() + ":" + server.getServerRestAPIPort();

		try {
			url = new URL(baseUrl);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
	}

	/***
	 * 设置令牌
	 * 
	 * 第一次设置成功会返回 200 如果返回 null ,则表示不更改原先的 token 如果返回错误代码，则以msg为准
	 */
	public JSONObject setServerToken() {
		
		
		// 判断是否为空或过期
		if (token == null || !isTokenValid(token)) {
			String exUrl = baseUrl + "/v2/token/create?username=" + server.getServerAdminUserName() + "&password="
					+ server.getServerAdminPassword();
			JSONObject jo;
			JSONObject errorJson;
			try {
				jo = getJsonFromUrlString(exUrl);
				token = (String) jo.get("token");
				return jo;
			} catch (URLErrorException e) {

				e.printStackTrace();

				errorJson = new JSONObject();
				errorJson.put("status", ErrorCode.URLError);
				errorJson.put("msg", e.getMessage());
				return errorJson;
			} catch (ServerUnreachException e) {

				e.printStackTrace();
				errorJson = new JSONObject();
				errorJson.put("status", ErrorCode.ServerUnreach);
				errorJson.put("msg", e.getMessage());
				return errorJson;
			} catch (TokenUnvalidException e) {

				e.printStackTrace();
				errorJson = new JSONObject();

				errorJson.put("status", ErrorCode.TokenUnvalid);
				errorJson.put("msg", e.getMessage());
				return errorJson;
			} catch (ErrorAPIException e) {

				e.printStackTrace();
				errorJson = new JSONObject();
				errorJson.put("status", ErrorCode.ErrorAPI);
				errorJson.put("msg", e.getMessage());
				return errorJson;
			} catch (UnKnownErrorException e) {

				e.printStackTrace();
				errorJson = new JSONObject();
				errorJson.put("status", ErrorCode.UnKnownError);
				errorJson.put("msg", e.getMessage());
				return errorJson;
			}
		}
		return null;
	}

	/***
	 * 判断token是否还有效 无效则返回false
	 * 
	 * @param token
	 * @return
	 */
	public Boolean isTokenValid(String token) {

		String exUrl = baseUrl + "/tokentest?token=" + token;
		JSONObject jo;
		try {
			jo = getJsonFromUrlString(exUrl);
			if ("200".equals(jo.getString("status"))) {
				return true;
			}

		} catch (URLErrorException e) {

			e.printStackTrace();
		} catch (ServerUnreachException e) {

			e.printStackTrace();
		} catch (TokenUnvalidException e) {

			e.printStackTrace();
		} catch (ErrorAPIException e) {

			e.printStackTrace();
		} catch (UnKnownErrorException e) {

			e.printStackTrace();
		}

		return false;

	}

	/***
	 * 广播功能
	 * 
	 * @return
	 */

	public JSONObject broadcast(String msg) {
		
		JSONObject jo;
		JSONObject errorJson;
		String newmsg;
		
		try {
			newmsg = URLEncoder.encode(msg, "UTF-8");
		    String exUrl = baseUrl + "/v2/server/broadcast?msg=" + newmsg + "&token=" + token;
			jo = getJsonFromUrlString(exUrl);
			return jo;
		} catch (URLErrorException e) {

			e.printStackTrace();

			errorJson = new JSONObject();
			errorJson.put("status", ErrorCode.URLError);
			errorJson.put("msg", e.getMessage());
			return errorJson;
		} catch (ServerUnreachException e) {

			e.printStackTrace();
			errorJson = new JSONObject();
			errorJson.put("status", ErrorCode.ServerUnreach);
			errorJson.put("msg", e.getMessage());
			return errorJson;
		} catch (TokenUnvalidException e) {

			e.printStackTrace();
			errorJson = new JSONObject();

			errorJson.put("status", ErrorCode.TokenUnvalid);
			errorJson.put("msg", e.getMessage());
			return errorJson;
		} catch (ErrorAPIException e) {

			e.printStackTrace();
			errorJson = new JSONObject();
			errorJson.put("status", ErrorCode.ErrorAPI);
			errorJson.put("msg", e.getMessage());
			return errorJson;
		} catch (UnKnownErrorException e) {

			e.printStackTrace();
			errorJson = new JSONObject();
			errorJson.put("status", ErrorCode.UnKnownError);
			errorJson.put("msg", e.getMessage());
			return errorJson;
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			errorJson = new JSONObject();
			errorJson.put("status", ErrorCode.UnKnownError);
			errorJson.put("msg", e.getMessage());
			return errorJson;
		}
		
	}

	/***
	 * 获取服务器状态
	 * 
	 * @return
	 */
	public JSONObject status() {
		String exUrl = baseUrl + "/v2/server/status?token=" + token + "&players=true&rules=true";

		JSONObject jo;
		JSONObject errorJson;

		try {
			jo = getJsonFromUrlString(exUrl);
			return jo;

		} catch (URLErrorException e) {

			e.printStackTrace();

			errorJson = new JSONObject();
			errorJson.put("status", ErrorCode.URLError);
			errorJson.put("msg", e.getMessage());
			return errorJson;
		} catch (ServerUnreachException e) {

			e.printStackTrace();
			errorJson = new JSONObject();
			errorJson.put("status", ErrorCode.ServerUnreach);
			errorJson.put("msg", e.getMessage());
			return errorJson;
		} catch (TokenUnvalidException e) {

			e.printStackTrace();
			errorJson = new JSONObject();

			errorJson.put("status", ErrorCode.TokenUnvalid);
			errorJson.put("msg", e.getMessage());
			return errorJson;
		} catch (ErrorAPIException e) {

			e.printStackTrace();
			errorJson = new JSONObject();
			errorJson.put("status", ErrorCode.ErrorAPI);
			errorJson.put("msg", e.getMessage());
			return errorJson;
		} catch (UnKnownErrorException e) {

			e.printStackTrace();
			errorJson = new JSONObject();
			errorJson.put("status", ErrorCode.UnKnownError);
			errorJson.put("msg", e.getMessage());
			return errorJson;
		}

	}

	/***
	 * 运行命令
	 * 
	 * @param cmd
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public JSONObject rawcmd(String cmd) {
		
		try {
			
			String newcmd = URLEncoder.encode(cmd, "UTF-8");
			String exUrl = baseUrl + "/v2/server/rawcmd?token=" + token + "&cmd=" + newcmd;
			return getJsonFromUrlString(exUrl);
			
			
		} catch (URLErrorException e) {

			e.printStackTrace();
		} catch (ServerUnreachException e) {

			e.printStackTrace();
		} catch (TokenUnvalidException e) {

			e.printStackTrace();
		} catch (ErrorAPIException e) {

			e.printStackTrace();
		} catch (UnKnownErrorException e) {

			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/***
	 * 显示所有注册 用户列表
	 * 
	 * @author blambin
	 * @since 2016年6月25日
	 * @category TODO:
	 * @throws @return
	 *             JSONObject
	 */

	public JSONObject showUserList() {
		String exUrl = baseUrl + "/v2/users/list?token=" + token;

		JSONObject jo;
		JSONObject errorJson;

		try {
			jo = getJsonFromUrlString(exUrl);
			return jo;
		} catch (URLErrorException e) {

			e.printStackTrace();

			errorJson = new JSONObject();
			errorJson.put("status", ErrorCode.URLError);
			errorJson.put("msg", e.getMessage());
			return errorJson;
		} catch (ServerUnreachException e) {

			e.printStackTrace();
			errorJson = new JSONObject();
			errorJson.put("status", ErrorCode.ServerUnreach);
			errorJson.put("msg", e.getMessage());
			return errorJson;
		} catch (TokenUnvalidException e) {

			e.printStackTrace();
			errorJson = new JSONObject();

			errorJson.put("status", ErrorCode.TokenUnvalid);
			errorJson.put("msg", e.getMessage());
			return errorJson;
		} catch (ErrorAPIException e) {

			e.printStackTrace();
			errorJson = new JSONObject();
			errorJson.put("status", ErrorCode.ErrorAPI);
			errorJson.put("msg", e.getMessage());
			return errorJson;
		} catch (UnKnownErrorException e) {

			e.printStackTrace();
			errorJson = new JSONObject();
			errorJson.put("status", ErrorCode.UnKnownError);
			errorJson.put("msg", e.getMessage());
			return errorJson;
		}
	}

	/***
	 * 获取当前所有在线玩家列表 
	 * @author blambin
	 * @since 2016年6月25日
	 * @category TODO:
	 * @throws 
	 * @return
	 * JSONObject
	 */
	public JSONObject getActivePlayers() {
		String exUrl = baseUrl + "/v2/players/list?token=" + token;

		JSONObject jo;
		JSONObject errorJson;

		try {
			jo = getJsonFromUrlString(exUrl);
			return jo;
		} catch (URLErrorException e) {

			e.printStackTrace();

			errorJson = new JSONObject();
			errorJson.put("status", ErrorCode.URLError);
			errorJson.put("msg", e.getMessage());
			return errorJson;
		} catch (ServerUnreachException e) {

			e.printStackTrace();
			errorJson = new JSONObject();
			errorJson.put("status", ErrorCode.ServerUnreach);
			errorJson.put("msg", e.getMessage());
			return errorJson;
		} catch (TokenUnvalidException e) {

			e.printStackTrace();
			errorJson = new JSONObject();

			errorJson.put("status", ErrorCode.TokenUnvalid);
			errorJson.put("msg", e.getMessage());
			return errorJson;
		} catch (ErrorAPIException e) {

			e.printStackTrace();
			errorJson = new JSONObject();
			errorJson.put("status", ErrorCode.ErrorAPI);
			errorJson.put("msg", e.getMessage());
			return errorJson;
		} catch (UnKnownErrorException e) {

			e.printStackTrace();
			errorJson = new JSONObject();
			errorJson.put("status", ErrorCode.UnKnownError);
			errorJson.put("msg", e.getMessage());
			return errorJson;
		}
	}
	
	/***
	 * 获取具体一个用户的详细信息
	 * @author blambin
	 * @since 2016年6月25日
	 * @category TODO:
	 * @throws 
	 * @param username 游戏名或注册名
	 * @return
	 * JSONObject
	 */
	public JSONObject getPlayerDetail(String username) {
		String newusername;
		JSONObject jo;
		JSONObject errorJson;

		try {
			newusername = URLEncoder.encode(username, "UTF-8");
			String exUrl = baseUrl + "/v3/players/read?token=" + token + "&player=" + newusername;
			jo = getJsonFromUrlString(exUrl);
			return jo;
		} catch (URLErrorException e) {

			e.printStackTrace();

			errorJson = new JSONObject();
			errorJson.put("status", ErrorCode.URLError);
			errorJson.put("msg", e.getMessage());
			return errorJson;
		} catch (ServerUnreachException e) {

			e.printStackTrace();
			errorJson = new JSONObject();
			errorJson.put("status", ErrorCode.ServerUnreach);
			errorJson.put("msg", e.getMessage());
			return errorJson;
		} catch (TokenUnvalidException e) {

			e.printStackTrace();
			errorJson = new JSONObject();

			errorJson.put("status", ErrorCode.TokenUnvalid);
			errorJson.put("msg", e.getMessage());
			return errorJson;
		} catch (ErrorAPIException e) {

			e.printStackTrace();
			errorJson = new JSONObject();
			errorJson.put("status", ErrorCode.ErrorAPI);
			errorJson.put("msg", e.getMessage());
			return errorJson;
		} catch (UnKnownErrorException e) {

			e.printStackTrace();
			errorJson = new JSONObject();
			errorJson.put("status", ErrorCode.UnKnownError);
			errorJson.put("msg", e.getMessage());
			return errorJson;
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			errorJson = new JSONObject();
			errorJson.put("status", ErrorCode.UnKnownError);
			errorJson.put("msg", e.getMessage());
			return errorJson;
		}
	}

	public String getToken() {
		return token;
	}

	/***
	 * 根据url字符串连接远程,获取json对象
	 * 
	 * @param urlString
	 * @return
	 * @throws URLErrorException
	 * @throws ServerUnreachException
	 * @throws TokenUnvalidException
	 * @throws ErrorAPIException
	 * @throws UnKnownErrorException
	 */
	public JSONObject getJsonFromUrlString(String urlString) throws URLErrorException, ServerUnreachException,
			TokenUnvalidException, ErrorAPIException, UnKnownErrorException {
		try {

			// 替换空格
			String encodeUrlString = urlString.replace(" ", "%20");
			url = new URL(encodeUrlString);

			
			StringBuilder contentBuffer = new StringBuilder();

			Scanner sc = new Scanner(url.openStream(), "utf-8");
			while (sc.hasNextLine()) {
				
				contentBuffer.append(sc.nextLine());
				
			}
			sc.close();

			
			
			JSONObject ja = new JSONObject(contentBuffer.toString());

			if (ja.get("status").equals("200")) {
				return ja;
			} else if (ja.get("status").equals("403")) {
				throw new TokenUnvalidException((String) ja.get("error"));
			} else if (ja.get("status").equals("404")) {
				throw new ErrorAPIException((String) ja.get("error"));
			} else {
				throw new UnKnownErrorException((String) ja.get("error"));
			}

		} catch (MalformedURLException e) {
			e.printStackTrace();
			throw new URLErrorException(e);

		} catch (IOException e) {
			e.printStackTrace();
			throw new ServerUnreachException(e);
		}
	}
}
