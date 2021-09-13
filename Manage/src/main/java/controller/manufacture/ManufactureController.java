package controller.manufacture;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import repository.manufacture.ManufactureRepository;
import service.manufacture.AddManufactureService;
import service.manufacture.ManufactureListService;

@Controller
@RequestMapping("manufacture")
public class ManufactureController {
	@Autowired
	AddManufactureService addManufactureService;
	@Autowired
	ManufactureListService manufactureListService;
	
	@Autowired
	ManufactureRepository repository;
	
	/**
	 * 제조사 등록 페이지 이동
	 * @return
	 */
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String openManufactureForm(Model model) {
		model.addAttribute("title", "제조사 등록");
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
		addManufactureService.insertManufacture(ma_code, ma_name, ma_kinds, model);
		return "redirect:/manufacture";
	}
	
	/**
	 * 제조사 목록 조회
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String getManufactureList(Model model) {
		manufactureListService.getManufactureList(model);
		return "manufacture/manufactureList";
	}
	
	/**
	 * 제조사 코드 조회
	 * @throws Exception 
	 */
	@RequestMapping(value = "getMaCode", method = RequestMethod.POST)
	public void getMaCode(
			@RequestParam(value = "ma_kinds") String ma_kinds,
			HttpServletRequest request,
			HttpServletResponse response,
			Model model
			) throws Exception {
		
		JSONObject obj = new JSONObject();
		String ma_code = null;
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("ma_kinds", ma_kinds);
		
		
		List<Map<String, Object>> maxCode = repository.getMaCode(param);

		if(maxCode.get(0) == null) {
			ma_code = ma_kinds + "1";
		} else {
			int num = Integer.parseInt(String.valueOf(maxCode.get(0).get("MAX_CODE"))) + 1;
			ma_code = String.valueOf(num);
		}
		
		obj.put("message", "success");
		obj.put("ma_code", ma_code);
		
		response.setContentType("text/plain; charset=UTF-8");
		response.getWriter().write(obj.toString());
	}
	
	/**
	 * 제조사 수정
	 */
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateManufacture(
			@RequestParam(value = "ma_code") String ma_code,
			HttpServletRequest request,
			HttpServletResponse response,
			Model model
			) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("ma_code", ma_code);
		
		List<Map<String, Object>> manufacture = repository.selectManufactureList(param);
		
		model.addAttribute("man", manufacture.get(0));
		model.addAttribute("title", "제조사 정보수정");
		
		return "manufacture/manufactureForm";
	}
	
	@RequestMapping(value = "/update/modify", method=RequestMethod.POST)
	public String modifyManufacture(
			@RequestParam(value = "ma_code") Integer ma_code,
			@RequestParam(value = "ma_name") String ma_name,
			@RequestParam(value = "ma_kinds") Integer ma_kinds,
			Model model
			) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("ma_code", ma_code);
		param.put("ma_name", ma_name);
		param.put("ma_kinds", ma_kinds);
		
		repository.modifyManu(param);
		
		return "redirect:/manufacture";
	}
	
	/**
	 * 제조사 삭제
	 */
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String deleteManufacture(
			@RequestParam(value = "ma_code") String ma_code,
			HttpServletRequest request,
			HttpServletResponse response,
			Model model
			) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("ma_code", ma_code);
		
		repository.deleteManu(param);
		
		return "redirect:/manufacture";
	}
	
	/**
	 * 제조사 검색
	 */
	@RequestMapping(value = "schList", method = RequestMethod.POST)
	public String schList(
			@RequestParam(value = "ma_kinds", required = false) String[] ma_kinds,
			@RequestParam(value = "schThem", required = false) String schThem,
			@RequestParam(value = "schVal", required = false) String schVal,
			HttpServletRequest request,
			HttpServletResponse response,
			Model model
			) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("ma_kinds", ma_kinds);
		param.put(schThem, schVal);
		
		List<Map<String, Object>> manufactureList = repository.selectManufactureList(param);
		
		model.addAttribute("manuList", manufactureList);
		return "manufacture/manufactureList";
	}
}
