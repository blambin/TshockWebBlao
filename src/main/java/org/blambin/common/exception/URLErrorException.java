package org.blambin.common.exception;

public class URLErrorException extends Exception {

	/**
	 * 地址或端口错误
	 */
	private static final long serialVersionUID = 2008797131758902577L;

	

    private Exception ex;

	public URLErrorException() {
		super();
	}

	public URLErrorException(String ex) {
		super(ex);
	}

	public URLErrorException(Exception ex) {
		super(ex);
		this.ex = ex;
	}

	public Exception getException() {
		return ex;
	}
}
