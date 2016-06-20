package com.pas.cloud.service.demo;

import org.springframework.stereotype.Service;

import com.pas.cloud.api.demo.DemoService;
import com.pas.cloud.common.MsgService;



public class DemoServiceImpl implements DemoService {
	
	private MsgService msgService;
	
	

	public MsgService getMsgService() {
		return msgService;
	}



	public void setMsgService(MsgService msgService) {
		this.msgService = msgService;
	}



	public String sayHello() {
		// TODO Auto-generated method stub
		return msgService.getMsg();
	}

}
