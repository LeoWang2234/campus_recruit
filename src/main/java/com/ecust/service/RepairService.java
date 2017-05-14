package com.ecust.service;

import java.util.Map;

import com.ecust.pojo.Repair;

public interface RepairService {

	boolean repairEquipment(Repair repair);

	Map<String, Object> queryAllRepairHistory(Integer pageNo, Integer pageSize);

}
