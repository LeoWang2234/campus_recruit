package com.ecust.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ecust.pojo.User;

public interface UserDao {

	public User login(User user);

	public List<Map<String, Object>> queryAllUser();

	public List<Map<String, Object>> queryAllRole();

	public void createRole(@Param("createId")String createId, @Param("roleName")String roleName, @Param("remark")String remark);

	public void deleteRole(@Param("id")String id);

	public void createUser(User user);

	public Map<String, Object> queryUserById(@Param("id")int id);

	public void updateUser(User user);

	public void deleteUser(@Param("id")String id);

}
