package com.ecust.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecust.dao.DepartmentDao;
import com.ecust.pojo.Page;
import com.ecust.service.DepartmentService;
import com.ecust.utils.PageUtils;

@Service("departmentService")
public class DepartmentServiceImpl implements DepartmentService {
	@Autowired
	private DepartmentDao departmentDao;

	public Map<String, Object> queryAllDepartment(String pageNumber) {
		// 分页，并判断分页参数是否存在
		Page page = new Page();
		if (page.getPageNo() == null || page.getPageSize() == null) {
			page.setPageNo(Integer.valueOf(pageNumber));
			page.setPageSize(3);
		}
		PageUtils.page(page);
		List<Map<String, Object>> map = departmentDao.queryAllDepartment();
		Map<String,Object> result = PageUtils.proccess(map);
		return result;
	}
}
