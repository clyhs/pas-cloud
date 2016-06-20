package com.pas.cloud.service.demo;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.pas.cloud.api.demo.UserService;
import com.pas.cloud.demo.bean.User;
import com.pas.cloud.demo.dao.UserMapper;

@Service(version="1.0.0")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;

	public User getById(Integer userId) {
		// TODO Auto-generated method stub
		return null;
	}

	public void insert(User user) {
		// TODO Auto-generated method stub
		userMapper.insert(user);
	}

}
