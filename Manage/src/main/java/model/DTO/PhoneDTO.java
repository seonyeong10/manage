package model.DTO;

public class PhoneDTO {
	Integer code; // 코드
	Integer m_code; // 제조사
	String p_name; // 제품명
	String p_ap; // ap칩
	String p_os; // os
	String p_cpu; // cpu
	Integer p_ram; // ram
	Integer p_capacity; // 저장공간
	Integer p_battery; // 배터리

	public PhoneDTO() {
	}

	public PhoneDTO(Integer code, Integer m_code, String p_name, String p_ap, String p_os, String p_cpu, Integer p_ram,
			Integer p_capacity, Integer p_battery) {
		this.code = code;
		this.m_code = m_code;
		this.p_name = p_name;
		this.p_ap = p_ap;
		this.p_os = p_os;
		this.p_cpu = p_cpu;
		this.p_ram = p_ram;
		this.p_capacity = p_capacity;
		this.p_battery = p_battery;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public Integer getM_code() {
		return m_code;
	}

	public void setM_code(Integer m_code) {
		this.m_code = m_code;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_ap() {
		return p_ap;
	}

	public void setP_ap(String p_ap) {
		this.p_ap = p_ap;
	}

	public String getP_os() {
		return p_os;
	}

	public void setP_os(String p_os) {
		this.p_os = p_os;
	}

	public String getP_cpu() {
		return p_cpu;
	}

	public void setP_cpu(String p_cpu) {
		this.p_cpu = p_cpu;
	}

	public Integer getP_ram() {
		return p_ram;
	}

	public void setP_ram(Integer p_ram) {
		this.p_ram = p_ram;
	}

	public Integer getP_capacity() {
		return p_capacity;
	}

	public void setP_capacity(Integer p_capacity) {
		this.p_capacity = p_capacity;
	}

	public Integer getP_battery() {
		return p_battery;
	}

	public void setP_battery(Integer p_battery) {
		this.p_battery = p_battery;
	}

}
