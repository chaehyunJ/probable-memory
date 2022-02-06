package com.itbank.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.admin.AdminDTO;
import com.itbank.model.NoticeDTO;
import com.itbank.service.FileService;
import com.itbank.service.MemberService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired MemberService ms;
	@Autowired FileService fs;

	@GetMapping("/news")
	public void news() {}
	
	@GetMapping("/question")
	public void question() {}
	
	@GetMapping("/newsWrite")
	public ModelAndView newsWrite(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		AdminDTO adminlogin = (AdminDTO)session.getAttribute("adminlogin");
		AdminDTO info = ms.loginAdmin(adminlogin);
		mav.addObject("info", info);
		return mav;
	}
	
	@PostMapping("/newsWrite")
	public ModelAndView newsWrite(NoticeDTO dto) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView();
		
		System.out.println(dto.getUploadFile().getOriginalFilename());
		
		int row = fs.upload(dto);
		
		if(row == 1) {
			mav.setViewName("alert");
			mav.addObject("msg", "작성 성공!!");
			mav.addObject("url", "board/news");
		}
		else {
			mav.setViewName("alert");
			mav.addObject("msg", "작성 실패!!");
		}
		
		return mav;
	}
	
}