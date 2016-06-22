package com.pas.cloud.service.demo;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.pas.cloud.anno.PasDataSource;
import com.pas.cloud.api.demo.UserService;
import com.pas.cloud.base.dao.BaseServiceSupport;
import com.pas.cloud.demo.bean.User;
import com.pas.cloud.demo.dao.UserMapper;
import com.pas.cloud.util.DataSourceHolder;


public class UserServiceImpl implements UserService {
	
	private UserMapper userMapper;
	

	public User getById(Integer userId) {
		// TODO Auto-generated method stub
		return userMapper.getById(userId);
	}

	public UserMapper getUserMapper() {
		return userMapper;
	}

	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	
	public void insert(User u) {
		// TODO Auto-generated method stub
		userMapper.insert(u);
	}

	

}
