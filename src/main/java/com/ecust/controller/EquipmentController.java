package com.ecust.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.ecust.dto.CompanyForm;
import com.ecust.permision.AdminPermission;
import com.ecust.permission.AdmintPermission;
import com.ecust.pojo.Company;
import com.ecust.utils.DataTrans;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		int applied = Integer.parseInt(param.get("applied"));
		Map<String,Object> map  = equipmentService.queryAllEquipment(pageNo,pageSize,name,applied);
		return map;
	}
	//查询所有消息页面
	@RequestMapping(value="/pageType",method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String pageType(HttpServletRequest request){

		return "equipment/listall";
	}
	
	//根据设备ID查询设备
	@ResponseBody
	@RequestMapping(value="/queryEquipmentById",method = RequestMethod.GET,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Map<String,Object> queryEquipmentById(@RequestParam("equipmentId")int equipmentId){
		Map<String,Object> map = equipmentService.queryEquipmentById(equipmentId);
		return map;
	}
	
	//更新设备
	@AdminPermission
	@ResponseBody
	@RequestMapping(value="/updateEquipment",method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public boolean updateEquipment(@RequestBody Company company){
		Boolean bool = equipmentService.updateEquipment(company);
		return bool;
	}
	
	//添加设备
	@AdminPermission
	@ResponseBody
	@RequestMapping(value="/createEquipment",method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public boolean createEquipment(@RequestBody CompanyForm companyForm){
		Company company = DataTrans.toCompany(companyForm);
		Boolean bool = equipmentService.createEquipment(company);
		return true;
	}
	
	//删除设备
	@AdminPermission
	@ResponseBody
	@RequestMapping(value="/deleteEquipment/{equipmentId}",method = RequestMethod.GET,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public boolean deleteEquipment(@PathVariable("equipmentId") String equipmentId){
		Boolean bool = equipmentService.deleteEquipment(equipmentId);
		return bool;
	}

	//设置为已投状态
	@AdminPermission
	@ResponseBody
	@RequestMapping(value="/apply/{equipmentId}",method = RequestMethod.GET,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public boolean apply(@PathVariable("equipmentId") String equipmentId){
		Boolean bool = equipmentService.apply(equipmentId);
		return bool;
	}
	

	
	//查询所有角色
	@ResponseBody
	@RequestMapping(value="/queryAllType",method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Map<String,Object> queryAllType(){
		Map<String,Object> map  = equipmentService.queryAllType();
		return map;
	}
	
	//添加设备类型
	@ResponseBody
	@RequestMapping(value="/createType",method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public boolean createType(@RequestBody Map<String,String> param){
		String createId = param.get("createId");
		String TypeName = param.get("typeName");
		boolean bool = equipmentService.createType(createId,TypeName);
		return bool;
	}
	
	//删除设备设备类型
	@ResponseBody
	@RequestMapping(value="/deleteType/{typeId}",method = RequestMethod.GET,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public boolean deleteType(@PathVariable("typeId") String typeId){
		Boolean bool = equipmentService.deleteType(typeId);
		return bool;
	}
	
	//查询设备状态图
	@RequestMapping(value="/pageStateChart",method = RequestMethod.GET)
	public String pageStateChart(){
		return "equipment/lisunapplied";
	}
}
