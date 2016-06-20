package com.pas.cloud.module.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pas.cloud.api.demo.DemoService;

@Controller
public class DemoController {
	
	@Autowired
	private DemoService demoService;
	
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

}
