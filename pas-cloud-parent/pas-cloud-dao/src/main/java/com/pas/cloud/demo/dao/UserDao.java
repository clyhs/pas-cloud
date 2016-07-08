package com.pas.cloud.demo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
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
	
	public User selectByPrimaryKey(User t){
		return userMapper.selectByPrimaryKey(t);
	}
	
	public List<User> select(User t,int pageNum,int pageSize){
		PageHelper.startPage(pageNum, pageSize);
		List<User> result = userMapper.select(t);
		return result;
	}
	
	public Long selectCount(User t){
		return (long) userMapper.selectCount(t);
	}
}
