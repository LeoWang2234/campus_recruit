package com.ecust.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecust.dao.UserDao;
import com.ecust.pojo.User;
import com.ecust.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;
	public User login(User user){
		return userDao.login(user);
	}
	
}
