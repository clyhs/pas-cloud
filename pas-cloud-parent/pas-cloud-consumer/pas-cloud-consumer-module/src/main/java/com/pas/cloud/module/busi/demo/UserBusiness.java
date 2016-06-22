package com.pas.cloud.module.busi.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pas.cloud.api.demo.UserService;
import com.pas.cloud.base.dao.BaseMapperSupport;
import com.pas.cloud.base.dao.BaseServiceSupport;
import com.pas.cloud.demo.bean.User;
import com.pas.cloud.module.intf.demo.IUserBusiness;

@Service
public class UserBusiness extends BaseServiceSupport<User> implements IUserBusiness {
	
	@Autowired
	private UserService userService;

	@Override
	public void insert(User u) {
		// TODO Auto-generated method stub
		userService.insert(u);
	}

	
	

	

}
