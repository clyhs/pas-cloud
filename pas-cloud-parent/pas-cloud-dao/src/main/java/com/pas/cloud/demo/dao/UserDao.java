package com.pas.cloud.demo.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pas.cloud.demo.bean.User;
import com.pas.cloud.demo.mapper.UserMapper;

@Service
public class UserDao {

	@Autowired
	private UserMapper userMapper;
	
	public void insert(User u){
		userMapper.insert(u);
	}
	
	public User getById(Integer userId){
		return userMapper.getById(userId);
	}
}
