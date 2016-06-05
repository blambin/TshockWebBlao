package entity;

public class User {

	private String id;
	private String username;
	private String password;
	private String token;
	private String other;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	@Override
	public String toString() {
		return "user [id=" + id + ", username=" + username + ", password=" + password + ", token=" + token + ", other="
				+ other + "]";
	}

	public User(String id, String username, String password, String token, String other) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.token = token;
		this.other = other;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	
}
