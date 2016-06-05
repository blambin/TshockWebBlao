CREATE DATABASE tshockWebBlao;

CREATE TABLE tshockWebBlao.user(
    id INT(30) PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(30),
    PASSWORD VARCHAR(40),
    other VARCHAR(50)
);

CREATE TABLE tshockWebBlao.server(
    
    id INT(30) PRIMARY KEY AUTO_INCREMENT,
    servername VARCHAR(50),
    serverurl VARCHAR(50),
    serverport INT(10)
);

CREATE TABLE  tshockWebBlao.server_user(
    
    id INT(30)PRIMARY KEY AUTO_INCREMENT,
    serverid INT(30),
    userid INT(30),
    token VARCHAR(50),
    FOREIGN KEY(serverid) REFERENCES SERVER(id),
    FOREIGN KEY(userid) REFERENCES USER(id)
);


SELECT * FROM USER;