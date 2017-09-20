package com.ecust.service.impl;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecust.dao.UserDao;
import com.ecust.pojo.Page;
import com.ecust.pojo.User;
import com.ecust.service.UserService;
import com.ecust.utils.PageUtils;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;

	public User login(User user){
		return userDao.login(user);
	}

	@Override
	public int countUserNum() {
		int userNums = userDao.countUserNum();
		return userNums;
	}

	@Override
	public User signUp(User user) {
		return userDao.signUp(user);
	}

	@Override
	public Map<String, Object> queryAllUser(Integer pageNo, Integer pageSize) {
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
		List<Map<String, Object>> map = userDao.queryAllUser();
		//日期格式转换
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(int i = 0;i<map.size();i++){
			Timestamp ctreatTime = (Timestamp) map.get(i).get("createTime");
			String str = df.format(ctreatTime);
			map.get(i).put("createTime", str);
		}
		Map<String,Object> result = PageUtils.proccess(map);
		return result;	
	}
	@Override
	public Map<String, Object> queryAllRole() {
		List<Map<String, Object>> map = userDao.queryAllRole();
		//日期格式转换
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(int i = 0;i<map.size();i++){
			Timestamp ctreatTime = (Timestamp) map.get(i).get("createTime");
			String str = df.format(ctreatTime);
			map.get(i).put("createTime", str);
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("data", map);
		return result;
	}
	@Override
	public Boolean createRole(String createId, String roleName, String remark) {
		
		userDao.createRole(createId,roleName,remark);
		return true;
	}
	@Override
	public Boolean deleteRole(String id) {
		
		userDao.deleteRole(id);
		return true;
	}
	@Override
	public boolean createUser(User user) {
		
		userDao.createUser(user);
		return true;
	}
	@Override
	public Map<String, Object> queryUserById(int id) {
		
		Map<String, Object> map = userDao.queryUserById(id);
		return map;
	}

	@Override
	public User queryUserByName(String userName) {
		User user = userDao.queryUserByName(userName);
		return user;
	}

	@Override
	public Boolean updateUser(User user) {
		
		userDao.updateUser(user);
		return true;
	}


	@Override
	public Boolean updateUserForReNewPwd(User user) {
		userDao.updateUserForReNewPwd(user);
		return true;
	}

	@Override
	public Boolean deleteUser(String id) {
		
		userDao.deleteUser(id);
		return true;
	}

}
