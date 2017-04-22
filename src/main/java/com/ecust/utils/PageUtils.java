package com.ecust.utils;

import com.ecust.pojo.Page;
import com.github.pagehelper.PageHelper;

/**
 * 分页工具类
 *
 */
public class PageUtils {
	public static void page(Page page) {
		PageHelper.startPage(page.getPageNo(), page.getPageSize());
	}

}
