package com.ecust.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ecust.pojo.Repair;

public interface RepairDao {

	void repairEquipment(Repair repair);

	void repairHistory(Repair repair);

	List<Map<String, Object>> queryAllRepairHistory();

	void updateHistory(Repair repair);

}
