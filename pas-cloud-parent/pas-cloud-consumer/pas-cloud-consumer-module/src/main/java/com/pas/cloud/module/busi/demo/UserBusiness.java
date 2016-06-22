package com.pas.cloud.module.busi.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pas.cloud.api.demo.UserService;
import com.pas.cloud.base.BaseServiceSupport;
import com.pas.cloud.demo.bean.User;
import com.pas.cloud.module.intf.demo.IUserBusiness;

@Service
public class UserBusiness implements IUserBusiness {
	
	@Autowired
	private UserService userService;

	public void insert(User u) {
		// TODO Auto-generated method stub
		userService.changeDataSource("dataSource_1");
		userService.insert(u);
	}

	
	

	

}
