package service.manufacture;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.DTO.ManufactureDTO;
import repository.manufacture.ManufactureRepository;

@Service
public class AddManufactureService {
	@Autowired
	ManufactureRepository repository;

	/**
	 * 제조사 등록
	 * @param ma_code
	 * @param ma_name
	 * @param ma_kinds
	 * @param model
	 */
	public void insertManufacture(Integer ma_code, String ma_name, Integer ma_kinds, Model model) {
		ManufactureDTO dto = new ManufactureDTO(ma_code, ma_name, ma_kinds);
		int result = 0;
		
		result = repository.insertManufacture(dto);
	}
}
