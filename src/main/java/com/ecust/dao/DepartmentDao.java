package com.ecust.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ecust.pojo.Department;

public interface DepartmentDao {

	List<Map<String,Object>> queryAllDepartment();

	void createDepartment(Department department);

	void deleteDepartment(@Param("depId")String depId);

}
