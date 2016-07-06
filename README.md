# TshockWebBlao
 tshock web manager
 
 tshock  terraria server web manager .
 
 have a demo here : 
 
 http://tr.blambin.org:8080/TshockWebBlao
 
 http://home.5dsy.info:233/TshockWebBlao
 
 tshock 泰拉游戏服务器的网页控制台 - tshockwebblao .
 
###### 目前版本功能: 

*  纯粹的命令行,支持中文命令输入
*  服务器的基本信息
*  查看在线玩家的背包  图形方式显示
*  日志查询
*  管理用户
*  关于页面
  
todoList:

*  聊天
*  管理组
*  中文的服务器列表
*  被ban玩家管理

###### 预览/在线命令行
  
  ![Alt text](markdown/command2.png)
  ![Alt text](markdown/command.png)
   
###### 简单搭建教程

*  前提依赖: 安装 

>> java jre 或者  java jdk,tomcat

*  确保依赖安装正常,使用 eclipse 等 ide 打包 war 格式 档.
*  导入项目根目录下的 TshockWebBlao.sql 到数据库里.
*  在 resources/application-dao.xml 里配置数据库服务器的地址,用户和密码信息
*  在 resources/configinfo.properties 里配置用户密码的加密秘钥 
*  就可以启动服务器了. done.


<p>本程式发布在 通用性公开许可证(General Public License，简称GPL)下.你可以有运行、复制软件的自由，发行传播软件的自由，获得软件源码的自由，改进软件并将自己作出的改进版本向社会发行传播的自由。 </p>
<p>Copyleft <img alt="版责" src="src\main\webapp\images/copyleft.png" height="20px" width="20px"> <a class="active" href="http://blambin.org">作者 :blambin</a> &nbsp;&nbsp; <a class="active" href="https://www.tshockcn.com/">提供文本
					:欲情</a></p>