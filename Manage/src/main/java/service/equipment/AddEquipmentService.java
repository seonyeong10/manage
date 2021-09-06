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
		
		param.put("code", com.getCode());
		
		if(com.getGubun().equals("100")) {
			// PC
			param.put("pc_name", com.getName());
			param.put("m_code", com.getM_code());
			param.put("pc_division", com.getPc_division());
			param.put("pc_os", com.getPc_os());
			param.put("pc_cpu", com.getPc_cpu());
			param.put("pc_ram", com.getPc_ram());
			param.put("pc_gpu", com.getPc_gpu());
			param.put("pc_capacity", com.getPc_capacity());
			
			result = repository.insertPC(param);
			
		} else if(com.getGubun().equals("300")) {
			// 모니터
			param.put("mo_name", com.getName());
			param.put("m_code", com.getM_code());
			param.put("mo_pannel", com.getMo_pannel());
			param.put("mo_Hz", com.getMo_Hz());
			param.put("mo_resolution", com.getMo_resolution());
			param.put("mo_speed", com.getMo_speed());
			param.put("mo_shape", com.getMo_shape());
			
			result = repository.insertMonitor(param);
			
		} if(com.getGubun().equals("400")) {
			// 핸드폰
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
