package com.ecust.service;

import java.util.Map;

import com.ecust.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface UserService {
	public User login(User user);

	public Map<String, Object> queryAllUser(Integer pageNo, Integer pageSize);

	public Map<String, Object> queryAllRole();

	public Boolean createRole(String createId, String roleName, String remark);

	public Boolean deleteRole(String id);

	public boolean createUser(User user);

	public Map<String, Object> queryUserById(int id);

	public User queryUserByName(String  userName);

	public Boolean updateUser(User user);

	public Boolean updateUserForReNewPwd(User user);

	public Boolean deleteUser(String id);

	public int countUserNum();

	User signUp(User user);
}
