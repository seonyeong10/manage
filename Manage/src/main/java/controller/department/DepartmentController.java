package controller.department;

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

import repository.department.DepartmentRepository;

@Controller
@RequestMapping("department")
public class DepartmentController {
	
	@Autowired
	DepartmentRepository repository;
	
	/**
	 * 부서 등록 페이지 이동
	 * @return
	 */
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String addDepartment(
			HttpServletRequest request
			,HttpServletResponse response
			,Model model
			) {
		String title = "부서 등록";
		model.addAttribute("title", title);
		
		return "department/departmentForm";
	}
	
	/**
	 * 부서 등록
	 * @throws Exception 
	 */
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public void insertDept(
			@RequestParam(value = "d_name") String d_name
			,@RequestParam(value = "d_tim") String[] d_tim
			,HttpServletRequest request
			,HttpServletResponse response
			,Model model
			) throws Exception {
		
		// json객체
		JSONObject obj = new JSONObject();
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("d_name", d_name);
		param.put("d_tim", d_tim);
		
		repository.insertDept(param);
		
		obj.put("message", "success");
		
		response.setContentType("text/plain; charset=UTF-8");
		response.getWriter().write(obj.toString());
	}
	
	/**
	 * 부서 목록 조회
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String getDeptList(
			HttpServletRequest request
			,HttpServletResponse response
			,Model model
			) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		
		List<Map<String, Object>> deptList = repository.getDeptList(param);
		
		model.addAttribute("list", deptList);
		
		return "department/departmentList";
	}
	
	/**
	 * 부서 정보 조회
	 */
	@RequestMapping(value = "info", method = RequestMethod.POST)
	public String getDeptInfo(
			@RequestParam(value = "d_id") String d_id
			,HttpServletRequest request
			,HttpServletResponse response
			,Model model
			) {
		String title = "부서 정보 수정";
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("d_id", d_id);
		
		List<Map<String, Object>> deptList = repository.getDeptList(param);
		
		model.addAttribute("title", title);
		model.addAttribute("item", deptList.get(0));
		
		return "department/departmentForm";
	}
	
	/**
	 * 부서 정보 수정
	 */
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateDept(
			@RequestParam(value = "d_id") String d_id
			,@RequestParam(value = "d_name") String d_name
			,@RequestParam(value = "d_tim") String d_tim
			,HttpServletRequest request
			,HttpServletResponse response
			,Model model
			) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("d_id", d_id);
		param.put("d_name", d_name);
		param.put("d_tim", d_tim);
		
		int result = repository.updateDept(param);
		
		return "redirect:/department/list";
	}
	
	/**
	 * 부서 삭제
	 * @return
	 */
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String deleteDept(
			@RequestParam(value = "d_id") String d_id
			,HttpServletRequest request
			,HttpServletResponse response
			,Model model
			) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("d_id", d_id);
		
		int result = repository.deleteDept(param);
		
		return "redirect:/department/list";
	}
	
}
