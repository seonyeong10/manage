package controller.manufacture;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import service.manufacture.AddManufactureService;
import service.manufacture.ManufactureListService;

@Controller
public class ManufactureController {
	@Autowired
	AddManufactureService addManufactureService;
	@Autowired
	ManufactureListService manufactureListService;
	
	/**
	 * 제조사 등록 페이지 이동
	 * @return
	 */
	@RequestMapping(value = "openManufactureForm", method = RequestMethod.GET)
	public String openManufactureForm() {
		return "manufacture/manufactureForm";
	}
	
	/**
	 * 제조사 등록
	 */
	@RequestMapping(value = "insertManufacture", method = RequestMethod.POST)
	public String insertManufacture(
			@RequestParam(value = "ma_code") Integer ma_code,
			@RequestParam(value = "ma_name") String ma_name,
			@RequestParam(value = "ma_kinds") Integer ma_kinds,
			Model model
			) {
//		System.out.println("ma_code : " + ma_code);
//		System.out.println("ma_name : " + ma_name);
//		System.out.println("ma_kinds : " + ma_kinds);
		addManufactureService.insertManufacture(ma_code, ma_name, ma_kinds, model);
		return "manufacture/manufactureList";
	}
	
	/**
	 * 제조사 목록 조회
	 * @return
	 */
	@RequestMapping(value = "getManufactureList", method = RequestMethod.GET)
	public String getManufactureList(Model model) {
		manufactureListService.getManufactureList(model);
		return "manufacture/manufactureList";
	}
}
