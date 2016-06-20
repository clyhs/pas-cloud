package com.pas.cloud.module.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.dubbo.config.annotation.Reference;
import com.pas.cloud.api.demo.DemoService;
import com.pas.cloud.api.demo.UserService;
import com.pas.cloud.demo.bean.User;

@Controller
public class DemoController {
	
	@Autowired
	private DemoService demoService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/module/demo/index")
	@ResponseBody
	public String index(){
		return "index";
	}
	
	@RequestMapping("/hello")
	@ResponseBody
	public String hello(){
		return demoService.sayHello();
	}
	
	@RequestMapping("/module/demo/insert")
	@ResponseBody
	public String insert(HttpServletRequest request,HttpServletResponse response){
		//Integer userId = Integer.valueOf(request.getParameter("userid"));
		User u = new User();
		u.setUserId(1);
		u.setUsername("ccc");
		u.setPassword("3rerw3");
		userService.insert(u);
		return demoService.sayHello();
	}

}
