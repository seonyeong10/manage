package model.DTO;

public class UserInfoDto {

	private String id;
	private String pw;
	private String code;
	private String auth;
	
	
	
	public UserInfoDto() {
		super();
	}
	
	public UserInfoDto(String id, String pw, String code, String auth) {
		super();
		this.id = id;
		this.pw = pw;
		this.code = code;
		this.auth = auth;
	}




	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	
	
	
	
	@Override
	public String toString() {
		return "UserInfoDto [id=" + id + ", pw=" + pw + ", code=" + code + ", auth=" + auth + "]";
	}
	
	
	
	
	
}
