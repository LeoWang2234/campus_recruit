package com.ecust.service;

import java.util.Map;

import com.ecust.pojo.Company;
import com.ecust.pojo.Equipment;



public interface EquipmentService {

	Map<String, Object> queryAllEquipment(int pageNo,int pageSize,String name);

	Map<String, Object> queryEquipmentById(int equipmentId);

	Boolean updateEquipment(Equipment equipment);

	Boolean createEquipment(Company company);

	Boolean deleteEquipment(String equipmentId);

	Map<String, Object> queryAllType();

	boolean createType(String createId, String typeName);

	Boolean deleteType(String typeId);

}
