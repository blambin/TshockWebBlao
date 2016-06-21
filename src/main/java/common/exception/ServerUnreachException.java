package common.exception;

public class ServerUnreachException extends Exception {

	/**
	 * 服务器远程地址不可达
	 */
	private static final long serialVersionUID = -155146906727066018L;

    
	
    private Exception ex;

	public ServerUnreachException() {
		super();
	}

	public ServerUnreachException(String ex) {
		super(ex);
	}

	public ServerUnreachException(Exception ex) {
		super(ex);
		this.ex = ex;
	}

	public Exception getException() {
		return ex;
	}
}
