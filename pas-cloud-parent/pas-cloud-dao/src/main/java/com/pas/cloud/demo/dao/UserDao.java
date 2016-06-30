package com.pas.cloud.demo.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.pas.cloud.demo.bean.User;
import com.pas.cloud.demo.mapper.UserMapper;

/**
 * 
 * @author chenly 
 *
 * @version createtime:2016-6-22 下午4:00:00
 */
@Repository
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
