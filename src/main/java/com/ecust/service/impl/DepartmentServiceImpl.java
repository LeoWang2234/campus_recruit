package com.ecust.service.impl;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecust.dao.DepartmentDao;
import com.ecust.pojo.Department;
import com.ecust.pojo.Page;
import com.ecust.service.DepartmentService;
import com.ecust.utils.PageUtils;

@Service("departmentService")
public class DepartmentServiceImpl implements DepartmentService {
	@Autowired
	private DepartmentDao departmentDao;

	public Map<String, Object> queryAllDepartment() {
		
		List<Map<String, Object>> map = departmentDao.queryAllDepartment();
		//日期格式转换
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(int i = 0;i<map.size();i++){
			Timestamp ctreatTime = (Timestamp) map.get(i).get("createTime");
			String str = df.format(ctreatTime);
			map.get(i).put("createTime", str);
		}
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("data", map);
		return result;
	}

	@Override
	public boolean createDepartment(Department department) {
		departmentDao.createDepartment(department);
		return true;
	}

	@Override
	public Boolean deleteDepartment(String depId) {
		
		departmentDao.deleteDepartment(depId);
		return true;
	}
}
