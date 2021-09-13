package model.DTO;

public class MemberDTO {
	Integer code;
	String m_name;
	String m_depart;
	String m_job;
	String m_age;
	String m_phone;
	String m_email;
	String m_address;
	String m_gender;

	public String getM_gender() {
		return m_gender;
	}

	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_depart() {
		return m_depart;
	}

	public void setM_depart(String m_depart) {
		this.m_depart = m_depart;
	}

	public String getM_job() {
		return m_job;
	}

	public void setM_job(String m_job) {
		this.m_job = m_job;
	}

	public String getM_age() {
		return m_age;
	}

	public void setM_age(String m_age) {
		this.m_age = m_age;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_address() {
		return m_address;
	}

	public void setM_address(String m_address) {
		this.m_address = m_address;
	}
	

	public MemberDTO(Integer code, String m_name, String m_depart, String m_job, String m_age, String m_phone,
			String m_email, String m_address, String m_gender) {
		super();
		this.code = code;
		this.m_name = m_name;
		this.m_depart = m_depart;
		this.m_job = m_job;
		this.m_age = m_age;
		this.m_phone = m_phone;
		this.m_email = m_email;
		this.m_address = m_address;
		this.m_gender = m_gender;
	}

	public MemberDTO() {
		super();
	}

}
