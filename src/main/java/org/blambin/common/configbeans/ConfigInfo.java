package org.blambin.common.configbeans;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;


@Component("ConfigInfo")
public class ConfigInfo {

	/***
	 * 设置RC加密密码
	 */
	@Value("${rc4pwd}")
	private String rc4Pwd;
	
	/***
	 * 设置cookies的Token密码
	 */
	@Value("${webTokenSalt}")
	private String webTokenSalt;

	public String getRc4Pwd() {
		return rc4Pwd;
	}

	public void setRc4Pwd(String rc4Pwd) {
		this.rc4Pwd = rc4Pwd;
	}

	public String getWebTokenSalt() {
		return webTokenSalt;
	}

	public void setWebTokenSalt(String webTokenSalt) {
		this.webTokenSalt = webTokenSalt;
	}

	
}
