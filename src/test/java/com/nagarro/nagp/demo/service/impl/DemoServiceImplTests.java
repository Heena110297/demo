package com.nagarro.nagp.demo.service.impl;

import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class DemoServiceImplTests {

	@Autowired
	private DemoServiceImpl demoServiceImpl;
	
	@Test
	public void testHello() {
      String testName = demoServiceImpl.sayHello();
      Assert.assertEquals("Hiiiiiiiii, Have a great day ahead", testName);
	}
	
	@Test
	public void testBye() {
      String testName = demoServiceImpl.sayGoodBye();
      Assert.assertEquals("Bye bye ^_^", testName);
	}
}
