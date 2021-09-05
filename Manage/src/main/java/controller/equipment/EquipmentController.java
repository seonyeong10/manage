package controller.equipment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.EquipmentCommand;
import repository.equipment.EquipmentRepository;
import service.equipment.AddEquipmentService;
import service.equipment.EquipmentInfoService;
import service.equipment.EquipmentListService;

@Controller
@RequestMapping("equipment")
public class EquipmentController {
	@Autowired
	AddEquipmentService addEquipmentService;
	@Autowired
	EquipmentListService equipmentListService;
	@Autowired
	EquipmentInfoService equipmentInfoService;
	
	@Autowired
	EquipmentRepository repository;
	
	/**
	 * 장비리스트 페이지 오픈
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String openEquipmentList(
			@RequestParam(value = "gubun", required = false, defaultValue = "") String gubun,
			@RequestParam(value = "schThem", required = false, defaultValue = "") String schThem,
			@RequestParam(value = "schVal", required = false, defaultValue = "") String schVal,
			Model model
		) {
//		System.out.printf("검색구분: %s, 검색어: %s%n", schThem, schVal);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("gubun", gubun);
		param.put(schThem, schVal);
		
		equipmentListService.selectEquipments(param, model);
		return "equipment/equipmentList";
	}
	
	/**
	 * 장비 등록 페이지 오픈
	 */
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String openEquipmentForm(Model model) {
		return "equipment/equipmentForm";
	}
	
	/**
	 * 장비 등록
	 * @param command
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "insertEquipment", method = RequestMethod.POST)
	public String insertEquipment(
			EquipmentCommand command,
			Model model
			) {
		addEquipmentService.insertEquipment(command, model);
		return "redirect:/equipment";
	}
	
	/**
	 * 장비 상세정보
	 */
	@RequestMapping(value = "getEquipmentInfo")
	public String getEquipmentInfo(
			@RequestParam(value = "code") String code,
			@RequestParam(value = "m_code") String m_code,
			Model model
			) {
		equipmentInfoService.getInfo(code, m_code, model);
		return "equipment/equipmentInfo";
	}
	
	@RequestMapping(value = "updatePhone", method = RequestMethod.POST)
	public String updatePhone(
			@RequestParam(value = "code", defaultValue = "") String code,
			@RequestParam(value = "m_code", defaultValue = "") String m_code,
			@RequestParam(value = "p_name", defaultValue = "") String p_name,
			@RequestParam(value = "p_ap", defaultValue = "") String p_ap,
			@RequestParam(value = "p_os", defaultValue = "") String p_os,
			@RequestParam(value = "p_cpu", defaultValue = "") String p_cpu,
			@RequestParam(value = "p_ram", defaultValue = "") String p_ram,
			@RequestParam(value = "p_capacity", defaultValue = "") String p_capacity,
			@RequestParam(value = "p_battery", defaultValue = "") String p_battery,
			Model model
			) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("p_name", p_name);
		param.put("p_ap", p_ap);
		param.put("p_os", p_os);
		param.put("p_cpu", p_cpu);
		param.put("p_ram", p_ram);
		param.put("p_capacity", p_capacity);
		param.put("p_battery", p_battery);
		param.put("code", code);
		
		repository.updatePhone(param);
		
		return "redirect:/equipment/getEquipmentInfo?code="+ code + "&m_code=" + m_code;
	}
	
	@RequestMapping(value = "updatePC", method = RequestMethod.POST)
	public String updatePC(
			@RequestParam(value = "code", defaultValue = "") String code,
			@RequestParam(value = "m_code", defaultValue = "") String m_code,
			@RequestParam(value = "pc_name", defaultValue = "") String p_name,
			@RequestParam(value = "pc_gpu", defaultValue = "") String p_gpu,
			@RequestParam(value = "pc_os", defaultValue = "") String p_os,
			@RequestParam(value = "pc_cpu", defaultValue = "") String p_cpu,
			@RequestParam(value = "pc_ram", defaultValue = "") String p_ram,
			@RequestParam(value = "pc_capacity", defaultValue = "") String p_capacity,
			Model model
			) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("pc_name", p_name);
		param.put("pc_gpu", p_gpu);
		param.put("pc_os", p_os);
		param.put("pc_cpu", p_cpu);
		param.put("pc_ram", p_ram);
		param.put("pc_capacity", p_capacity);
		param.put("code", code);
		
		repository.updatePC(param);
		
		return "redirect:/equipment/getEquipmentInfo?code="+ code + "&m_code=" + m_code;
	}
	
	@RequestMapping(value = "updateMonitor", method = RequestMethod.POST)
	public String updateMonitor(
			@RequestParam(value = "code", defaultValue = "") String code,
			@RequestParam(value = "m_code", defaultValue = "") String m_code,
			@RequestParam(value = "mo_name", defaultValue = "") String mo_name,
			@RequestParam(value = "mo_pannel", defaultValue = "") String mo_pannel,
			@RequestParam(value = "mo_hz", defaultValue = "") String mo_hz,
			@RequestParam(value = "mo_resolution", defaultValue = "") String mo_resolution,
			@RequestParam(value = "mo_speed", defaultValue = "") String mo_speed,
			@RequestParam(value = "mo_shape", defaultValue = "") String mo_shape,
			Model model
			) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("mo_name", mo_name);
		param.put("mo_pannel", mo_pannel);
		param.put("mo_hz", mo_hz);
		param.put("mo_resolution", mo_resolution);
		param.put("mo_speed", mo_speed);
		param.put("mo_shape", mo_shape);
		param.put("code", code);
		
		repository.updateMonitor(param);
		
		return "redirect:/equipment/getEquipmentInfo?code="+ code + "&m_code=" + m_code;
	}
	
	/**
	 * 장비 성능정보 삭제
	 * @return
	 */
	@RequestMapping(value = "delEquipment", method = RequestMethod.POST)
	public String delEquipment(
			@RequestParam(value = "code") String code,
			@RequestParam(value = "m_code") String m_code,
			@RequestParam(value = "gubun", defaultValue = "") String gubun,
			Model model
			) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("code", code);
		param.put("m_code", m_code);
		
		if(gubun.equals("모니터")) repository.delMonitor(param);
		else if(gubun.equals("pc")) repository.delPC(param);
		else if(gubun.equals("핸드폰")) repository.delPhone(param);

		return "redirect:/equipment";
	}
	
	/**
	 * 장비 성능 비교
	 */
	@RequestMapping(value = "compare", method = RequestMethod.GET)
	public String compareEquipment(
			@RequestParam(value = "gubun", defaultValue = "") String gubun,
			@RequestParam(value = "code1", defaultValue = "") String code1,
			@RequestParam(value = "code2", defaultValue = "") String code2,
			
			@RequestParam(value = "p_ap1", defaultValue = "") String p_ap1,
			@RequestParam(value = "p_ap2", defaultValue = "") String p_ap2,
			@RequestParam(value = "p_os1", defaultValue = "") String p_os1,
			@RequestParam(value = "p_os2", defaultValue = "") String p_os2,
			@RequestParam(value = "p_cpu1", defaultValue = "") String p_cpu1,
			@RequestParam(value = "p_cpu2", defaultValue = "") String p_cpu2,
			@RequestParam(value = "p_ram1", defaultValue = "") String p_ram1,
			@RequestParam(value = "p_ram2", defaultValue = "") String p_ram2,
			@RequestParam(value = "p_capacity1", defaultValue = "") String p_capacity1,
			@RequestParam(value = "p_capacity2", defaultValue = "") String p_capacity2,
			@RequestParam(value = "p_battery1", defaultValue = "") String p_battery1,
			@RequestParam(value = "p_battery2", defaultValue = "") String p_battery2,
			
			@RequestParam(value = "pc_division1", defaultValue = "") String pc_division1,
			@RequestParam(value = "pc_division2", defaultValue = "") String pc_division2,
			@RequestParam(value = "pc_os1", defaultValue = "") String pc_os1,
			@RequestParam(value = "pc_os2", defaultValue = "") String pc_os2,
			@RequestParam(value = "pc_cpu1", defaultValue = "") String pc_cpu1,
			@RequestParam(value = "pc_cpu2", defaultValue = "") String pc_cpu2,
			@RequestParam(value = "pc_ram1", defaultValue = "") String pc_ram1,
			@RequestParam(value = "pc_ram2", defaultValue = "") String pc_ram2,
			@RequestParam(value = "pc_gpu1", defaultValue = "") String pc_gpu1,
			@RequestParam(value = "pc_gpu2", defaultValue = "") String pc_gpu2,
			@RequestParam(value = "pc_capacity1", defaultValue = "") String pc_capacity1,
			@RequestParam(value = "pc_capacity2", defaultValue = "") String pc_capacity2,
			
			@RequestParam(value = "mo_pannel1", defaultValue = "") String mo_pannel1,
			@RequestParam(value = "mo_pannel2", defaultValue = "") String mo_pannel2,
			@RequestParam(value = "mo_Hz1", defaultValue = "") String mo_Hz1,
			@RequestParam(value = "mo_Hz2", defaultValue = "") String mo_Hz2,
			@RequestParam(value = "mo_resolution1", defaultValue = "") String mo_resolution1,
			@RequestParam(value = "mo_resolution2", defaultValue = "") String mo_resolution2,
			@RequestParam(value = "mo_speed1", defaultValue = "") String mo_speed1,
			@RequestParam(value = "mo_speed2", defaultValue = "") String mo_speed2,
			@RequestParam(value = "mo_shape1", defaultValue = "") String mo_shape1,
			@RequestParam(value = "mo_shape2", defaultValue = "") String mo_shape2,
			
			Model model
			) {
		Map<String, Object> param = new HashMap<String, Object>();
		// 사원 목록
		List<Map<String, Object>> empList = repository.selectEmps(param);
		model.addAttribute("emp", empList);
		
		for (int i = 0; i <empList.size(); i++) {
			System.out.println(empList.get(i).entrySet());
		}
		return "equipment/compareEquipment";
	}
}
