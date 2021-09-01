package service.auth;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.validation.Errors;

import command.LoginCommand;
import model.AuthInfo;
import model.DTO.MemberDTO;
import repository.member.MemberRepository;

public class AuthService {
	@Autowired
	MemberRepository memberRepository;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	private AuthInfo authInfo;
	public void authenticate(LoginCommand loginCommand, Errors errors, HttpSession session) {
		// 디비에 있으면 세션에 저장, 없으면 에러
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setUserId(loginCommand.getLoginId());
		memberDTO = memberRepository.selectByMember(memberDTO);
		if(memberDTO == null) {
			errors.rejectValue("loginId", "notId");
		} else {
			// 아이디 존재
			if(memberDTO.getChkOk() == null) {
				errors.rejectValue("loginId", "notChk");
			} else {
				if(bcryptPasswordEncoder.matches(loginCommand.getLoginPw(), memberDTO.getUserPw())){
					authInfo = new AuthInfo(memberDTO.getUserId(), memberDTO.getUserEmail(), memberDTO.getUserName());
					session.setAttribute("authInfo", authInfo);
				}
			}
		}
	}
	
}
