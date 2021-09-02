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
		// TODO Auto-generated method stub
		System.out.println("code : " + memberCommand.getCode());
		System.out.println("m_name : " + memberCommand.getM_name());
		System.out.println("m_depart : " + memberCommand.getM_depart());
		System.out.println("m_job : " + memberCommand.getM_job());
		System.out.println("m_age : " + memberCommand.getM_age());
		System.out.println("m_phone : " + memberCommand.getM_phone());
		System.out.println("m_email : " + memberCommand.getM_email());
		System.out.println("m_address : " + memberCommand.getM_address());
		System.out.println("m_gender : " + memberCommand.getM_gender());
		int result = 0;
		MemberDTO dto = new MemberDTO(memberCommand.getCode(), memberCommand.getM_name(), memberCommand.getM_depart(), memberCommand.getM_job(), memberCommand.getM_age(), memberCommand.getM_phone(), memberCommand.getM_email(), memberCommand.getM_address(), memberCommand.getM_gender());
		result = repository.insertMember(dto);
		
		System.out.println(result);
	}

}
