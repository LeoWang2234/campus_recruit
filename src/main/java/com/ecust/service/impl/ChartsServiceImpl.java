package com.ecust.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Lang;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecust.dao.ChartsDao;
import com.ecust.service.ChartsService;
@Service("chartsService")
public class ChartsServiceImpl implements ChartsService {
	@Autowired
	private ChartsDao chartsDao;

	@Override
	public Map<String, Object> queryTypeChart() {
		List<Map<String, Object>> names = chartsDao.queryTypeNames();
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> values = chartsDao.queryTypeValues();
		map.put("names", names);
		map.put("values", values);
		return map;
	}

	@Override
	public Map<String, Object> queryStateChart() {
		List<Map<String, Object>> outside = chartsDao.queryState();
		Long valueRepair = 0L;
		List<Map<String, Object>> inside = new ArrayList<Map<String, Object>>();
		for(int i = 0;i<outside.size();i++){
			Integer name = (Integer) outside.get(i).get("name");
			Long value = (Long) outside.get(i).get("value");
			if(name == 0){
				outside.get(i).put("name", "正常");
				Map<String,Object> in = new<String,Object>HashMap();
				in.put("name", "正常");
				in.put("value", value);
				inside.add(in);
			}else{
				if(name == 1){
					outside.get(i).put("name", "正在维修");
				}else if(name == 2){
					outside.get(i).put("name", "设备报废");
				}else if(name == 3){
					outside.get(i).put("name", "等待维修");
				}
				valueRepair += value;
			}
		}
		Map<String,Object> in = new HashMap<String,Object>();
		in.put("name", "维护");
		in.put("value", valueRepair);
		inside.add(in);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("outside", outside);
		map.put("inside",inside);
		return map;
	}

	@Override
	public Map<String, Object> queryRepairChart(String time) {
		//time时，查询本周数据
		List<Map<String, Object>> result = chartsDao.queryRepairChart(time);
		Map<String, Object> map = new HashMap<String,Object>();
		
		
		List<String> name = new ArrayList<String>();
		List<String> value = new ArrayList<String>();
		Calendar cal = Calendar.getInstance();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		int index = 0;
		//查询本周
		if(time.equals("1")){
			cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
			if(result != null ){
				for(int i = 0;i<7;i++){
					String date = sdf.format(cal.getTime());
					if(index<result.size() && date.equals(result.get(index).get("createTime"))){
						value.add(result.get(index).get("value").toString());
						index++;
					}else{
						value.add("0");
					}
					cal.add(Calendar.DAY_OF_MONTH, 1);
				}
			}
			name.add("星期日");
			name.add("星期一");
			name.add("星期二");
			name.add("星期三");
			name.add("星期四");
			name.add("星期五");
			name.add("星期六");
		}
		//查询本月
		if(time.equals("2")){
			cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
			String date = sdf.format(cal.getTime());
			String lastDay = date.substring(date.length()-2, date.length());
			String month = date.substring(5,7);
			
			cal.set(Calendar.DAY_OF_MONTH, 1);
			//当月横坐标
			for(int i = 1;i<=Integer.valueOf(lastDay);i++){
				String firstDate = sdf.format(cal.getTime());
				if(i<10){
					name.add(month+"-0"+i);
				}else{
					name.add(month+"-"+i);
				}
				if(index<result.size() && firstDate.equals(result.get(index).get("createTime"))){
					value.add(result.get(index).get("value").toString());
					index++;
				}else{
					value.add("0");
				}
				cal.add(Calendar.DAY_OF_MONTH, 1);
			}
		}
		
		//查询本年
		if(time.equals("3")){
			String year = sdf.format(cal.getTime()).substring(0,5);
			for(int i = 1;i <= 12;i++){
				if(i<10){
					name.add(year+"0"+i);
				}else{
					name.add(year+i);
				}
				if(index<result.size() && name.get(i-1).equals(result.get(index).get("createTime"))){
					value.add(result.get(index).get("value").toString());
					index++;
				}else{
					value.add("0");
				}
			}
		}
		map.put("name", name);
		map.put("value", value);
		return map;
	}
	
	
	
}
