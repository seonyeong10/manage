package repository.user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DTO.UserInfoDto;
import service.user.UserAddService;

@Repository
public class UserRepository {

	@Autowired
	private SqlSession sqlSession;
	private final String namespace = "mapper.user.userMapper";
	private String statement;
	
	@Autowired
	UserAddService userAddService;
	
	
	//아이디 중복 확인
	public int compareId(String id) {
		System.out.println("아이디 체크 리포지토리"+id);
		
		statement = namespace + ".compareId";
		return sqlSession.selectOne(statement, id);
	}
	
	public int insert(UserInfoDto dto) {
		
		
		int res =0;
		statement = namespace +".insertUser";
		System.out.println("dto:"+dto);
		try {
			res=sqlSession.insert(statement, dto);
		} catch (Exception e) {
			System.out.println("[error]: insert");
			e.printStackTrace();
		}
		
		
		return res;
	}

	
	
	
}
