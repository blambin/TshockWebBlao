package common.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import common.IServer;

public class Server implements IServer {
	
	private String  baseUrl;
	private String port;
	private String url;
	
	private Properties properties;
	private InputStream is;
	
	
	public Server() {
		properties = new Properties();
		this.loadProperties();
	}
	public String getBaseUrl() {
		return baseUrl;
	}
	public void setBaseUrl(String baseUrl) {
		this.baseUrl = baseUrl;
	}
	public String getPort() {
		return port;
	}
	public void setPort(String port) {
		this.port = port;
	}
	
	@Override
	public String getUrl() {
		this.loadProperties();
		return url;
	} 
	
	@Override
	public void loadProperties(){
		
			try {
				is = Server.class.getClassLoader().getResourceAsStream("misc.properties");
				properties.load(is);
				is.close();
				baseUrl = properties.getProperty("ServerBaseUrl");
				port = properties.getProperty("ServerPort", "7878");
				url = "http://"+baseUrl +":" +port;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}
