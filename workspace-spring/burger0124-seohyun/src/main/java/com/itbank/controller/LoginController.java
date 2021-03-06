package com.itbank.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.admin.AdminDTO;
import com.itbank.component.Hash;
import com.itbank.member.MemberDTO;
import com.itbank.service.MemberService;

@Controller
public class LoginController {

	@Autowired private MemberService ms;
	@Autowired private Hash	hash;
	
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@PostMapping("/login")
	public ModelAndView login(MemberDTO dto, HttpSession session, HttpServletRequest request, HttpServletResponse response, String url) {
		ModelAndView mav = new ModelAndView();
		
		String auto = request.getParameter("auto");
		System.out.println("auto :" + auto);
		
		if(auto != null) {
			Cookie autoLogin = new Cookie("JSESSIONID", session.getId());
			autoLogin.setMaxAge(7200);
			autoLogin.setPath("/burger2_2");
			response.addCookie(autoLogin);
		}
		dto.setUserpw(hash.getHash(dto.getUserpw()));
		
		
		MemberDTO login = ms.login(dto);
		session.setAttribute("login", login);
		
		if(url == null) {
			mav.setViewName("redirect:/");
		}
		else {
			mav.setViewName("redirect:" + url);
		}
		
		
		return mav;
	}
	
	@GetMapping("/loginAdmin")
	public String loginAdmin() {
		return "loginAdmin";
	}
	
	@PostMapping("/loginAdmin")
	public ModelAndView loginAdmin(AdminDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		
		AdminDTO adminlogin = ms.loginAdmin(dto);
		System.out.println(adminlogin.getAdminid());
		
		session.setAttribute("adminlogin", adminlogin);
		if(adminlogin != null) {
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// ????????? ??????
	@GetMapping("/findId")
	public String findId() {
		return "findId";
	}
	
	
	// ???????????? ??????
	@GetMapping("/findPw")
	public String findPw() {
		return "findPw";
	}
	
	@GetMapping("/update")
	public ModelAndView update(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		MemberDTO member = (MemberDTO)session.getAttribute("login");
		
		
		System.out.println(member.getUserpw());
		String pw = member.getUserpw().substring(0, 8);
		
		member.setUserpw(pw);
		
		mav.addObject("member", member);
		return mav;
	}
	
	
	@PostMapping("/update")
	public ModelAndView update(MemberDTO dto) {
		ModelAndView mav = new ModelAndView("update");
		
		dto.setUserpw(hash.getHash(dto.getUserpw()));
		
		int row = ms.update(dto);
		
		if(row == 1) {
			mav.setViewName("alert");
			mav.addObject("msg", "????????????");
			mav.addObject("url", "myPage");
		}
		else {
			mav.setViewName("alert");
			mav.addObject("msg", "????????????");
			mav.addObject("url", "update/{userid}");
		}
		System.out.println(row==1?"success":"fail");
		return mav;	//???????????? ?????? ???????????? ?????? ??? ??? ?????????
	}
}
