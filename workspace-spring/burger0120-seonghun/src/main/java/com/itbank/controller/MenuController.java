package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.service.MenuService;

@Controller
public class MenuController {
	
	@Autowired private MenuService ms;
	
	@GetMapping("/menu")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("menu/list");
		
		int cnt = ms.countList();
		
		mav.addObject("cnt", cnt);
		
		return mav;
	}
}
