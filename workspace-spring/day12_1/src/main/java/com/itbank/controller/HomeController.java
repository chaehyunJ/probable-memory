package com.itbank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController{
	
	@GetMapping("/")
	public String home() {
		return "home";
	}
	
	@GetMapping("/ex01")
	public void ex01() {}
	
	@GetMapping("/ex02")
	public void ex02() {}
	
	@GetMapping("/ex03")
	public void ex03() {}
	
	@GetMapping("/ex04")
	public void ex04() {}
	
	@GetMapping("/ex05")
	public void ex05() {}
}
