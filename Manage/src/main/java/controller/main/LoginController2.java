package controller.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.LoginCommand;
import model.AuthInfo;
import repository.main.LoginRepository2;
import service.auth.AuthService;
import validator.LoginCommandValidator;

@Controller
@RequestMapping("login2")
public class LoginController2 {
	@Autowired
	AuthService authService;
	
	@Autowired
	LoginRepository2 repository;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	/**
	 * 로그인 화면 이동
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String openForm() {
		return "login";	
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public void submit(
			@RequestParam(value = "id", defaultValue = "") String id,
			@RequestParam(value = "pw", defaultValue = "") String pw,
			HttpSession session, 
			HttpServletRequest request, 
			HttpServletResponse response, 
			Model model
			) throws Exception {
		
		// JSON 객체
		JSONObject obj = new JSONObject();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		
		List<Map<String, Object>> user = repository.getUser(param);
		
		
		if(user.size() < 1) {
			obj.put("message", "noUser");
		} else if(!passwordEncoder.matches(pw, user.get(0).get("PW").toString())) {
			obj.put("message", "noMatch");
		} else {
			AuthInfo authInfo = new AuthInfo(user.get(0).get("ID").toString(), user.get(0).get("AUTH").toString());
			session.setAttribute("authInfo", authInfo);
			obj.put("message", "success");
		}
		
		response.setContentType("text/plain; charset=UTF-8");
		response.getWriter().write(obj.toString());
		// 디비에 있으면 세션에 저장, 없으면 에러
//		MemberDTO memberDTO = new MemberDTO();
//		memberDTO.setUserId(loginCommand.getLoginId());
//		memberDTO = memberRepository.selectByMember(memberDTO);
//		param.compute(key, remappingFunction);
//		if(memberDTO == null) {
//			errors.rejectValue("loginId", "notId");
//		} else {
//			// 아이디 존재
//			if(memberDTO.getChkOk() == null) {
//				errors.rejectValue("loginId", "notChk");
//			} else {
//				if(bcryptPasswordEncoder.matches(loginCommand.getLoginPw(), memberDTO.getUserPw())){
//					authInfo = new AuthInfo(memberDTO.getUserId(), memberDTO.getUserEmail(), memberDTO.getUserName());
//					session.setAttribute("authInfo", authInfo);
//				}
//			}
//		}
		
//		// command 객체에 저장되어야 validator 사용 가능
//		new LoginCommandValidator().validate(loginCommand,errors);
//		authService.authenticate(loginCommand, errors, session);	// 사용자 없습니다 / 비밀번호 틀렸습니다 출력
//		if(errors.hasErrors()) {
//			// 에러가 있으면 로그인 주소의 메인페이지 /login/main
//			return "login";
//		}
//		// 없으면 로그인 주소 빼고 main
		
	}
	
	/**
	 * 회원가입 화면 오픈
	 */
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String openUserForm() {
		return "userForm2";	
	}
	
	/**
	 * 회원가입 화면 오픈
	 */
	@RequestMapping(value = "checkId", method = RequestMethod.POST)
	public void checkId(
			@RequestParam(value = "id", defaultValue = "") String id,
			HttpServletRequest request, 
			HttpServletResponse response, 
			Model model
			) throws Exception {
		
		// JSON 객체
		JSONObject obj = new JSONObject();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		
		int cnt = repository.checkId(param);
		
		
		if(cnt == 0) {
			obj.put("message", "success");
		} else {
			obj.put("message", "duplicate");
		}
		
		response.setContentType("text/plain; charset=UTF-8");
		response.getWriter().write(obj.toString());
	}
	
	/**
	 * 회원가입
	 */
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public void insertUsers(
			@RequestParam(value = "id") String id,
			@RequestParam(value = "pw") String pw,
			@RequestParam(value = "code") String code,
			@RequestParam(value = "checkId") String checkId,
			HttpServletRequest request, 
			HttpServletResponse response, 
			Model model
			) throws Exception {
		
		// JSON 객체
		JSONObject obj = new JSONObject();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("code", code);
		
		int cnt = repository.existCode(param); 
		
		if(pw.length() < 4) {
			obj.put("message", "shortPw");
		} else if(cnt != 1) {
			obj.put("message", "noEmp");
		} else if(checkId == null || checkId.equals("")) {
			obj.put("message", "noCheckId");
		} else {
			param.put("id", id);
			param.put("pw", passwordEncoder.encode(pw));
			
			repository.insertUsers(param);
			
			obj.put("message", "success");
		}
		
		response.setContentType("text/plain; charset=UTF-8");
		response.getWriter().write(obj.toString());
	}
	
	/**
	 * 로그아웃
	 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(
			HttpSession session, 
			HttpServletRequest request, 
			HttpServletResponse response, 
			Model model
			) throws Exception {
		
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	
}
