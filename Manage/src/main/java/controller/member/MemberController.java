package controller.member;

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
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.MemberCommand;
import repository.member.MemberRepository;
import service.member.MemberAddServcie;

@Controller
@RequestMapping("employee")
public class MemberController {
//	@Autowired
//	MemberJoinService memberJoinService;
	
	@Autowired
	MemberAddServcie memberAddServcie;
	
	@Autowired
	MemberRepository repository;

	@RequestMapping(value="add", method=RequestMethod.GET) // 반복 주소의 하위 주소
	public String addMember(Model model) {
		model.addAttribute("memberCommand", new MemberCommand());
		return "member/memberForm";
	}
	
	@RequestMapping(value = "addMember", method=RequestMethod.POST)
	public String insertMember(MemberCommand memberCommand, Model model) {
//		System.out.println("실행");
		memberAddServcie.insertMem(memberCommand);
		return "member/memberWelcome";
	}
	
	/**
	 * 사번 중복 검사
	 * @throws Exception 
	 */
	@RequestMapping(value = "isDuplicate", method = RequestMethod.POST)
	public void isDuplicate(
			@RequestParam(value = "code", defaultValue = "") String code,
			HttpServletRequest request,
			HttpServletResponse response,
			Model model
			) throws Exception {
//		System.out.println(1);
		
		JSONObject obj = new JSONObject();
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("code", code);
		int cnt = repository.getEmpCnt(param);
		
		obj.put("message", "success");
		obj.put("cnt", cnt);
		response.setContentType("text/plain; charset=UTF-8");
		response.getWriter().write(obj.toString());
	}
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String getMemberList(
			HttpServletRequest request,
			HttpServletResponse response,
			Model model
			) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		List<Map<String, Object>> empList = repository.getEmployeeList(param);
		
		model.addAttribute("empList", empList);
		
		return "member/memberList";
	}
	
	@RequestMapping(value = "info", method = RequestMethod.GET)
	public String getMemberInfo(
			@RequestParam(value = "code") String code,
			HttpServletRequest request,
			HttpServletResponse response,
			Model model
			) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("code", code);
		
		List<Map<String, Object>> empList = repository.getEmployeeList(param);
		
		model.addAttribute("empList", empList.get(0));
		
		return "member/memberInfo";
	}
	
	/**
	 * 사원정보 수정
	 */
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateMemeber(
			@RequestParam(value = "code") String code,
			@RequestParam(value = "m_name") String m_name,
			@RequestParam(value = "m_depart") String m_depart,
			@RequestParam(value = "m_job") String m_job,
			@RequestParam(value = "m_age") String m_age,
			@RequestParam(value = "m_phone") String m_phone,
			@RequestParam(value = "m_email") String m_email,
			@RequestParam(value = "m_address") String m_address,
			@RequestParam(value = "m_gender") String m_gender,
			HttpServletRequest request,
			HttpServletResponse response,
			Model model
			) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("code", code);
		param.put("m_name", m_name);
		param.put("m_depart", m_depart);
		param.put("m_job", m_job);
		param.put("m_age", m_age);
		param.put("m_phone", m_phone);
		param.put("m_email", m_email);
		param.put("m_address", m_address);
		param.put("m_gender", m_gender);
		
		repository.updateEmployee(param);
		
		return "redirect:/employee/info?code=" + code;
	}

	/**
	 * 사원정보 삭제
	 */
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String delEmployee(
			@RequestParam(value = "code") String code,
			HttpServletRequest request,
			HttpServletResponse response,
			Model model
			) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("code", code);
		
		repository.delEmployee(param);
		return "redirect:/employee/list";
	}
//	@RequestMapping(value = "regist", method = RequestMethod.POST)
//	public String member(Model model) {
//		/**
//		 * memberCommand 안에 아무것도 없고 에러 체크 안했고 에러 안나옴
//		 */
//		model.addAttribute("memberCommand", new MemberCommand());
//		return "member/memberForm";
//	}
//
//	@RequestMapping(value = "memberJoin")
//	public String memberJoin(MemberCommand memberCommand, Errors errors, Model model) {
//		/**
//		 * 유효성 검사를 위해서는 Error 객체 필요 Error는 커맨드 객체 다음에 선언되어야 함.
//		 */
//		new MemberCommandValidator().validate(memberCommand, errors);
//		if (errors.hasErrors()) {
//			return "member/memberForm";
//		}
//		memberJoinService.execute(memberCommand); // db에 저장
//		return "member/memberWelcome";
//
//	}

}
