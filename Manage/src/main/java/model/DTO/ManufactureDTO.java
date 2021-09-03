package model.DTO;

public class ManufactureDTO {
	Integer ma_code;
	String ma_name;
	Integer ma_kinds;

	public Integer getMa_code() {
		return ma_code;
	}

	public void setMa_code(Integer ma_code) {
		this.ma_code = ma_code;
	}

	public String getMa_name() {
		return ma_name;
	}

	public void setMa_name(String ma_name) {
		this.ma_name = ma_name;
	}

	public Integer getMa_kinds() {
		return ma_kinds;
	}

	public void setMa_kinds(Integer ma_kinds) {
		this.ma_kinds = ma_kinds;
	}

	public ManufactureDTO(Integer ma_code, String ma_name, Integer ma_kinds) {
		this.ma_code = ma_code;
		this.ma_name = ma_name;
		this.ma_kinds = ma_kinds;
	}

	public ManufactureDTO() {
	}

}
