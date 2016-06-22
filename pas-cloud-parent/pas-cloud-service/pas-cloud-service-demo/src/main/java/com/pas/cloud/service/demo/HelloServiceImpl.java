package com.pas.cloud.service.demo;

import com.pas.cloud.api.demo.HelloService;
import com.alibaba.dubbo.config.annotation.Service;

/**
 * 
 * @author chenly 
 *
 * @version createtime:2016-6-22 下午4:14:41
 * 注解方式
 */
@Service(version="1.0.0")
public class HelloServiceImpl implements HelloService {

	public String sayHello() {
		// TODO Auto-generated method stub
		return "hello ***";
	}

}
