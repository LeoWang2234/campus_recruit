package com.ecust.utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ecust.pojo.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 分页工具类
 *
 */
public class PageUtils {
	//分页
	public static void page(Page page) {
		PageHelper.startPage(page.getPageNo(), page.getPageSize());
	}
	//分页结果封装
	public static Map<String, Object> proccess(List<Map<String, Object>> queryData) {
		Map<String,Object> map = new HashMap<String,Object>();
		PageInfo pageInfo = new PageInfo(queryData);
		
		Page outputPage = new Page();
		//页码
		outputPage.setPageNo(pageInfo.getPageNum());
		//每页显示条数
		outputPage.setPageSize(pageInfo.getPageSize());
		//总条数
		outputPage.setTotalElements((int)pageInfo.getTotal());
		//总页数
		outputPage.setTotalPages(pageInfo.getPages());
		//当前页有多少条数据
		outputPage.setNumberElements(pageInfo.getSize());
		
		//输出分页
		map.put("page", outputPage);
		//查询的数据
		map.put("data", queryData);
		return map;
	}

}
