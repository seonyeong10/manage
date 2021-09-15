package service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import command.MemberCommand;
import model.DTO.MemberDTO;
import model.DTO.UserInfoDto;
import repository.user.UserRepository;

@Service
public class UserAddService {
	
	@Autowired
	UserRepository repository;
	

	
	
}
