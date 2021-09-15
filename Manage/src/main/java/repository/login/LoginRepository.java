package repository.login;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DTO.UserInfoDto;

@Repository
public class LoginRepository {
	
	@Autowired
	private SqlSession sqlSession;
	private final String namespace = "mapper.user.userMapper";	// 사용하는 mapper 파일
	private String statement;
	
	
	
	public UserInfoDto login(UserInfoDto dto) {
		statement = namespace +".loginPermit";
		
		System.out.println("로그인 리파지터리");
		UserInfoDto res = null;
		
		System.out.println(dto.getId());
		System.out.println(dto.getPw());
		
		try {
			res = sqlSession.selectOne(statement, dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return res;
	}




	
	
	
}
