package com.ecust.service;

import java.util.List;
import java.util.Map;

import com.ecust.pojo.Department;

public interface DepartmentService {

	Map<String,Object> queryAllDepartment();

	boolean createDepartment(Department department);

	Boolean deleteDepartment(String depId);

}
