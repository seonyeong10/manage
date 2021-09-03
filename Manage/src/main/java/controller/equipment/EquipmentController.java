package controller.equipment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import command.EquipmentCommand;
import service.equipment.AddEquipmentService;
import service.equipment.EquipmentListService;

@Controller
@RequestMapping("equipment")
public class EquipmentController {
	@Autowired
	AddEquipmentService addEquipmentService;
	@Autowired
	EquipmentListService equipmentListService;
	
	/**
	 * 장비리스트 페이지 오픈
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String openEquipmentList() {
		return "equipment/equipmentList";
	}
	
	/**
	 * 장비 등록 페이지 오픈
	 */
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String openEquipmentForm(Model model) {
		equipmentListService.selectEquipments(model);
		return "equipment/equipmentForm";
	}
	
	/**
	 * 장비 등록
	 * @param command
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "insertEquipment", method = RequestMethod.POST)
	public String insertEquipment(
			EquipmentCommand command,
			Model model
			) {
		addEquipmentService.insertEquipment(command, model);
		return "redirect:/equipment";
	}
}
