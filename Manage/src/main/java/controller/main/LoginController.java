package controller.main;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpRequest;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import command.LoginCommand;
import model.DTO.UserInfoDto;
import repository.login.LoginRepository;
import service.auth.AuthService;
import validator.LoginCommandValidator;

@Controller
@RequestMapping("/login")
public class LoginController {
//	@Autowired
//	AuthService authService;
	@Autowired
	LoginRepository repository;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(method = RequestMethod.GET)
	public String openForm() {
		return "login";	
	}
	
//	@RequestMapping(method = RequestMethod.POST)
//	public String submit(LoginCommand loginCommand, Errors errors, HttpSession session) {
//		// command 객체에 저장되어야 validator 사용 가능
//		new LoginCommandValidator().validate(loginCommand,errors);
//		authService.authenticate(loginCommand, errors, session);	// 사용자 없습니다 / 비밀번호 틀렸습니다 출력
//		if(errors.hasErrors()) {
//			// 에러가 있으면 로그인 주소의 메인페이지 /login/main
//			return "main";
//		}
//		// 없으면 로그인 주소 빼고 main
//		return "redirect:/";
//	}
	
	@RequestMapping(value = "loginform", method = RequestMethod.GET)
	public String loginForm(Model model) { 
		
		
		return "user/userLogin";
	}
	
	
	
	@RequestMapping(value = "ajaxlogin", method=RequestMethod.POST)
	@ResponseBody
	public void ajaxLogin(
			HttpSession session, 
			UserInfoDto dto,
			HttpServletRequest request,
			HttpServletResponse response
			) throws Exception{

		System.out.println("로그인 컨트롤러");
		System.out.println(dto);
		
		JSONObject obj = new JSONObject();
		
		UserInfoDto res = repository.login(dto);
		System.out.println(res);
		boolean check = false;
		
		System.out.println();
		
		if (res != null) {
			if(passwordEncoder.matches(dto.getPw(), res.getPw())) {
				session.setAttribute("authInfo", res);
				check=true;
			}
		}
		System.out.println("check : "+check);
		
		obj.put("message", check);
		
		response.setContentType("text/plain; charset=UTF-8");
		response.getWriter().write(obj.toString());
		
//		Map<String, Boolean> map = new HashMap<String, Boolean>();
//		map.put("check", check);
//		
//		return map;
	}
	
	
	@RequestMapping(value = "logout" )
	 public String logout(HttpSession session) {
        session.invalidate();

        
        return "redirect:/main";
    }
	
}
