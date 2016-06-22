package com.pas.cloud.module.busi.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	@Autowired
	private UserService userService;
	
	


	@Override
	protected void changeDataSource() {
		// TODO Auto-generated method stub
		userService.changeDataSource("dataSource_1");
	}

	@Override
	public void add(User u) {
		// TODO Auto-generated method stub
		userService.insert(u);
	}

	
	

	

}
