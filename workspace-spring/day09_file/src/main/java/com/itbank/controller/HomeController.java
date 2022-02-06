package com.itbank.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.service.FileService;

@Controller
public class HomeController{
	
	@Autowired private FileService fs;
	
	@GetMapping("/")
	public String home() {
		return "home";
	}
	
	@PostMapping("/")
	public String home(MultipartFile file) throws IllegalStateException, IOException {
		
		System.out.println(file);
		System.out.println(file.getOriginalFilename());
		
		boolean io = fs.upload(file);
		
		System.out.println(io == true ? "성공" : "실패");
		
		return "redirect:/";
	}
}