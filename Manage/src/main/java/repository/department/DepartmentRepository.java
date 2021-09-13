package repository.department;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DepartmentRepository {
	@Autowired
	private SqlSession sqlSession;
	private final String namespace = "mapper.department.departmentMapper";	// 사용하는 mapper 파일
	private String statement;
	
	/**
	 * 부서 등록
	 * @param param
	 */
	public int insertDept(Map<String, Object> param) {
		statement = namespace + ".insertDept";	
		return sqlSession.update(statement, param);
	}

	/**
	 * 부서 목록 조회
	 */
	public List<Map<String, Object>> getDeptList(Map<String, Object> param) {
		statement = namespace + ".getDeptList";	
		return sqlSession.selectList(statement, param);
	}

	/**
	 * 부서 정보 수정
	 */
	public int updateDept(Map<String, Object> param) {
		statement = namespace + ".updateDept";	
		return sqlSession.update(statement, param);
	}

	/**
	 * 부서 삭제
	 */
	public int deleteDept(Map<String, Object> param) {
		statement = namespace + ".deleteDept";	
		return sqlSession.delete(statement, param);
	}
}
