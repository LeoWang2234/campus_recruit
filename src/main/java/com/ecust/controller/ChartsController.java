package com.ecust.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecust.service.ChartsService;
//画图表类
@Controller
@RequestMapping("charts")
public class ChartsController {
	@Autowired
	private ChartsService chartsService;
	
	//查询设备类型图数据
	@ResponseBody
	@RequestMapping(value="/queryTypeChart",method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Map<String,Object> queryTypeChart(){
		Map<String,Object> map  = chartsService.queryTypeChart();
		return map;
	}
	
	//查询设备类型图数据
	@ResponseBody
	@RequestMapping(value="/queryStateChart",method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Map<String,Object> queryStateChart(){
		Map<String,Object> map  = chartsService.queryStateChart();
		return map;
	}
	
	//查询维护历史数据
	@ResponseBody
	@RequestMapping(value="/queryRepairChart",method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Map<String,Object> queryRepairChart(@RequestParam("time")String time){
		Map<String,Object> map  = chartsService.queryRepairChart(time);
		return map;
	}
	
}
