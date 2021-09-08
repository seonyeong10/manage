package controller.device;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("device")
public class DeviceController {
	
	/**
	 * 관리 가능한 장비 추가
	 * @return
	 */
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String addDevice(
			HttpServletResponse response,
			HttpServletRequest request,
			Model model
			) {
		return "device/deviceForm";
	}
	
	/**
	 * 장치 등록
	 */
	@RequestMapping(value = "insertDevice", method = RequestMethod.POST)
	public String insertDevice(
			@RequestParam(value = "k_abilty") String[] k_abilty,
			@RequestParam(value = "e_abilty") String[] e_abilty,
			HttpServletResponse response,
			HttpServletRequest request,
			Model model
			) {
		
		System.out.println("한글 : " + k_abilty.length);
		System.out.println("영문 : " + e_abilty.length);
		return "device/deviceForm";
	}
}
