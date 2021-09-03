package service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import command.MemberCommand;
import model.DTO.MemberDTO;
import repository.member.MemberRepository;

@Service
public class MemberAddServcie {
	@Autowired
	MemberRepository repository;

	public void insertMem(MemberCommand memberCommand) {
		int result = 0;	// 초기화
		
		MemberDTO dto = new MemberDTO(memberCommand.getCode(), memberCommand.getM_name(), memberCommand.getM_depart(), memberCommand.getM_job(), memberCommand.getM_age(), memberCommand.getM_phone(), memberCommand.getM_email(), memberCommand.getM_address(), memberCommand.getM_gender());
		result = repository.insertMember(dto);
		
		System.out.println(result);
	}

}
