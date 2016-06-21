package common.exception;

public class ErrorAPIException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8991857737108129493L;

	private Exception ex ; //"不正确的调用!";

	public ErrorAPIException() {
		super();
	}

	public ErrorAPIException(String ex) {
		super(ex);
	}

	public ErrorAPIException(Exception ex) {
		super(ex);
		this.ex = ex;
		// TODO Auto-generated constructor stub
	}
	
	public Exception getException(){
		return ex;
	}
	
	
}
