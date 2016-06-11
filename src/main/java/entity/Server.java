package entity;

public class Server {

	private int id ;
    private String serverName ;
    private String serverUrl ;
    private int serverPort ;
    private int serverRestAPIPort;
    private String serverPassword;
    private String serverAdminUserName;
    private String serverAdminPassword;
    private User serverOwner;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getServerName() {
		return serverName;
	}
	public void setServerName(String serverName) {
		this.serverName = serverName;
	}
	public String getServerUrl() {
		return serverUrl;
	}
	public void setServerUrl(String serverUrl) {
		this.serverUrl = serverUrl;
	}
	public int getServerPort() {
		return serverPort;
	}
	public void setServerPort(int serverPort) {
		this.serverPort = serverPort;
	}
	public int getServerRestAPIPort() {
		return serverRestAPIPort;
	}
	public void setServerRestAPIPort(int serverRestAPIPort) {
		this.serverRestAPIPort = serverRestAPIPort;
	}
	public String getServerPassword() {
		return serverPassword;
	}
	public void setServerPassword(String serverPassword) {
		this.serverPassword = serverPassword;
	}
	public String getServerAdminUserName() {
		return serverAdminUserName;
	}
	public void setServerAdminUserName(String serverAdminUserName) {
		this.serverAdminUserName = serverAdminUserName;
	}
	public String getServerAdminPassword() {
		return serverAdminPassword;
	}
	public void setServerAdminPassword(String serverAdminPassword) {
		this.serverAdminPassword = serverAdminPassword;
	}
	public User getServerOwner() {
		return serverOwner;
	}
	public void setServerOwner(User serverOwner) {
		this.serverOwner = serverOwner;
	}


	
} 
