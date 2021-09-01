package service.member;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import command.MemberCommand;
import controller.MailService;
import controller.SmsSend;
import model.DTO.MemberDTO;
import repository.member.MemberRepository;

@Service
public class MemberJoinService {
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	// DAO
	@Autowired
	MemberRepository memberRepository;
//	@Autowired
//	private JavaMailSender mailSender;
	@Autowired
	MailService mailService;
	
	public void execute(MemberCommand memberCommand) {
		MemberDTO memberDTO = new MemberDTO();
		Integer result = null;
		memberDTO.setUserAddr(memberCommand.getUserAddr());
		memberDTO.setUserBirth(
					new Timestamp(memberCommand.getUserBirth().getTime()));
		memberDTO.setUserEmail(memberCommand.getUserEmail());
		memberDTO.setUserGender(memberCommand.getUserGender());
		memberDTO.setUserId(memberCommand.getUserId());
		memberDTO.setUserName(memberCommand.getUserName());
		memberDTO.setUserPh1(memberCommand.getUserPh1());
		memberDTO.setUserPh2(memberCommand.getUserPh2());
		// 암호화
		String pw = bcryptPasswordEncoder.encode(memberCommand.getUserPw());
		memberDTO.setUserPw(pw);
		String ins="";
		for(String str : memberCommand.getInterest()) {
			ins += str + "`";
		}
		memberDTO.setInterest(ins);
		result = memberRepository.insertMember(memberDTO);
		// 0210
		if(result != null) {
			SimpleDateFormat dateForm = new SimpleDateFormat("yyyyMMddHHmmss");
			String num = dateForm.format(new Date());	// 스트링을 날짜로 바꿀 땐 format 반대는 parse
			String subject = "가입환영인사";	// 메일 제목
			// 파일 전송
			// 내용은 html로 작성
			String contents = "<html><body>"
					+ "안녕하세요. '" + memberDTO.getUserName()
					+ "'님 가입을 환영합니다.<br />"
					+ "가입을 완료하시려면 <a href='http://192.168.0.43:8080/SpringMybatisMVCProject/register/memberMail?num="+num+"&receiver="+memberDTO.getUserEmail()+"&userId="+memberDTO.getUserId()+"'>여기</a>를 눌러주세요.";
			try {
				SmsSend ss = new SmsSend();
				ss.smsSend(memberDTO.getUserPh1(), memberDTO.getUserName() + "님 smrit 가입을 환영합니다. 메일을 받지 못했으면 155-1555");
				mailService.sendMail(memberDTO.getUserEmail(), memberDTO.getUserId(), contents, subject);
//				sendMail(memberDTO.getUserEmail(), memberDTO.getUserId(), contents, subject);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
 	}
	
	public Integer numUpdate(String num, String receiver, String userId) {
		// mybatis는 dto에 넣어서 사용해야 한다.(한개밖에 값을 못받음)
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setChkOk(num);
		memberDTO.setUserEmail(receiver);
		memberDTO.setUserId(userId);
		return memberRepository.joinOkUpdate(memberDTO);
	}
	
//	public void sendMail(String reciver, String userId, 
//			String content,String subject) throws Exception {
//		MimeMessage msg = mailSender.createMimeMessage();
//
//		msg.setHeader("content-type", "text/html; charset=UTF-8");
//		msg.setContent(content, "text/html; charset=UTF-8");
//		msg.setSubject(subject);
//		msg.setRecipient(MimeMessage.RecipientType.TO , new InternetAddress(reciver));
//		mailSender.send(msg);
//	}
}
