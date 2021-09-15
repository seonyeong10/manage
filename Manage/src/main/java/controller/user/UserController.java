package controller.user;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.MemberCommand;
import model.DTO.UserInfoDto;
import repository.member.MemberRepository;
import repository.user.UserRepository;
import service.user.UserAddService;


@Controller
@RequestMapping("userinfo")
public class UserController {

	@Autowired
	UserAddService userAddService;
	
	@Autowired
	UserRepository repository;
	
	@Autowired
	MemberRepository memrepository;
	
	@Autowired
	BCryptPasswordEncoder encoder;
	
	
	@RequestMapping(value = "form", method = RequestMethod.GET)
	public String userForm(Model model, HttpSession session) { 
		
		if(session.getAttribute("authInfo") == null) {
			return "user/userForm";
		} else {
			return "user/userForm2";
		}
		
	}
	
	@RequestMapping(value = "userMem", method = RequestMethod.GET)
	public String getUserMemberList(
			HttpServletRequest request,
			HttpServletResponse response,
			Model model
			) {
		
		Map<String, Object> param = new HashMap<String, Object>();
//		List<Map<String, Object>> empList = memrepository.getEmployeeList(param);
		List<Map<String, Object>> userList = repository.getUserList(param);
		model.addAttribute("userList", userList);
		
		return "user/userMember";
	}
	
	@RequestMapping(value = "idCheck", method = RequestMethod.POST)
	private void idCheck(@RequestParam(value = "id", defaultValue = "") String id, 
				HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		System.out.println("아이디 체크 컨트롤러"+id);
		JSONObject obj = new JSONObject();
	

		int cnt = repository.compareId(id);
		
		obj.put("message", "success");
		obj.put("cnt", cnt);
		
		response.setContentType("text/plain; charset=UTF-8");
		response.getWriter().write(obj.toString());
		
	}
	
	@RequestMapping(value = "addUser", method = RequestMethod.POST)
	public String addUser(UserInfoDto dto) {
		System.out.println("dto:"+dto);
		dto.setPw(encoder.encode(dto.getPw()));
		int res = repository.insert(dto);
		if(res>0) {
			return "redirect:/main";
		} else {
			return "redirect:form";
		}
		
	}
	
}
