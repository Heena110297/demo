package com.nagarro.nagp.demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.nagarro.nagp.demo.service.DemoService;

@RestController
public class DemoController {

	@Autowired 
	DemoService demoService;
	
	@RequestMapping("/")
	public String hello() {
		return demoService.sayHello();
	}
	
	@RequestMapping("/bye")
	public String sayBye() {
		return demoService.sayGoodBye();
	}
	
}
