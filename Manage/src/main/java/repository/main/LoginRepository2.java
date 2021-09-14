package repository.main;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DTO.ManufactureDTO;

@Repository
public class LoginRepository2 {
	@Autowired
	private SqlSession sqlSession;
	private final String namespace = "mapper.main.loginMapper"; // 사용하는 mapper 파일
	private String statement;
	
	/**
	 * 아이디 중복 검사
	 * @param param
	 * @return
	 */
	public int checkId(Map<String, Object> param) {
		statement = namespace + ".checkId";
		return sqlSession.selectOne(statement, param);
	}

	public int insertUsers(Map<String, Object> param) {
		statement = namespace + ".insertUsers";
		return sqlSession.update(statement, param);
	}

	public int existCode(Map<String, Object> param) {
		statement = namespace + ".existCode";
		return sqlSession.selectOne(statement, param);
	}

	public List<Map<String, Object>> getUser(Map<String, Object> param) {
		statement = namespace + ".getUser";
		return sqlSession.selectList(statement, param);
	}
	
}
