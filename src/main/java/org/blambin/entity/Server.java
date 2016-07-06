package org.blambin.entity;

import lombok.Data;

@Data
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
    private String isPublic;
    
} 
