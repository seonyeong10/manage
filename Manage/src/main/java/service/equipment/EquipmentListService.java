package service.equipment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import repository.equipment.EquipmentRepository;

@Service
public class EquipmentListService {
	@Autowired
	EquipmentRepository repository;

	public void selectEquipments(Map<String, Object> param, Model model) {
		
		List<Map<String, Object>> equipmentList = repository.selectEquipments(param);
		
		model.addAttribute("list", equipmentList);
		
	}

}
