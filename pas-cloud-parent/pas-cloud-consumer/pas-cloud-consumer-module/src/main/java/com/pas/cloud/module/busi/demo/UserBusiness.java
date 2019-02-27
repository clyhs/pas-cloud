package com.pas.cloud.module.busi.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.github.pagehelper.PageInfo;
import com.pas.cloud.api.demo.UserService;
import com.pas.cloud.base.BaseBusinessSupport;
import com.pas.cloud.base.BaseServiceSupport;
import com.pas.cloud.demo.bean.User;
import com.pas.cloud.module.intf.demo.IUserBusiness;

/**
 * 
 * @author chenly 
 *
 * @version createtime:2016-6-22 下午3:59:21
 */
@Service
public class UserBusiness extends BaseBusinessSupport<User> implements IUserBusiness {
	
	@Reference(version="1.0.0")
	private UserService userService;
	
	


	@Override
	protected void changeDataSource() {
		// TODO Auto-generated method stub
		userService.changeDataSource("dataSource_0");
	}

	@Override
	public void add(User u) {
		// TODO Auto-generated method stub
		userService.insert(u);
	}

	/* (non-Javadoc)
	 * @see com.pas.cloud.module.intf.demo.IUserBusiness#select(com.pas.cloud.demo.bean.User, int, int)
	 */
	public PageInfo<User> select(User t, int pageNum, int pageSize) {
		// TODO Auto-generated method stub
		return userService.select(t, pageNum, pageSize);
	}

	@Override
	public User getUser(String username) {
		// TODO Auto-generated method stub
		User u = new User();
		u.setUsername(username);
		return userService.getUser(u);
	}

	
	

	

}
