package com.itbank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JoinController {

	@GetMapping("/join")
	public ModelAndView step1() {
		ModelAndView mav = new ModelAndView("join/step1");
		
		return mav;
	}
	
	@GetMapping("/join/step2")
	public ModelAndView step2() {
		ModelAndView mav = new ModelAndView("join/step2");
		
		return mav;
	}
}
