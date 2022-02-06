package com.itbank.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.member.MemberDTO;
import com.itbank.service.MemberService;

@Controller
public class MemberController {

	@Autowired private MemberService ms;
	
	@GetMapping("/memberList")
	public ModelAndView memberList() {
		ModelAndView mav = new ModelAndView();
		
		List<MemberDTO> list = ms.getMemberList();
		mav.addObject("list", list);
		
		return mav;
	}
	
	@GetMapping("/login")
	public void login() {}
	
	@PostMapping("/login")
	public ModelAndView login(MemberDTO dto, HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		MemberDTO login = ms.login(dto);
		
		session.setAttribute("login", login);
		
		mav.setViewName("redirect:/");
		
		return mav;
	}
	
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		session.invalidate();
		
		mav.setViewName("redirect:/");
		
		return mav;
	}
}
