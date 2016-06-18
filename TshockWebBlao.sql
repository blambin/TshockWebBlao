CREATE DATABASE IF NOT EXISTS tshockWebBlao;

CREATE TABLE tshockWebBlao.user(
    id INT(30) PRIMARY KEY AUTO_INCREMENT,
    displayname VARCHAR(50),
    username VARCHAR(30) UNIQUE,
    PASSWORD VARCHAR(40)
);

CREATE TABLE tshockWebBlao.server(
    
    id INT(30) PRIMARY KEY AUTO_INCREMENT,
    servername VARCHAR(50),
    serverurl VARCHAR(50),
    serverport INT(10),
    serverrestapiport INT(10),
    serverpassword VARCHAR(50),
    serveradminusername VARCHAR(50),
    serveradminpassword VARCHAR(50),
    serverowner INT(30),
    FOREIGN KEY(serverowner) REFERENCES USER(id)
);


SELECT * FROM tshockWebBlao.USER;
SELECT * FROM tshockwebblao.server;

INSERT INTO tshockWebBlao.USER(displayname,username,PASSWORD) VALUES('blambin','blambin','123456');
INSERT INTO tshockWebBlao.USER(displayname,username,PASSWORD) VALUES('mimi','mimi','123456');


SELECT server.id ,server.serveradminpassword,server.serveradminusername,server.servername,server.serverpassword,server.serverport,server.serverrestapiport,server.serverurl, user.id AS userid,username,displayname,PASSWORD FROM SERVER LEFT JOIN USER  ON server.serverowner = user.id WHERE server.id = 4;
UPDATE SERVER SET servername = #{serverName}, serverurl =#{serverUrl},serverport = #{serverPort},serverrestapiport = #{serverRestAPIPort},serverpassword = #{serverPassword},serveradminusername = #{serverAdminUserName},serveradminpassword = #{serverAdminPassword},serverowner = #{serverOwner.id} where id = #{id}