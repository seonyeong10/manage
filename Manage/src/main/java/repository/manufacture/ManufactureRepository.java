package repository.manufacture;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import model.DTO.ManufactureDTO;

public class ManufactureRepository {
	// mybatis 코드
	@Autowired
	private SqlSession sqlSession;
	private final String namespace = "mapper.manufacture.manufactureMapper"; // 사용하는 mapper 파일
	private String statement;
	
	public int insertManufacture(ManufactureDTO dto) {
		statement = namespace + ".insertManufacture";
		return sqlSession.update(statement, dto);
	}

	public List<Map<String, Object>> selectManufactureList(Map<String, Object> param) {
		statement = namespace + ".selectManufactureList";
		return sqlSession.selectList(statement, param);
	}

	public List<Map<String, Object>> getMaCode(Map<String, Object> param) {
		statement = namespace + ".getMaCode";
		return sqlSession.selectList(statement, param);
	}

	public int modifyManu(Map<String, Object> param) {
		statement = namespace + ".modifyManu";
		return sqlSession.update(statement, param);
	}

	public int deleteManu(Map<String, Object> param) {
		statement = namespace + ".deleteManu";
		return sqlSession.delete(statement, param);
	}

//	public Integer insertMember(MemberDTO dto) {
//		statement = namespace + ".insertMemeber";
//		return sqlSession.update(statement, dto);
//	}
}
