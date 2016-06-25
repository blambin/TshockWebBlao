package common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

public class SendHttpGet {

	/***
	 * 作者：郭无心 链接：https://www.zhihu.com/question/30626103/answer/83157368 来源：知乎
	 * 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
	 * 
	 */
	private static URL realUrl;
	
	static HttpURLConnection connection ;

	static String sendGet(String url) {
		// 定义一个字符串用来存储网页内容
		String result = "";
		// 定义一个缓冲字符输入流
		BufferedReader in = null;
		try {
			// 将string转成url对象
			realUrl = new URL(url);
			
			// 初始化一个链接到那个url的连接
			connection = (HttpURLConnection) realUrl.openConnection();
			connection.addRequestProperty("User-Agent","Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0");
			// 开始实际的连接
			connection.connect();
			
			// 初始化 BufferedReader输入流来读取URL的响应
			in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			
			// 用来临时存储抓取到的每一行的数据
			String line;
			while ((line = in.readLine()) != null) {
				// 遍历抓取到的每一行并将其存储到result里面
				result += line;
			}
		} catch (Exception e) {
			System.out.println("发送GET请求出现异常！" + e);
			e.printStackTrace();
			return null;
		}
		// 使用finally来关闭输入流
		finally {
			try {
				if (in != null) {
					in.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}
}
