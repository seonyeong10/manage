package controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.MemberCommand;
import service.member.MemberAddServcie;

@Controller
public class MemberController {
//	@Autowired
//	MemberJoinService memberJoinService;
	
	@Autowired
	MemberAddServcie memberAddServcie;

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
