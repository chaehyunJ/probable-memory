package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.service.TestService;

@Controller
public class HomeController{
	
	@Autowired private TestService ts;
	
	@RequestMapping("/")
	public ModelAndView home(){
		ModelAndView mav = new ModelAndView("home");
		
		String test = ts.getTest();
		mav.addObject("test", test);
		
		return mav;
	}
	
	
}
