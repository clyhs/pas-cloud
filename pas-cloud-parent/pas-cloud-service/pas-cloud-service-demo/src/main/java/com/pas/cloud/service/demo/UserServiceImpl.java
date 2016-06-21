package com.pas.cloud.service.demo;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.pas.cloud.anno.PasDataSource;
import com.pas.cloud.api.demo.UserService;
import com.pas.cloud.demo.bean.User;
import com.pas.cloud.demo.dao.UserMapper;
import com.pas.cloud.util.DataSourceHolder;


public class UserServiceImpl implements UserService {
	

	public UserMapper getUserMapper() {
		return userMapper;
	}

	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	private UserMapper userMapper;

	public User getById(Integer userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@PasDataSource
	public void insert(User user) {
		// TODO Auto-generated method stub
		userMapper.insert(user);
	}

}
