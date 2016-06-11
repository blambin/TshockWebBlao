CREATE DATABASE tshockWebBlao;

CREATE TABLE tshockWebBlao.user(
    id INT(30) PRIMARY KEY AUTO_INCREMENT,
    displayName VARCHAR(50),
    username VARCHAR(30),
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