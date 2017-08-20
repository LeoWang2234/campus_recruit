package com.ecust.dao;

import java.util.List;
import java.util.Map;

import com.ecust.pojo.Company;
import org.apache.ibatis.annotations.Param;

import com.ecust.pojo.Equipment;

public interface EquipmentDao {

	List<Map<String, Object>> queryAllEquipment(@Param("name") String name, @Param("applied") int applied,@Param("userId") int userId);

	List<Map<String, Object>> queryAllEquipmentForValidation();

	Map<String, Object> queryEquipmentById(@Param("equipmentId")int equipmentId);

	void updateEquipment(Company company);

	void createEquipment(Company coompany);

	void deleteEquipment(@Param("equipmentId") String equipmentId);

	void apply(@Param("equipmentId") String equipmentId,@Param("userId")int userId);

	List<Map<String, Object>> queryAllType();

	void createType(@Param("createId")String createId, @Param("typeName")String typeName);

	void deleteType(@Param("typeId")String typeId);

	void updateStatus(@Param("id") int id,@Param("status") int status);

	void addToMe(@Param("equipmentId")int equipmentId,@Param("userId")int userId);


}
