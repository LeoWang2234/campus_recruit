package com.ecust.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ecust.pojo.Equipment;

public interface EquipmentDao {

	List<Map<String, Object>> queryAllEquipment(@Param("name")String name);

	Map<String, Object> queryEquipmentById(@Param("equipmentId")int equipmentId);

	void updateEquipment(Equipment equipment);

	void createEquipment(Equipment equipment);

	void deleteEquipment(@Param("equipmentId") String equipmentId);

}
