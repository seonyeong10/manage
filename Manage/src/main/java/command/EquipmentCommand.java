package command;

public class EquipmentCommand {
	String gubun;	// 장비 구분
	
	Integer code; // 사번
	Integer m_code; // 제조사
	String name; // 제품명

	// PC
	Integer pc_division; // ??
	String pc_os; // os
	String pc_cpu; // cpu
	Integer pc_ram; // ram
	String pc_gpu; // gpu
	Integer pc_capacity; // 저장공간

	// Phone
	String p_ap; // ap칩
	String p_os; // os
	String p_cpu; // cpu
	Integer p_ram; // ram
	Integer p_capacity; // 저장공간
	Integer p_battery; // 배터리

	// Monitor
	String mo_pannel; // 패널
	Integer mo_Hz; // 화면 주사율
	String mo_resolution; // 해상도
	Integer mo_speed; // 응답속도
	Integer mo_shape; // 형태
	
	public EquipmentCommand() {
	}

	// 모니터
	public EquipmentCommand(Integer code, Integer m_code, String name, String mo_pannel, Integer mo_Hz,
			String mo_resolution, Integer mo_speed, Integer mo_shape) {
		this.code = code;
		this.m_code = m_code;
		this.name = name;
		this.mo_pannel = mo_pannel;
		this.mo_Hz = mo_Hz;
		this.mo_resolution = mo_resolution;
		this.mo_speed = mo_speed;
		this.mo_shape = mo_shape;
	}

	// 핸드폰
	public EquipmentCommand(Integer code, Integer m_code, String name, String p_ap, String p_os, String p_cpu,
			Integer p_ram, Integer p_capacity, Integer p_battery) {
		this.code = code;
		this.m_code = m_code;
		this.name = name;
		this.p_ap = p_ap;
		this.p_os = p_os;
		this.p_cpu = p_cpu;
		this.p_ram = p_ram;
		this.p_capacity = p_capacity;
		this.p_battery = p_battery;
	}

	// PC생성자
	public EquipmentCommand(Integer code, Integer m_code, String name, Integer pc_division, String pc_os, String pc_cpu,
			Integer pc_ram, String pc_gpu, Integer pc_capacity) {
		this.code = code;
		this.m_code = m_code;
		this.name = name;
		this.pc_division = pc_division;
		this.pc_os = pc_os;
		this.pc_cpu = pc_cpu;
		this.pc_ram = pc_ram;
		this.pc_gpu = pc_gpu;
		this.pc_capacity = pc_capacity;
	}

	public String getGubun() {
		return gubun;
	}

	public void setGubun(String gubun) {
		this.gubun = gubun;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPc_division() {
		return pc_division;
	}

	public void setPc_division(Integer pc_division) {
		this.pc_division = pc_division;
	}

	public String getPc_os() {
		return pc_os;
	}

	public void setPc_os(String pc_os) {
		this.pc_os = pc_os;
	}

	public String getPc_cpu() {
		return pc_cpu;
	}

	public void setPc_cpu(String pc_cpu) {
		this.pc_cpu = pc_cpu;
	}

	public Integer getPc_ram() {
		return pc_ram;
	}

	public void setPc_ram(Integer pc_ram) {
		this.pc_ram = pc_ram;
	}

	public String getPc_gpu() {
		return pc_gpu;
	}

	public void setPc_gpu(String pc_gpu) {
		this.pc_gpu = pc_gpu;
	}

	public Integer getPc_capacity() {
		return pc_capacity;
	}

	public void setPc_capacity(Integer pc_capacity) {
		this.pc_capacity = pc_capacity;
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

	public String getMo_pannel() {
		return mo_pannel;
	}

	public void setMo_pannel(String mo_pannel) {
		this.mo_pannel = mo_pannel;
	}

	public Integer getMo_Hz() {
		return mo_Hz;
	}

	public void setMo_Hz(Integer mo_Hz) {
		this.mo_Hz = mo_Hz;
	}

	public String getMo_resolution() {
		return mo_resolution;
	}

	public void setMo_resolution(String mo_resolution) {
		this.mo_resolution = mo_resolution;
	}

	public Integer getMo_speed() {
		return mo_speed;
	}

	public void setMo_speed(Integer mo_speed) {
		this.mo_speed = mo_speed;
	}

	public Integer getMo_shape() {
		return mo_shape;
	}

	public void setMo_shape(Integer mo_shape) {
		this.mo_shape = mo_shape;
	}

}
