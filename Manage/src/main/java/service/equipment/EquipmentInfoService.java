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

	public void getInfo(String code, String m_code, Model model) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("code", code);
		param.put("m_code", m_code);
		
		List<Map<String, Object>> equip = repository.getInfo(param);
		
		model.addAttribute("item", equip.get(0));
	}

}
