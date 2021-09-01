package model;

public class AuthInfo {
	private String userId;
	private String email;
	private String name;

	public AuthInfo(String userId, String email, String name) {
		super();
		this.userId = userId;
		this.email = email;
		this.name = name;
	}

	public String getUserId() {
		return userId;
	}

	public String getEmail() {
		return email;
	}

	public String getName() {
		return name;
	}
}
