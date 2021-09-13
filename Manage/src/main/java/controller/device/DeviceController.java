package controller.device;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import repository.device.DeviceRepository;

@Controller
@RequestMapping("device")
public class DeviceController {
	@Autowired
	DeviceRepository repository;
	
	/**
	 * 관리 가능한 장비 추가
	 * @return
	 */
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String addDevice(
			HttpServletResponse response
			,HttpServletRequest request
			,Model model
			) {
		return "device/deviceForm";
	}
	
	/**
	 * 장치 등록
	 */
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insertDevice(
			@RequestParam(value = "gubun") String gubun
			,@RequestParam(value = "name") String name
			,@RequestParam(value = "m_code") String m_code
			,@RequestParam(value = "pc_division") String pc_division
			,@RequestParam(value = "pc_os") String pc_os
			,@RequestParam(value = "pc_cpu") String pc_cpu
			,@RequestParam(value = "pc_ram") String pc_ram
			,@RequestParam(value = "pc_gpu") String pc_gpu
			,@RequestParam(value = "pc_capacity") String pc_capacity
			,@RequestParam(value = "mo_pannel") String mo_pannel
			,@RequestParam(value = "mo_Hz") String mo_Hz
			,@RequestParam(value = "mo_resolution") String mo_resolution
			,@RequestParam(value = "mo_speed") String mo_speed
			,@RequestParam(value = "mo_shape") String mo_shape
			,@RequestParam(value = "p_ap") String p_ap
			,@RequestParam(value = "p_os") String p_os
			,@RequestParam(value = "p_cpu") String p_cpu
			,@RequestParam(value = "p_ram") String p_ram
			,@RequestParam(value = "p_capacity") String p_capacity
			,@RequestParam(value = "p_battery") String p_battery
			,HttpServletResponse response
			,HttpServletRequest request
			,Model model
			) {
		Map<String, Object> param = new HashMap<String, Object>();
		int result = 0;
		
		param.put("m_code", m_code);
		
		if(gubun.equals("100")) {
			// PC
			param.put("pc_name", name);
			param.put("pc_division", pc_division);
			param.put("pc_os", pc_os);
			param.put("pc_cpu", pc_cpu);
			param.put("pc_ram", pc_ram);
			param.put("pc_gpu", pc_gpu);
			param.put("pc_capacity", pc_capacity);
			
			System.out.println(param.entrySet());
			
			result = repository.insertPC(param);
			
		} else if(gubun.equals("300")) {
			// 모니터
			param.put("mo_name", name);
			param.put("m_code", m_code);
			param.put("mo_pannel", mo_pannel);
			param.put("mo_Hz", mo_Hz);
			param.put("mo_resolution", mo_resolution);
			param.put("mo_speed", mo_speed);
			
			String shape = null;
			if(mo_shape.equals("100")) {
				shape = "커브드";
			} else if(mo_shape.equals("200")) {
				shape = "와이드";
			} else if(mo_shape.equals("300")) {
				shape = "평면";
			}
			param.put("mo_shape", mo_shape);
			
			result = repository.insertMonitor(param);
			
		} else if(gubun.equals("400")) {
			// 핸드폰
			param.put("p_name", name);
			param.put("m_code", m_code);
			param.put("p_ap", p_ap);
			param.put("p_os", p_os);
			param.put("p_cpu", p_cpu);
			param.put("p_ram", p_ram);
			param.put("p_capacity", p_capacity);
			param.put("p_battery",p_battery);
			
			result = repository.insertPhone(param);
		}
		
		return "device/deviceForm";
	}
	
	/**
	 * 장비 목록 조회
	 * @return
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String getDeviceList(
			HttpServletResponse response
			,HttpServletRequest request
			,Model model
			) {
		Map<String, Object> param = new HashMap<String, Object>();
		
		List<Map<String, Object>> list = repository.getDeviceList(param);
		
		model.addAttribute("list", list);
		return "device/deviceList";
	}
	
	/**
	 * 장비 목록 검색
	 */
	public String schDeviceList(
			@RequestParam(value = "gubun") String gubun
			,@RequestParam(value = "schThem") String schThem
			,@RequestParam(value = "schVal") String schVal
			,HttpServletResponse response
			,HttpServletRequest request
			,Model model
			) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("gubun", gubun);
		param.put("schThem", schThem);
		param.put("schVal", schVal);
		
		List<Map<String, Object>> list = repository.getDeviceList(param);
		
		return "device/deviceList";
	}
	
	/**
	 * 장비 상세정보 조회
	 * @return
	 */
	@RequestMapping(value = "info", method = RequestMethod.GET)
	public String getDeviceInfo(
			@RequestParam(value = "id") String id
			,HttpServletResponse response
			,HttpServletRequest request
			,Model model
			) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		
		List<Map<String, Object>> list = repository.getDeviceList(param);
		
		model.addAttribute("item", list.get(0));
		
		return "device/deviceInfo";
	}
	
	/**
	 * 장비 정보 수정
	 * @throws Exception 
	 */
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public void updateDevice(
			@RequestParam(value = "id") String id
			,@RequestParam(value = "gubun") String gubun
			,@RequestParam(value = "name") String name
			,@RequestParam(value = "m_code") String m_code
			,@RequestParam(value = "pc_division") String pc_division
			,@RequestParam(value = "pc_os") String pc_os
			,@RequestParam(value = "pc_cpu") String pc_cpu
			,@RequestParam(value = "pc_ram") String pc_ram
			,@RequestParam(value = "pc_gpu") String pc_gpu
			,@RequestParam(value = "pc_capacity") String pc_capacity
			,@RequestParam(value = "mo_pannel") String mo_pannel
			,@RequestParam(value = "mo_Hz") String mo_Hz
			,@RequestParam(value = "mo_resolution") String mo_resolution
			,@RequestParam(value = "mo_speed") String mo_speed
			,@RequestParam(value = "mo_shape") String mo_shape
			,@RequestParam(value = "p_ap") String p_ap
			,@RequestParam(value = "p_os") String p_os
			,@RequestParam(value = "p_cpu") String p_cpu
			,@RequestParam(value = "p_ram") String p_ram
			,@RequestParam(value = "p_capacity") String p_capacity
			,@RequestParam(value = "p_battery") String p_battery
			,HttpServletResponse response
			,HttpServletRequest request
			,Model model
			) throws Exception {
		// JSON 객체
		JSONObject obj = new JSONObject();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		param.put("m_code", m_code);
		
		int result = 0;
		
		if(gubun.equals("100")) {
			param.put("pc_name", name);
			param.put("pc_division", pc_division);
			param.put("pc_os", pc_os);
			param.put("pc_cpu", pc_cpu);
			param.put("pc_ram", pc_ram);
			param.put("pc_gpu", pc_gpu);
			param.put("pc_capacity", pc_capacity);
			
			result = repository.updatePC(param);
			
		} else if(gubun.equals("400")) {
			param.put("p_name", name);
			param.put("p_ap", p_ap);
			param.put("p_os", p_os);
			param.put("p_cpu", p_cpu);
			param.put("p_ram", p_ram);
			param.put("p_capacity", p_capacity);
			param.put("p_battery", p_battery);
			
			result = repository.updatePhone(param);
			
		} else if(gubun.equals("300")) {
			param.put("mo_name", name);
			param.put("mo_pannel", mo_pannel);
			param.put("mo_hz", mo_Hz);
			param.put("mo_resolution", mo_resolution);
			param.put("mo_speed", mo_speed);
			param.put("mo_shape", mo_shape);
			
			result = repository.updateMonitor(param);
		}
		
		if(result > 0) {
			obj.put("message", "success");
		} else {
			obj.put("message", "err");
		}
		
		response.setContentType("text/plain; charset=UTF-8");
		response.getWriter().write(obj.toString());
	}
	
	/**
	 * 장비 정보 삭제
	 * @throws Exception 
	 */
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public void delete(
			@RequestParam(value = "id") String id
			,@RequestParam(value = "gubun") String gubun
			,HttpServletResponse response
			,HttpServletRequest request
			,Model model
			) throws Exception {
		// JSON 객체
		JSONObject obj = new JSONObject();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
				
		int result = 0;
				
		if(gubun.equals("100")) {
			result = repository.delPC(param);
					
		} else if(gubun.equals("400")) {
			result = repository.delPhone(param);
					
		} else if(gubun.equals("300")) {
			result = repository.delMonitor(param);
		}
				
		if(result > 0) {
			obj.put("message", "success");
		} else {
			obj.put("message", "err");
		}		
		
		response.setContentType("text/plain; charset=UTF-8");
		response.getWriter().write(obj.toString());
	}
}
