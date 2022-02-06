package com.itbank.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.TestDTO;
import com.itbank.service.FileService;

@Controller
public class UploadController {

	@Autowired private FileService fs;
	
	@GetMapping("/upload2")
	public ModelAndView upload2() {
		ModelAndView mav = new ModelAndView("upload2");
		List<TestDTO> list = fs.selectList();
		mav.addObject("list", list);
		
		return mav;
	}
	
	@PostMapping("/upload2")
	public String upload2(TestDTO dto) throws IllegalStateException, IOException {
		
		System.out.println(dto.getName());
		System.out.println(dto.getAge());
		System.out.println(dto.getFileName());
		System.out.println(dto.getUploadFile().getOriginalFilename());
		
		int row = fs.upload2(dto);
		
		return "redirect:/upload2";
	}
	
}
