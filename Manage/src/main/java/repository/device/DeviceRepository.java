package repository.device;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class DeviceRepository {
	@Autowired
	private SqlSession sqlSession;
	private final String namespace = "mapper.device.deviceMapper"; // 사용하는 mapper 파일
	private String statement;
	
	/**
	 * pc등록
	 */
	public int insertPC(Map<String, Object> param) {
		statement = namespace + ".insertPC";
		return sqlSession.update(statement, param);
	}
	
	/**
	 * phone 등록
	 */
	public int insertPhone(Map<String, Object> param) {
		statement = namespace + ".insertPhone";
		return sqlSession.update(statement, param);
	}
	/**
	 * monitor 등록
	 */
	public int insertMonitor(Map<String, Object> param) {
		statement = namespace + ".insertMonitor";
		return sqlSession.update(statement, param);
	}

	public List<Map<String, Object>> getDeviceList(Map<String, Object> param) {
		statement = namespace + ".getDeviceList";
		return sqlSession.selectList(statement, param);
	}

	public int updatePC(Map<String, Object> param) {
		statement = namespace + ".updatePC";
		return sqlSession.update(statement, param);
	}
	
	public int updatePhone(Map<String, Object> param) {
		statement = namespace + ".updatePhone";
		return sqlSession.update(statement, param);
	}
	
	public int updateMonitor(Map<String, Object> param) {
		statement = namespace + ".updateMonitor";
		return sqlSession.update(statement, param);
	}

	public int delPC(Map<String, Object> param) {
		statement = namespace + ".delPC";
		return sqlSession.delete(statement, param);
	}
	
	public int delPhone(Map<String, Object> param) {
		statement = namespace + ".delPhone";
		return sqlSession.delete(statement, param);
	}
	public int delMonitor(Map<String, Object> param) {
		statement = namespace + ".delMonitor";
		return sqlSession.delete(statement, param);
	}
}
