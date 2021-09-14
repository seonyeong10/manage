package repository.member;

import java.util.List;
import java.util.Map;

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
	
	/**
	 * 사원 정보 입력
	 * @param dto
	 * @return
	 */
	public Integer insertMember(MemberDTO dto) {
		statement = namespace + ".insertMemeber";	
		return sqlSession.update(statement, dto);
	}

	/**
	 * 사번 중복 검사
	 * @param param
	 * @return
	 */
	public int getEmpCnt(Map<String, Object> param) {
		statement = namespace + ".getEmpCnt";	
		return sqlSession.selectOne(statement, param);
	}

	/**
	 * 사원 조회
	 * @param param
	 * @return
	 */
	public List<Map<String, Object>> getEmployeeList(Map<String, Object> param) {
		statement = namespace + ".getEmployeeList";	
		return sqlSession.selectList(statement, param);
	}

	/**
	 * 사원 정보 수정
	 * @param param
	 */
	public int updateEmployee(Map<String, Object> param) {
		statement = namespace + ".updateEmployee";	
		return sqlSession.update(statement, param);
	}

	public int delEmployee(Map<String, Object> param) {
		statement = namespace + ".delEmployee";	
		return sqlSession.delete(statement, param);
	}

	/**
	 * 부서 목록 조회
	 * @param param
	 * @return
	 */
	public List<Map<String, Object>> getDeptList(Map<String, Object> param) {
		statement = namespace + ".getDeptList";	
		return sqlSession.selectList(statement, param);
	}

	/**
	 * 사원 상세정보 - 장비조회
	 */
	public List<Map<String, Object>> getDeviceList(Map<String, Object> param) {
		statement = namespace + ".getDeviceList";	
		return sqlSession.selectList(statement, param);
	}
} 
