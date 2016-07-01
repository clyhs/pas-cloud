package com.pas.cloud.module.web.demo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.dubbo.config.annotation.Reference;
import com.pas.cloud.api.demo.DemoService;
import com.pas.cloud.api.demo.HelloService;
import com.pas.cloud.api.demo.UserService;
import com.pas.cloud.demo.bean.User;
import com.pas.cloud.module.intf.demo.IUserBusiness;
import com.pas.cloud.redis.Producer;
import com.pas.cloud.util.DataSourceHolder;

/**
 * 
 * @author chenly 
 *
 * @version createtime:2016-6-22 下午4:01:04
 */
@Controller
public class DemoController {
	
	public DemoController(){
		DataSourceHolder.setDataSource("dataSource_1");
	}
	
	@Autowired
	private DemoService demoService;
	
	@Reference(version="1.0.0")
	private HelloService helloService;
	
	@Autowired
	private IUserBusiness userBusiness; 
	
	@Autowired
	private StringRedisTemplate stringRedisTemplate;
	
	@Autowired
	private Producer producer;
	
	@RequestMapping("/module/demo/index")
	@ResponseBody
	public String index(){
		//dataSource_1
		stringRedisTemplate.opsForValue().set("001", "dataSource_0");
		return "index";
	}
	
	@RequestMapping("/hello")
	@ResponseBody
	public String hello(){
		return helloService.sayHello();
	}
	
	@RequestMapping("/module/demo/insert")
	@ResponseBody
	public String insert(HttpServletRequest request,HttpServletResponse response){
		Integer userId = Integer.valueOf(request.getParameter("userid"));
		//Integer dbtype = Integer.valueOf(request.getParameter("dbtype"));
		User u = new User();
		u.setUserId(userId);
		u.setUsername("小强");
		u.setPassword("3rerw3");
		userBusiness.insert(u);
		
		return "ok";
	}
	
	@RequestMapping("/module/demo/publish")
	@ResponseBody
	public String publish(HttpServletRequest request,HttpServletResponse response){
		
		producer.publish();
		return "ok";
	}

}
