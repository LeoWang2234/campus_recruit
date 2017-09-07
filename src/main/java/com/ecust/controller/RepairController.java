package com.ecust.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecust.pojo.Repair;
import com.ecust.service.RepairService;

@Controller
@RequestMapping("repair")
public class RepairController {
	@Autowired
	private RepairService repairService;
	
	//切换到list.jsp
	@RequestMapping(value="/pageRepair",method = RequestMethod.GET)
	public String pageDepartment(HttpServletRequest request){
		return "repair/addCom";
	}
	
	//修理设备
	@ResponseBody
	@RequestMapping(value="/repairEquipment",method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Boolean repairEquipment(@RequestBody Repair repair){
		boolean bool = repairService.repairEquipment(repair);
		return bool;
	}

	//查询所有维修记录
	@ResponseBody
	@RequestMapping(value="/queryAllRepairHistory",method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	//page传入页码
	public Map<String,Object> queryAllRepairHistory(@RequestParam("pageNo")Integer pageNo,@RequestParam("pageSize")Integer pageSize){
		Map<String,Object> map  = repairService.queryAllRepairHistory(pageNo,pageSize);
		return map;
	}

	//切换到repairHistory.jsp
	@RequestMapping(value="/pageRepairHistory",method = RequestMethod.GET)
	public String pageRepairHistory(HttpServletRequest request){
		return "repair/repairHistory";
	}

	@RequestMapping(value="/copyClipBoard",method = RequestMethod.GET)
	public String copyClipBoard(HttpServletRequest request){
		return "repair/copyClipBoard";
	}

	//切换到repairChart.jsp
	@RequestMapping(value="/pageRepairChart",method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String pageRepairChart(HttpServletRequest request){

		return "repair/repairChart";
	}
}
