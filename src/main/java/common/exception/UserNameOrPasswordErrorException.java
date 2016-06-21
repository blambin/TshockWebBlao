package common.exception;

public class UserNameOrPasswordErrorException extends Exception {

	/**
	 * 用户名或或密码错误
	 */
	private static final long serialVersionUID = 2036991361253346265L;


    private Exception ex;

	public UserNameOrPasswordErrorException() {
		super();
	}

	public UserNameOrPasswordErrorException(String ex) {
		super(ex);
	}

	public UserNameOrPasswordErrorException(Exception ex) {
		super(ex);
		this.ex = ex;
	}

	public Exception getException() {
		return ex;
	}
	
	
}
