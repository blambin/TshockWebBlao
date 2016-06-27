package org.blambin.common;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 * @author IluckySi
 * @since 20150122
 */
public class ImageBase64Util {

	private static BASE64Encoder encoder = new sun.misc.BASE64Encoder();
	private static BASE64Decoder decoder = new sun.misc.BASE64Decoder();

	/**
	 * 将图片转换为BASE64加密字符串.
	 * 
	 * @param imagePath
	 *            图片路径.
	 * @param format
	 *            图片格式.
	 * @return
	 */
	public static String convertImageToByte(String imagePath, String format) {
		File file = new File(imagePath);
		BufferedImage bi = null;
		ByteArrayOutputStream baos = null;
		String result = null;
		try {
			bi = ImageIO.read(file);
			baos = new ByteArrayOutputStream();
			ImageIO.write(bi, format == null ? "jpg" : format, baos);
			byte[] bytes = baos.toByteArray();
			result = encoder.encodeBuffer(bytes).trim();
			System.out.println("将图片转换为BASE64加密字符串成功！");
		} catch (IOException e) {
			System.out.println("将图片转换为 BASE64加密字符串失败: " + e);
		} finally {
			try {
				if (baos != null) {
					baos.close();
					baos = null;
				}
			} catch (Exception e) {
				System.out.println("关闭文件流发生异常: " + e);
			}
		}
		return result;
	}

	/**
	 * 将图片流转换为BASE64加密字符串.
	 * 
	 * @param imageInputStream
	 * @param format
	 *            图片格式.
	 * @return
	 */
	public static String convertImageStreamToByte(InputStream imageInputStream, String format) {
		BufferedImage bi = null;
		ByteArrayOutputStream baos = null;
		String result = null;
		try {
			bi = ImageIO.read(imageInputStream);
			baos = new ByteArrayOutputStream();
			ImageIO.write(bi, format == null ? "jpg" : format, baos);
			byte[] bytes = baos.toByteArray();
			result = encoder.encodeBuffer(bytes).trim();
			System.out.println("将图片流转换为BASE64加密字符串成功！");
		} catch (IOException e) {
			System.out.println("将图片流转换为 BASE64加密字符串失败: " + e);
		} finally {
			try {
				if (baos != null) {
					baos.close();
					baos = null;
				}
			} catch (Exception e) {
				System.out.println("关闭文件流发生异常: " + e);
			}
		}
		return result;
	}

	/**
	 * 将BASE64加密字符串转换为图片.
	 * 
	 * @param base64String
	 * @param imagePath
	 *            图片生成路径.
	 * @param format
	 *            图片格式.
	 */
	public static void convertByteToImage(String base64String, String imagePath, String format) {
		byte[] bytes = null;
		ByteArrayInputStream bais = null;
		BufferedImage bi = null;
		File file = null;
		try {
			bytes = decoder.decodeBuffer(base64String);
			bais = new ByteArrayInputStream(bytes);
			bi = ImageIO.read(bais);
			file = new File(imagePath);
			ImageIO.write(bi, format == null ? "jpg" : format, file);
			System.out.println("将BASE64加密字符串转换为图片成功！");
		} catch (IOException e) {
			System.out.println("将BASE64加密字符串转换为图片失败: " + e);
		} finally {
			try {
				if (bais != null) {
					bais.close();
					bais = null;
				}
			} catch (Exception e) {
				System.out.println("关闭文件流发生异常: " + e);
			}
		}
	}
	
}


