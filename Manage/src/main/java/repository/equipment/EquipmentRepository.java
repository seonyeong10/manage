package repository.equipment;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.DTO.ManufactureDTO;

@Repository
public class EquipmentRepository {
	@Autowired
	private SqlSession sqlSession;
	private final String namespace = "mapper.equipment.equipmentMapper"; // 사용하는 mapper 파일
	private String statement;

	public int insertPhone(Map<String, Object> param) {
		statement = namespace + ".insertPhone";
		return sqlSession.update(statement, param);
	}

	public List<Map<String, Object>> selectEquipments(Map<String, Object> param) {
		statement = namespace + ".selectEquipments";
		return sqlSession.selectList(statement, param);
	}
}
