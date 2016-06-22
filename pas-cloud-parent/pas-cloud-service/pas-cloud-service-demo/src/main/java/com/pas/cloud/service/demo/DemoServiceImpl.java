package com.pas.cloud.service.demo;


import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.pas.cloud.api.demo.DemoService;
import com.pas.cloud.demo.bean.User;
import com.pas.cloud.demo.dao.UserDao;
import com.pas.cloud.demo.mapper.UserMapper;
import com.pas.cloud.util.DataSourceHolder;
import com.pas.cloud.common.MsgService;


/**
 * 
 * @author chenly 
 *
 * @version createtime:2016-6-22 下午4:00:00
 */
@Service(version="1.0.0")
public class DemoServiceImpl implements DemoService {
	
	@Autowired
	private MsgService msgService;
	
//	public MsgService getMsgService() {
//		return msgService;
//	}
//
//	public void setMsgService(MsgService msgService) {
//		this.msgService = msgService;
//	}
	
	

	public String sayHello() {
		// TODO Auto-generated method stub
		return msgService.getMsg();
	}



}
