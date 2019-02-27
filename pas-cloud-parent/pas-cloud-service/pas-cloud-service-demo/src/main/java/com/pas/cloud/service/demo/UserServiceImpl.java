package com.pas.cloud.service.demo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageInfo;
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
@Service(version="1.0.0")
public class UserServiceImpl extends BaseServiceSupport<User> implements UserService {
	
	@Autowired
	private UserDao userDao;

	
	
	@Override
	public void add(User u) {
	}
	@Override
	public User findById(Integer userId) {
		// TODO Auto-generated method stub
		User u = new User();
		u.setUserId(userId);
		return userDao.selectByPrimaryKey(u);
	}
	/* (non-Javadoc)
	 * @see com.pas.cloud.api.demo.UserService#select(com.pas.cloud.demo.bean.User, int, int)
	 */
	public PageInfo<User> select(User t, int pageNum, int pageSize) {
		// TODO Auto-generated method stub
		List<User> alist = new ArrayList<User>();
		alist = userDao.select(t, pageNum, pageSize);
		PageInfo<User> pageInfo = new PageInfo<User>();
		pageInfo.setList(alist);
		Long nTotal = userDao.selectCount(t);
		pageInfo.setTotal(nTotal);
		return pageInfo;
	}
	@Override
	public User getUser(User u) {
		// TODO Auto-generated method stub
		return userDao.getUser(u);
	}
	
	


}
