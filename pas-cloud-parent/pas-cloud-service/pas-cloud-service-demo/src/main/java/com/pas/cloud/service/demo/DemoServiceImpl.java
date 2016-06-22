package com.pas.cloud.service.demo;

import org.springframework.stereotype.Service;

import com.pas.cloud.api.demo.DemoService;
import com.pas.cloud.demo.bean.User;
import com.pas.cloud.demo.dao.UserMapper;
import com.pas.cloud.util.DataSourceHolder;
import com.pas.cloud.common.MsgService;



public class DemoServiceImpl implements DemoService {
	
	private MsgService msgService;
	
	private UserMapper userMapper;
	
	public MsgService getMsgService() {
		return msgService;
	}

	public void setMsgService(MsgService msgService) {
		this.msgService = msgService;
	}
	
	public UserMapper getUserMapper() {
		return userMapper;
	}

	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}



	public String sayHello() {
		// TODO Auto-generated method stub
		return msgService.getMsg();
	}

	public void insert(User user) {
		// TODO Auto-generated method stub
		DataSourceHolder.setDataSource("dataSource_1");
		userMapper.insert(user);
	}

}
