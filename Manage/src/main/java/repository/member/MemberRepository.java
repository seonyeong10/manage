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
	public Integer insertMember(MemberDTO memberDTO) {
		statement = namespace + ".memberInsert";	
		return sqlSession.update(statement, memberDTO);
	}
	
	// 0210
	public Integer joinOkUpdate(MemberDTO memberDTO) {
		statement = namespace + ".joinOkUpdate";
		// mybatis도 preparedstatement 구문 내부적으로 사용하고 있음
		return sqlSession.update(statement, memberDTO);
	}

	public MemberDTO selectByMember(MemberDTO memberDTO) {
		statement = namespace + ".selectMember";
		// mybatis도 preparedstatement 구문 내부적으로 사용하고 있음
		return sqlSession.selectOne(statement, memberDTO);
	}
} 
