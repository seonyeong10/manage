package controller.equipment;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Guard;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.bag.SynchronizedSortedBag;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	 * 
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String openEquipmentList(@RequestParam(value = "gubun", required = false) String gubun,
			@RequestParam(value = "schThem", required = false) String schThem,
			@RequestParam(value = "schVal", required = false, defaultValue = "") String schVal, 
			@RequestParam(value = "ability", required = false) String ability,
			@RequestParam(value = "aVal", required = false, defaultValue = "") String aVal, 
			Model model) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("gubun", gubun);
		
		if(schVal.equals("")) schVal = null;
		if(aVal.equals("")) aVal = null;
		param.put(schThem, schVal);
		param.put(ability, aVal);

		equipmentListService.selectEquipments(param, model);
		return "equipment/equipmentList";
	}
	
	/**
	 * 장비 등록 페이지 오픈
	 */
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String openEquipmentForm(
			HttpServletRequest request,
			HttpServletResponse response,
			Model model
			) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		
		// 사원
		List<Map<String, Object>> empList = repository.selectEmps(param);
		
		model.addAttribute("emp", empList);
		
		return "equipment/equipmentForm";
	}

	/**
	 * 장비 등록
	 * 
	 * @param command
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "insertEquipment", method = RequestMethod.POST)
	public String insertEquipment(EquipmentCommand command, Model model) {
		addEquipmentService.insertEquipment(command, model);
		return "redirect:/equipment";
	}

	/**
	 * 장비 상세정보
	 */
	@RequestMapping(value = "getEquipmentInfo")
	public String getEquipmentInfo(
			@RequestParam(value = "code") String code,
			@RequestParam(value = "id") String id, 
			Model model) {
		
		equipmentInfoService.getInfo(code, id, model);
		return "equipment/equipmentInfo";
	}

	@RequestMapping(value = "updatePhone", method = RequestMethod.POST)
	public String updatePhone(@RequestParam(value = "code", defaultValue = "") String code,
			@RequestParam(value = "id", defaultValue = "") String id,
			@RequestParam(value = "p_name", defaultValue = "") String p_name,
			@RequestParam(value = "p_ap", defaultValue = "") String p_ap,
			@RequestParam(value = "p_os", defaultValue = "") String p_os,
			@RequestParam(value = "p_cpu", defaultValue = "") String p_cpu,
			@RequestParam(value = "p_ram", defaultValue = "") String p_ram,
			@RequestParam(value = "p_capacity", defaultValue = "") String p_capacity,
			@RequestParam(value = "p_battery", defaultValue = "") String p_battery, Model model) {

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("p_name", p_name);
		param.put("p_ap", p_ap);
		param.put("p_os", p_os);
		param.put("p_cpu", p_cpu);
		param.put("p_ram", p_ram);
		param.put("p_capacity", p_capacity);
		param.put("p_battery", p_battery);
		param.put("code", code);
		param.put("id", id);

		repository.updatePhone(param);

		return "redirect:/equipment/getEquipmentInfo?code=" + code + "&id=" + id;
	}

	@RequestMapping(value = "updatePC", method = RequestMethod.POST)
	public String updatePC(@RequestParam(value = "code", defaultValue = "") String code,
			@RequestParam(value = "id", defaultValue = "") String id,
			@RequestParam(value = "pc_name", defaultValue = "") String p_name,
			@RequestParam(value = "pc_gpu", defaultValue = "") String p_gpu,
			@RequestParam(value = "pc_os", defaultValue = "") String p_os,
			@RequestParam(value = "pc_cpu", defaultValue = "") String p_cpu,
			@RequestParam(value = "pc_ram", defaultValue = "") String p_ram,
			@RequestParam(value = "pc_capacity", defaultValue = "") String p_capacity, Model model) {

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("pc_name", p_name);
		param.put("pc_gpu", p_gpu);
		param.put("pc_os", p_os);
		param.put("pc_cpu", p_cpu);
		param.put("pc_ram", p_ram);
		param.put("pc_capacity", p_capacity);
		param.put("code", code);
		param.put("id", id);
		
		repository.updatePC(param);

		return "redirect:/equipment/getEquipmentInfo?code=" + code + "&id=" + id;
	}

	@RequestMapping(value = "updateMonitor", method = RequestMethod.POST)
	public String updateMonitor(@RequestParam(value = "code", defaultValue = "") String code,
			@RequestParam(value = "id", defaultValue = "") String id,
			@RequestParam(value = "mo_name", defaultValue = "") String mo_name,
			@RequestParam(value = "mo_pannel", defaultValue = "") String mo_pannel,
			@RequestParam(value = "mo_hz", defaultValue = "") String mo_hz,
			@RequestParam(value = "mo_resolution", defaultValue = "") String mo_resolution,
			@RequestParam(value = "mo_speed", defaultValue = "") String mo_speed,
			@RequestParam(value = "mo_shape", defaultValue = "") String mo_shape, Model model) {

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("mo_name", mo_name);
		param.put("mo_pannel", mo_pannel);
		param.put("mo_hz", mo_hz);
		param.put("mo_resolution", mo_resolution);
		param.put("mo_speed", mo_speed);
		param.put("mo_shape", mo_shape);
		param.put("code", code);
		param.put("id", id);

		repository.updateMonitor(param);

		return "redirect:/equipment/getEquipmentInfo?code=" + code + "&id=" + id;
	}

	/**
	 * 장비 성능정보 삭제
	 * 
	 * @return
	 */
	@RequestMapping(value = "delEquipment", method = RequestMethod.POST)
	public String delEquipment(
			@RequestParam(value = "code") String code, @RequestParam(value = "m_code") String m_code,
			@RequestParam(value = "gubun", defaultValue = "") String gubun, 
			Model model
			) {

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("code", code);
		param.put("m_code", m_code);
		

		if (gubun.equals("MONITOR"))
			repository.delMonitor(param);
		else if (gubun.equals("PC")) {
			
			repository.delPC(param);
			System.out.println("pc 삭제");
		}
		else if (gubun.equals("PHONE"))
			repository.delPhone(param);

		return "redirect:/equipment";
	}

	/**
	 * 장비 성능 비교
	 * @throws Exception 
	 */
	@RequestMapping(value = "compare")
	public String compareEquipment(@RequestParam(value = "id", defaultValue = "") String id,
			@RequestParam(value = "code1", defaultValue = "") String code1,
			@RequestParam(value = "code2", defaultValue = "") String code2,
			HttpServletRequest request,
			Model model) throws Exception {
		
//		if(gubun.equals("phone")) gubun = "핸드폰";
//		else if(gubun.equals("monitor")) gubun = "모니터";
		
		Map<String, Object> param = new HashMap<String, Object>();
		
		Map<String, Object> selected = new HashMap<String, Object>();
		selected.put("id", id);
		selected.put("code1", code1);
		selected.put("code2", code2);
		
		// 사원 목록
		List<Map<String, Object>> empList = repository.selectEmps(param);
		
		// 사원별 장비 성능 정보
		param.put("id", id);
		param.put("code", code1);
		List<Map<String, Object>> equip1 = repository.getInfo(param);
		
		param.put("code", code2);
		List<Map<String, Object>> equip2 = repository.getInfo(param);
		
		model.addAttribute("emp", empList);
		model.addAttribute("selected", selected);
		
		if(equip1.size()>0) {
			model.addAttribute("equip1", equip1.get(0));
		}
		if(equip2.size()>0) {
			model.addAttribute("equip2", equip2.get(0));
		}
		
		return "equipment/compareEquipment";
	}
	
	/**
	 * 장치 목록 가져오기
	 * @throws Exception 
	 */
	@RequestMapping(value = "compare/getEquipmentList", method = RequestMethod.POST)
	public void getEquipmentList(
			@RequestParam(value = "code") String code		// 사원번호
			,@RequestParam(value = "gubun") String gubun	// 장치 종류(PC, Phone, Monitor)
			,HttpServletRequest request
			,HttpServletResponse response
			,Model model
			) throws Exception {
		
		JSONObject obj = new JSONObject();
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("code", code);
		param.put("gubun", gubun);
		
		List<Map<String, Object>> equipmentList = repository.getEquipmentList(param);
		
		obj.put("message", "success");
		obj.put("equip", equipmentList);
		
		response.setContentType("text/plain; charset=UTF-8");
		response.getWriter().write(obj.toString());
	}
	
	/**
	 * 장치 성능정보 조회
	 * @throws Exception 
	 */
	@RequestMapping(value = "compare/getAbility", method = RequestMethod.POST)
	public void getAbility(
			@RequestParam(value = "code") String code		// 사원번호
			,@RequestParam(value = "id") String id	// 장치 ID
			,HttpServletRequest request
			,HttpServletResponse response
			,Model model
			) throws Exception {
		
		JSONObject obj = new JSONObject();
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("code", code);
		param.put("id", id);
		
		List<Map<String, Object>> ability = repository.getEquipmentList(param);
		
		obj.put("message", "success");
		obj.put("ability", ability.get(0));
		
		response.setContentType("text/plain; charset=UTF-8");
		response.getWriter().write(obj.toString());
	}

	/**
	 * 장치 교체
	 */
	@RequestMapping(value = "changeEquipment", method = RequestMethod.POST)
	public String changeEquipment(@RequestParam(value = "code1", defaultValue = "") String code1,
			@RequestParam(value = "code2", defaultValue = "") String code2,
			@RequestParam(value = "gubun", defaultValue = "") String table,

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

			HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		
		Map<String, Object> param = new HashMap<String, Object>();
		Map<String, Object> param2 = new HashMap<String, Object>();
//		String gubun = "";

		// 1번 장비 정보 저장
		param.put("p_ap", p_ap1);
		param.put("p_os", p_os1);
		param.put("p_cpu", p_cpu1);
		param.put("p_ram", p_ram1);
		param.put("p_battery", p_battery1);
		param.put("p_capacity", p_capacity1);
		param.put("pc_division", pc_division1);
		param.put("pc_os", pc_os1);
		param.put("pc_cpu", pc_cpu1);
		param.put("pc_ram", pc_ram1);
		param.put("pc_gpu", pc_gpu1);
		param.put("pc_capacity", pc_capacity1);
		param.put("mo_pannel", mo_pannel1);
		param.put("mo_hz", mo_Hz1);
		param.put("mo_resolution", mo_resolution1);
		param.put("mo_speed", mo_speed1);
		param.put("mo_shape", mo_shape1);
		param.put("code", code2);
		
		// 2번 장비 정보
		param2.put("p_ap", p_ap2);
		param2.put("p_os", p_os2);
		param2.put("p_cpu", p_cpu2);
		param2.put("p_ram", p_ram2);
		param2.put("p_battery", p_battery2);
		param2.put("p_capacity", p_capacity2);
		param2.put("pc_division", pc_division2);
		param2.put("pc_os", pc_os2);
		param2.put("pc_cpu", pc_cpu2);
		param2.put("pc_ram", pc_ram2);
		param2.put("pc_gpu", pc_gpu2);
		param2.put("pc_capacity", pc_capacity2);
		param2.put("mo_pannel", mo_pannel2);
		param2.put("mo_hz", mo_Hz2);
		param2.put("mo_resolution", mo_resolution2);
		param2.put("mo_speed", mo_speed2);
		param2.put("mo_shape", mo_shape2);
		param2.put("code", code1);

		if (table.equals("PC")) {
			repository.updatePC(param);
			repository.updatePC(param2);
			
//			gubun = "pc";
			
		} else if (table.equals("PHONE")) {
			repository.updatePhone(param);
			repository.updatePhone(param2);
			
//			gubun = "phone";
			
		} else if (table.equals("MONITOR")) {
			repository.updateMonitor(param);
			repository.updateMonitor(param2);
			
//			gubun = "monitor";
		}

		return "redirect:/equipment/compare?gubun=" + table + "&code1=" + code1 + "&code2=" + code2;
	}
	
	@RequestMapping(value = "getManufactures", method = RequestMethod.POST)
	public void getManufactures(
			@RequestParam(value = "ma_kinds", defaultValue = "") Integer ma_kinds,
			HttpServletRequest request, 
			HttpServletResponse response, 
			Model model
			) throws Exception {
		// JSON 객체
		JSONObject obj = new JSONObject();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("ma_kinds", ma_kinds);
		
		// 제조사
		List<Map<String, Object>> manuList = repository.selectManufactures(param);
		
		obj.put("message", "success");
		obj.put("man", manuList);
		
//		model.addAttribute("man", manuList);
		
		response.setContentType("text/plain; charset=UTF-8");
		response.getWriter().write(obj.toString());
	}
}
