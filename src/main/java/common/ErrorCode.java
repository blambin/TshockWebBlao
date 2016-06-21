package common;

public class ErrorCode {

	/***
	 * 服务器路径或端口错误
	 */
	public final static int URLError = 1001; //服务器路径或端口错误
	
	/***
	 * 服务器地址无法到达
	 */
	public final static int ServerUnreach = 1002; //服务器地址无法到达
	
	/***
	 * 获取令牌错误
	 */
	public final static int TokenUnvalid = 1003; //获取令牌错误
	
	/***
	 * 发送了不正确的请求
	 */
	public final static int ErrorAPI = 1004; //发送了不正确的请求
	
	/***
	 * 未知错误
	 */
	public final static int UnKnownError = 1005; //未知错误
	
	/***
	 * 请求成功
	 * 这个不是错误 !--
	 */
	public final static int ServerOK = 200; //请求成功
}
