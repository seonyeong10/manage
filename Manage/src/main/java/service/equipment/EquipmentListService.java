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

	public void selectEquipments(Model model) {
		Map<String, Object> param = new HashMap<String, Object>();
		
		List<Map<String, Object>> equipmentList = repository.selectEquipments(param);
		
		for (int i = 0; i < equipmentList.size(); i++) {
			
			System.out.println(equipmentList.get(i).entrySet());
		}
	}

}
