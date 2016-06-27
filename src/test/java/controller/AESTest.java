package controller;

import org.blambin.common.AESUtil;

public class AESTest {


	
	public static void main(String[] args) {
		
	
		
		
		String content = "test1test2";  
    	String password = "12345678";  
    	//加密  
    	System.out.println("加密前：" + content);  
    	byte[] encryptResult = AESUtil.encrypt(content, password);  
    	String resa = AESUtil.parseByte2HexStr(encryptResult);
    	
    	System.out.println( "加密了的字串: "+resa); //
    	
    	byte[] reby = AESUtil.parseHexStr2Byte(resa);
    	
    	//解密  
    	byte[] decryptResult = AESUtil.decrypt(reby,password);  
    	System.out.println("解密后：" + new String(decryptResult)); 
	}
	
	
}
