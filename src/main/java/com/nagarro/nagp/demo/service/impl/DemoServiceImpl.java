package com.nagarro.nagp.demo.service.impl;

import org.springframework.stereotype.Service;

import com.nagarro.nagp.demo.service.DemoService;

@Service
public class DemoServiceImpl implements DemoService{

	@Override
	public String sayHello() {
		return "Hiiiiiiiii, Have a great day ahead";
	}

	@Override
	public String sayGoodBye() {
		return "Bye bye ^_^";
	}

}
