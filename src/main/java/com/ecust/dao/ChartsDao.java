package com.ecust.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ChartsDao {

	List<Map<String, Object>> queryTypeNames();

	List<Map<String, Object>> queryTypeValues();

	List<Map<String, Object>> queryState();

	List<Map<String, Object>> queryRepairChart(@Param("time")String time);

}
