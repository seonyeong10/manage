package repository.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DTO.MemberDTO;

@Repository
public class MemberRepository {
	// mybatis 코드
	@Autowired
	private SqlSession sqlSession;
	private final String namespace = "mapper.member.memberMapper";	// 사용하는 mapper 파일
	private String statement;
	
	public Integer insertMember(MemberDTO dto) {
		statement = namespace + ".insertMemeber";	
		return sqlSession.update(statement, dto);
	}
} 
