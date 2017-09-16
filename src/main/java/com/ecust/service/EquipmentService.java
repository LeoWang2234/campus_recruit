package com.ecust.service;

import java.util.List;
import java.util.Map;

import com.ecust.pojo.Company;
import com.ecust.pojo.Equipment;
import org.apache.ibatis.annotations.Param;


public interface EquipmentService {

    Map<String, Object> queryAllEquipment(int pageNo, int pageSize, String name, int applied, int userId);

    Map<String, Object> queryAllEquipmentOfMe(int pageNo, int pageSize, String name, int applied, int userId);

    List<Map<String, Object>> queryAllEquipmentForValidation();

    Map<String, Object> queryEquipmentById(int equipmentId);

    Map<String, Object> queryEquipmentByName(String equipmentName);

    Boolean updateEquipment(Company company);

    Boolean createEquipment(Company company);

    Boolean notInterested(int equipmentId, int userId);

    Boolean deleteEquipment(String equipmentId);

    Boolean apply(String equipmentId, int userId);

    Map<String, Object> queryAllType();

    boolean createType(String createId, String typeName);

    Boolean deleteType(String typeId);

    Boolean updateStatus(int id, int status);

    public Boolean addToMe(int equipmentId, int userId);

    public int maxId();

}
