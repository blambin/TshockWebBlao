package org.blambin.common;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component("ConfigInfo")
public class ConfigInfo {

	@Value("${rc4pwd}")
	private String rc4Pwd;

	public String getRc4Pwd() {
		return rc4Pwd;
	}

	
	
}
