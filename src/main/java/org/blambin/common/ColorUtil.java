package org.blambin.common;

import java.awt.Color;

public class ColorUtil {

	/***
	 * 十六进制颜色值转三位数字
	 * @author blambin
	 * @since 2016年7月8日
	 * @category TODO:
	 * @throws 
	 * @param HexString
	 * @return
	 * String
	 */
	public static String HexToNumber(String HexString){
		
		StringBuffer sb = new StringBuffer();
		Color c = Color.decode(HexString);
		
		sb.append(c.getRed());
		sb.append(",");
		sb.append(c.getGreen());
		sb.append(",");
		sb.append(c.getBlue());
		
		return sb.toString();
		
	}
	
	/***
	 * 三位数字转十六进制颜色值
	 * @author blambin
	 * @since 2016年7月8日
	 * @category 
	 * @throws 
	 * @param Number
	 * @return
	 * String
	 */
	public static String NumberToHex(int red,int green,int blue){
		
		StringBuffer sb = new StringBuffer();
		
		String R,G,B;
		R = Integer.toHexString(red);
		G = Integer.toHexString(green);
		B = Integer.toHexString(blue);
		
		R = R.length() == 1 ? "0" + R : R;
		G = G.length() == 1 ? "0" + G : G;
		B = B.length() == 1 ? "0" + B : B;
		
		sb.append("#");
		sb.append(R);
		sb.append(G);
		sb.append(B);
		
		return sb.toString();
		
	}
	
	public static void main(String[] args) {
		String HexString = "#bb28b0";
		String c = ColorUtil.HexToNumber(HexString);
		
		
		int r = 41,g = 1,b = 43;
		
		String color = ColorUtil
				.NumberToHex(r, g, b);
		System.out.println(c);
		System.out.println(color);
	}
}
