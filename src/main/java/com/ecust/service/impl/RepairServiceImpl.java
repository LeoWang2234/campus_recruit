package com.ecust.service.impl;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecust.dao.RepairDao;
import com.ecust.pojo.Page;
import com.ecust.pojo.Repair;
import com.ecust.service.RepairService;
import com.ecust.utils.PageUtils;
@Service("repairService")
public class RepairServiceImpl implements RepairService {
	@Autowired
	private RepairDao repairDao;
	
	public boolean repairEquipment(Repair repair) {
		
		
		
		//报修设备，repair表中添加维护人
		if(repair.getState() == 3){
			repairDao.repairHistory(repair);
		}else{
			repairDao.updateHistory(repair);
		}
		Integer repairId = repair.getRepairId();
		System.out.println(repairId);
		repairDao.repairEquipment(repair);
		return true;
	}

	@Override
	public Map<String, Object> queryAllRepairHistory(Integer pageNo,
			Integer pageSize) {
		// 分页，并判断分页参数是否存在
		Page page = new Page();
		if (page.getPageNo() == null && page.getPageSize() == null) {
			page.setPageNo(pageNo);
			page.setPageSize(pageSize);
		}else{
			page.setPageNo(1);
			page.setPageSize(10);
		}
		PageUtils.page(page);
		List<Map<String, Object>> map = repairDao.queryAllRepairHistory();
		//日期格式转换
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(int i = 0;i<map.size();i++){
			Timestamp createTime = (Timestamp) map.get(i).get("createTime");
			Timestamp repairTime = (Timestamp) map.get(i).get("repairTime");
			String create = df.format(createTime);
			map.get(i).put("createTime", create);
			if(repairTime != null){
				String repair = df.format(repairTime);
				map.get(i).put("repairTime", repair);
			}else{
				map.get(i).put("repairTime", "正在维护");
				map.get(i).put("repairMan", "正在维护");
			}
			
		}
		Map<String,Object> result = PageUtils.proccess(map);
		return result;	
	}

}
