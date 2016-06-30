package com.pas.cloud.service.demo;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.pas.cloud.anno.PasDataSource;
import com.pas.cloud.api.demo.UserService;
import com.pas.cloud.base.BaseServiceSupport;
import com.pas.cloud.demo.bean.User;
import com.pas.cloud.demo.dao.UserDao;
import com.pas.cloud.demo.mapper.UserMapper;
import com.pas.cloud.sample.bean.CapitalDto;
import com.pas.cloud.transaction.api.TransactionContext;
import com.pas.cloud.util.DataSourceHolder;

/**
 * 
 * @author chenly 
 *
 * @version createtime:2016-6-22 下午4:00:00
 */
public class UserServiceImpl extends BaseServiceSupport<User> implements UserService {
	
	private UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	@Override
	public void add(User u) {
		// TODO Auto-generated method stub
		userDao.insert(u);
	}
	@Override
	public User findById(Integer userId) {
		// TODO Auto-generated method stub
		return userDao.getById(userId);
	}
	
	


}
