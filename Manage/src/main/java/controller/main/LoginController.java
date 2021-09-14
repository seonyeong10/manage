package controller.main;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import command.LoginCommand;
import service.auth.AuthService;
import validator.LoginCommandValidator;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired
	AuthService authService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String openForm() {
		return "login";	
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String submit(LoginCommand loginCommand, Errors errors, HttpSession session) {
		// command 객체에 저장되어야 validator 사용 가능
		new LoginCommandValidator().validate(loginCommand,errors);
		authService.authenticate(loginCommand, errors, session);	// 사용자 없습니다 / 비밀번호 틀렸습니다 출력
		if(errors.hasErrors()) {
			// 에러가 있으면 로그인 주소의 메인페이지 /login/main
			return "main";
		}
		// 없으면 로그인 주소 빼고 main
		return "redirect:/";
	}
}
