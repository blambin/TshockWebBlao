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

