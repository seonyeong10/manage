package service.manufacture;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import repository.manufacture.ManufactureRepository;

@Service
public class ManufactureListService {
	@Autowired
	ManufactureRepository repository;
	/**
	 * 제조사 목록 조회
	 * @param model
	 */
	public void getManufactureList(Model model) {
		Map<String, Object> param = new HashMap<String, Object>();
		List<Map<String, Object>> manufactureList = repository.selectManufactureList(param);
		model.addAttribute("manuList", manufactureList);
	}

}
