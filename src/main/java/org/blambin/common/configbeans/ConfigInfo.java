package org.blambin.common.configbeans;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import lombok.Getter;

@Getter
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

	
}
