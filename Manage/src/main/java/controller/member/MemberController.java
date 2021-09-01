package controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.MemberCommand;
import service.member.MemberJoinService;
import validator.MemberCommandValidator;

@Controller
@RequestMapping("register") // 반복되는 주소
public class MemberController {
	@Autowired
	MemberJoinService memberJoinService;

	@RequestMapping("agree") // 반복 주소의 하위 주소
	public String agree() {
		return "member/agree";
	}

	@RequestMapping(value = "regist", method = RequestMethod.POST)
	public String member(Model model) {
		/**
		 * memberCommand 안에 아무것도 없고 에러 체크 안했고 에러 안나옴
		 */
		model.addAttribute("memberCommand", new MemberCommand());
		return "member/memberForm";
	}

	@RequestMapping(value = "memberJoin")
	public String memberJoin(MemberCommand memberCommand, Errors errors, Model model) {
		/**
		 * 유효성 검사를 위해서는 Error 객체 필요 Error는 커맨드 객체 다음에 선언되어야 함.
		 */
		new MemberCommandValidator().validate(memberCommand, errors);
		if (errors.hasErrors()) {
			return "member/memberForm";
		}
		memberJoinService.execute(memberCommand); // db에 저장
		return "member/memberWelcome";

	}

	// 0210
	@RequestMapping(value = "memberMail")
	public String memberMail(@RequestParam(value = "num") String num, @RequestParam(value = "receiver") String receiver,
			@RequestParam(value = "userId") String userId) {
		Integer i = memberJoinService.numUpdate(num, receiver, userId);
		if (i > 0) {
			return "member/success"; // 가입완료
		} else {
			return "member/fail"; // 이미 가입이 됨
		}
	}
}
