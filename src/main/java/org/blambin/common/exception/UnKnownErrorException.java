package org.blambin.common.exception;

public class UnKnownErrorException extends Exception {

	/**
	 * 未知错误
	 */
	private static final long serialVersionUID = -8991857737108129493L;


    private Exception ex;

	public UnKnownErrorException() {
		super();
	}

	public UnKnownErrorException(String ex) {
		super(ex);
	}

	public UnKnownErrorException(Exception ex) {
		super(ex);
		this.ex = ex;
	}

	public Exception getException() {
		return ex;
	}
}
