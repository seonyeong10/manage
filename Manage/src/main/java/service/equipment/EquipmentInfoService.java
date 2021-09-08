package service.equipment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import repository.equipment.EquipmentRepository;

@Service
public class EquipmentInfoService {
	@Autowired
	EquipmentRepository repository;

	public void getInfo(String code, String id, Model model) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("code", code);
		param.put("id", id);
		
		List<Map<String, Object>> equip = repository.getInfo(param);
		System.out.println(param.entrySet());
		System.out.println(equip.size());
		
		System.out.println(param.entrySet());
		model.addAttribute("item", equip.get(0));
	}

}
