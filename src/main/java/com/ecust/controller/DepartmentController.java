package com.ecust.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecust.pojo.Department;
import com.ecust.service.DepartmentService;

@Controller
@RequestMapping("/department")
public class DepartmentController {
	@Autowired
	private DepartmentService departmentService;
	
	//切换到list.jsp
	@RequestMapping(value="/pageDepartment",method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	private String pageDepartment(HttpServletRequest request){
	
		return "department/list";
	}
	//查询所有部门
	@ResponseBody
	@RequestMapping(value="/queryAllDepartment",method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	//page传入页码
	private Map<String,Object> queryAllDepartment(@RequestParam(value="page",required=false)String page,HttpServletRequest request){
		if(StringUtils.isBlank(page)){
			page = "1";
		}
		Map<String,Object> map  = departmentService.queryAllDepartment();
		return map;
	}
	



	
}
