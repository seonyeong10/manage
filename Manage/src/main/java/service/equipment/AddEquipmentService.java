package service.equipment;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import command.EquipmentCommand;
import repository.equipment.EquipmentRepository;

@Service
public class AddEquipmentService {
	@Autowired
	EquipmentRepository repository;

	public void insertEquipment(EquipmentCommand com, Model model) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		int result = 0;
		
		if(com.getGubun().equals("100")) {
			// PC
			System.out.println("PC");
		} else if(com.getGubun().equals("300")) {
			// 모니터
			System.out.println("모니터");
		} if(com.getGubun().equals("400")) {
			// 핸드폰
			param.put("code", com.getCode());
			param.put("p_name", com.getName());
			param.put("m_code", com.getM_code());
			param.put("p_ap", com.getP_ap());
			param.put("p_os", com.getP_os());
			param.put("p_cpu", com.getP_cpu());
			param.put("p_ram", com.getP_ram());
			param.put("p_capacity", com.getP_capacity());
			param.put("p_battery", com.getP_battery());
			
			
			result = repository.insertPhone(param);
			
		}
		
		System.out.println("map : "+param.entrySet());
		System.out.println(result);
	}

}
