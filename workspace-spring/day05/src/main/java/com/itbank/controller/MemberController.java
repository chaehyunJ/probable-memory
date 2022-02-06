package com.itbank.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.member.MemberDTO;
import com.itbank.service.MemberService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class MemberController {

	@Autowired private MemberService ms;
	
	
	@GetMapping("/memberList")
	public ModelAndView memberList() {
		ModelAndView mav = new ModelAndView();
		
		String test = ms.getTest();
		mav.addObject("test", test);
		
		Date now = ms.getSysdate();
		mav.addObject("now", now);
		
		List<MemberDTO> list = ms.getList();
		mav.addObject("list", list);
		
		
		return mav;
	}
	
	@GetMapping("/memberList/{order}")
	public ModelAndView memberList(@PathVariable String order) {
		ModelAndView mav = new ModelAndView("memberList");
		
		System.out.println(order);
		List<MemberDTO> list = ms.selectOrderBy(order);		// 변수 선언만, 값은 switch에 따라서 달라질 수 있음
		
//		switch(order) {
//		case "username":
//			list = ms.selectOrderBy("username");
//			break;
//		case "userid":
//			list = ms.selectOrderBy("userid");
//			break;
//		}
		
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("/memberAdd")
	public void memberAdd() {}

	
	@PostMapping("/memberAdd")
	public ModelAndView memberAdd(MemberDTO dto) {
		ModelAndView mav = new ModelAndView("redirect:/memberList");
		
		int row = ms.insert(dto);
		
		return mav;
	}
	
	@GetMapping("/loginTest")
	public void loginTest() {}
	
	@PostMapping("/loginTest")
	public ModelAndView loginTest(MemberDTO dto) {
		
		MemberDTO login = ms.loginTest(dto);
		System.out.println(login == null ? "실패" : "로그인 사용자 : " + login.getUserid());
		ModelAndView mav = new ModelAndView("redirect:/");

		return mav;
	}
}
