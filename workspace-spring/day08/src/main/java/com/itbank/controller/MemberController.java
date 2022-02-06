package com.itbank.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
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
	
	@GetMapping("/join")
	public void join() {}
	
	@PostMapping("/join")
	public ModelAndView join(MemberDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		int row = ms.memberAdd(dto);
		
		if(row == 1) {
			mav.setViewName("alert");
			mav.addObject("msg", "회원가입성공");
			mav.addObject("url", "login");
		}
		else {
			mav.setViewName("alert");
			mav.addObject("msg", "회원가입실패");
			mav.addObject("url", "join");
		}
		
		return mav;
	}
	
	@GetMapping("/newPass")
	public void newPass() {}
	
	@PostMapping("/newPass")
	public ModelAndView newPass(MemberDTO dto) {
		ModelAndView mav = new ModelAndView("alert");
		
		// 1. id와  email이 일치하는 계정이 있는가
		MemberDTO target = ms.findMemberByEmail(dto);
		if(target != null) {
			// 계정이 있으면, 새로운 문자열을 만들어서 update하고
			
			String newPass = ms.newPass(target);
			
			// 사용자에게 신규 비밀번호를 보여주기
			mav.addObject("msg", "새로운 비밀번호는 " + newPass );
			mav.addObject("url", "login");
		}
		else {
			// 일치하는 계정이 없다면 메시지를 alert을 통해서 알려주기
			// 이전페이지로 이동
			mav.addObject("msg", "일치하는 계정이 없습니다");
		}
		return mav;
	}
	
	@ExceptionHandler(DuplicateKeyException.class)
	public ModelAndView duplicateJoin(DuplicateKeyException e) {
		ModelAndView mav = new ModelAndView("alert");
		mav.addObject("msg", "이미 사용중인 ID입니다. 다른 ID로 가입을 시도하세요");
		mav.addObject("url", "join");
		return mav;
	}
	
}
