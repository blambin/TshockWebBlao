package common;



import java.io.IOException;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;

import common.impl.Server;

public class ServerConnection {

	
	private IServer server;
	
	/***
	 * 网址的后半部分，要加 "/"
	 */
	private String sufixUrl;
	
	private HttpGet hg;
	
	public ServerConnection(String sufixUrl) {
		server = new Server();
		this.sufixUrl = sufixUrl;
		hg = new HttpGet(server.getUrl()+sufixUrl);
	}

	public String connection(){
		try {
			HttpResponse response = new DefaultHttpClient().execute(hg);

			if(response.getStatusLine().getStatusCode()==200){
				//如果状态码为200,就是正常返回
				String result=EntityUtils.toString(response.getEntity());
				return result;
			};
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
