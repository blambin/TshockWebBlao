package org.blambin.common;

import javax.servlet.http.HttpSession;

import org.blambin.common.configbeans.ConfigInfo;
import org.blambin.entity.Server;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("ServerCommon")
public class ServerCommon {
	
	
	@Autowired
	private ConfigInfo configInfo;
	
	/***
	 *  把 Server放在HttpSession的currentServer里,密码明文方式 
	 * @author blambin
	 * @since 2016年6月27日
	 * @category TODO:
	 * @throws 
	 * @param server 
	 * @param session
	 * void
	 */
	public void SetServerInSession(Server server,HttpSession session){
		
		String encrPass = server.getServerAdminPassword();
		byte[] deencrByteContent = AESUtil.parseHexStr2Byte(encrPass);
		byte[] rawPassword = AESUtil.decrypt(deencrByteContent, configInfo.getRc4Pwd());
		
		server.setServerAdminPassword(new String(rawPassword));
		session.setAttribute("currentServer", server);
	}

}
