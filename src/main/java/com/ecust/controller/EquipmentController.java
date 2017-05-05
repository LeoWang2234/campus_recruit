package com.ecust.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecust.pojo.Equipment;
import com.ecust.service.EquipmentService;

@Controller
@RequestMapping("/equipment")
public class EquipmentController {
	@Autowired
	private EquipmentService equipmentService;
	
	//切换到list.jsp
	@RequestMapping(value="/pageEquipment",method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String pageDepartment(HttpServletRequest request){
	
		return "equipment/list";
	}
	
	//查询所有设备
	@ResponseBody
	@RequestMapping(value="/queryAllEquipment",method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	//page传入页码
	public Map<String,Object> queryAllDepartment(@RequestBody Map<String, String> param){
		int pageSize = Integer.parseInt(param.get("pageSize"));
		String name = param.get("name");
		int pageNo = Integer.parseInt(param.get("pageNo"));
		System.out.println(pageSize+" "+name);
		Map<String,Object> map  = equipmentService.queryAllEquipment(pageNo,pageSize,name);
		return map;
	}
	
	//根据设备ID查询设备
	@ResponseBody
	@RequestMapping(value="/queryEquipmentById",method = RequestMethod.GET,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Map<String,Object> queryEquipmentById(@RequestParam("equipmentId")int equipmentId){
		Map<String,Object> map = equipmentService.queryEquipmentById(equipmentId);
		return map;
	}
	
	//更新设备
	@ResponseBody
	@RequestMapping(value="/updateEquipment",method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public boolean updateEquipment(@RequestBody Equipment equipment){
		Boolean bool = equipmentService.updateEquipment(equipment);
		return bool;
	}
	
	//添加设备
	@ResponseBody
	@RequestMapping(value="/createEquipment",method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public boolean createEquipment(@RequestBody Equipment equipment){
		Boolean bool = equipmentService.createEquipment(equipment);
		return bool;
	}
	
	//删除设备
	@ResponseBody
	@RequestMapping(value="/deleteEquipment/{equipmentId}",method = RequestMethod.GET,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public boolean deleteEquipment(@PathVariable("equipmentId") String equipmentId){
		Boolean bool = equipmentService.deleteEquipment(equipmentId);
		return bool;
	}
	
}
