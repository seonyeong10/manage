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

	/**
	 * 장비등록 - 핸드폰
	 */
	public int insertPhone(Map<String, Object> param) {
		statement = namespace + ".insertPhone";
		return sqlSession.update(statement, param);
	}

	/**
	 * 목록 조회
	 */
	public List<Map<String, Object>> selectEquipments(Map<String, Object> param) {
		statement = namespace + ".selectEquipments";
		return sqlSession.selectList(statement, param);
	}

	/**
	 * 장비 상세 정보
	 */
	public List<Map<String, Object>> getInfo(Map<String, Object> param) {
		statement = namespace + ".getInfo";
		return sqlSession.selectList(statement, param);
	}

	/**
	 * 장비 정보 수정
	 */
//	public int updatePhone(Map<String, Object> param) {
//		statement = namespace + ".updatePhone";
//		return sqlSession.update(statement, param);
//	}
//
//	public int updateMonitor(Map<String, Object> param) {
//		statement = namespace + ".updateMonitor";
//		return sqlSession.update(statement, param);
//	}
//
//	public int updatePC(Map<String, Object> param) {
//		statement = namespace + ".updatePC";
//		return sqlSession.update(statement, param);
//	}

	/**
	 * 장비 삭제
	 */
	public int delPhone(Map<String, Object> param) {
		statement = namespace + ".delPhone";
		return sqlSession.update(statement, param);
	}

	public int delMonitor(Map<String, Object> param) {
		statement = namespace + ".delMonitor";
		return sqlSession.update(statement, param);
	}

	public int delPC(Map<String, Object> param) {
		statement = namespace + ".delPC";
		return sqlSession.update(statement, param);
	}

	/**
	 * 성능 비교page 사원 목록 조회
	 * @param param 
	 * @return
	 */
	public List<Map<String, Object>> selectEmps(Map<String, Object> param) {
		statement = namespace + ".selectEmps";
		return sqlSession.selectList(statement, param);
	}

	public int insertMonitor(Map<String, Object> param) {
		statement = namespace + ".insertMonitor";
		return sqlSession.update(statement, param);
	}

	public int insertPC(Map<String, Object> param) {
		statement = namespace + ".insertPC";
		return sqlSession.update(statement, param);
	}

	public List<Map<String, Object>> selectManufactures(Map<String, Object> param) {
		statement = namespace + ".selectManufactures";
		return sqlSession.selectList(statement, param);
	}

	public List<Map<String, Object>> getEquipmentList(Map<String, Object> param) {
		statement = namespace + ".getEquipmentList";
		return sqlSession.selectList(statement, param);
	}

	/**
	 *  장비 목록 조회
	 */
	public List<Map<String, Object>> getDeviceList(Map<String, Object> param) {
		statement = namespace + ".getDeviceList";
		return sqlSession.selectList(statement, param);
	}

	/**
	 * 장비 소유자 등록
	 * @param param
	 */
	public int insertOwn(Map<String, Object> param) {
		statement = namespace + ".insertOwn";
		return sqlSession.update(statement, param);
	}
	
	/**
	 * 장비 소유자 변경
	 * @param param
	 */
	public int updateOwner(Map<String, Object> param) {
		statement = namespace + ".updateOwner";
		return sqlSession.update(statement, param);
	}

	public int deleteOwner(Map<String, Object> param) {
		statement = namespace + ".deleteOwner";
		return sqlSession.delete(statement, param);
	}

}
