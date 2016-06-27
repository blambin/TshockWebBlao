package org.blambin.common.exception;

public class TokenUnvalidException extends Exception {

	/**
	 * 令牌不可用
	 */
	private static final long serialVersionUID = -3402761414444886761L;
	

    private Exception ex;

	public TokenUnvalidException() {
		super();
	}

	public TokenUnvalidException(String ex) {
		super(ex);
	}

	public TokenUnvalidException(Exception ex) {
		super(ex);
		this.ex = ex;
	}

	public Exception getException() {
		return ex;
	}

}
