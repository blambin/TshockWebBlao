package controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class md5test {

	public static void main(String[] args) throws NoSuchAlgorithmException {
		String a = "123456";
		//Provider[] pro = java.security.Security.getProviders();
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(a.getBytes());
		byte[] b = md.digest();
		String c = md5test.convertToHexString(b);
		//结果为c
	}
	
	/***
	 * 把byte转换成16进制字符串
	 * @param data
	 * @return
	 */
	public static String convertToHexString(byte data[]) {
		  StringBuffer strBuffer = new StringBuffer();
		  for (int i = 0; i < data.length; i++) {
		   strBuffer.append(Integer.toHexString(0xff & data[i]));
		  }
		  return strBuffer.toString();
		 }
	
}


