package com.itbank.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	// method가 POST라도 주소창에 퀴리스트링이 있으면 파라미터 형식으로 받을 수 있다
	@PostMapping("/login")
	public ModelAndView login(MemberDTO dto, HttpSession session, String url){
		System.out.println("컨트롤러에서 받은 주소 : " + url);
		ModelAndView mav = new ModelAndView();
		
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
	
	@GetMapping("/memberInfo")
	public ModelAndView memberInfo(HttpSession session) {
		ModelAndView mav = new ModelAndView("memberInfo");
		
		MemberDTO info = (MemberDTO)session.getAttribute("login");
		
		// 차후 보안요소를 생각한다면, 비번을 한번 더 입력받는 것이 맞다
		// MemberDTO memberInfo = ms.login(info);
		
	 	mav.addObject("info", info);
	 	
		return mav;
	}
	
	@GetMapping("/memberModify")
	public ModelAndView memberModify(HttpSession session) {
		ModelAndView mav = new ModelAndView("memberModify");
		
		MemberDTO info = (MemberDTO)session.getAttribute("login");
		
		// 차후 보안요소를 생각한다면, 비번을 한번 더 입력받는 것이 맞다
		// MemberDTO memberInfo = ms.login(info);
		
	 	mav.addObject("info", info);
	 	
		return mav;
	}
	
	@PostMapping("/memberModify")
	public ModelAndView memberModify(MemberDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		int row = ms.modifyMember(dto);
		if(row == 1) {
			// 회원정보를 수정했으며 기존의 session 을 날리고 새로 로그인해야 기존의 session의 값하고 수정한 값하고 동일해지니까
			session.invalidate();
			mav.setViewName("alert");
			mav.addObject("msg", "회원정보 수정 성공");
			mav.addObject("url", "login");
		}
		else {
			mav.setViewName("alert");
			mav.addObject("msg", "회원정보 수정 실패");
			mav.addObject("url", "memberInfo");
		}
		return mav;
	}
	
	@GetMapping("/deleteMember")
	public ModelAndView deleteMember(HttpSession session) {
		ModelAndView mav = new ModelAndView("deleteMember");
		
		MemberDTO info2 = (MemberDTO)session.getAttribute("login");
		
		mav.addObject("info2", info2);
		
		return mav;
	}
	
	@PostMapping("/deleteMember")
	public ModelAndView deleteMember(@RequestParam String userpw, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		int row = ms.deleteMember(userpw);
		if(row == 1) {
			// 회원정보를 수정했으며 기존의 session 을 날리고 새로 로그인해야 기존의 session의 값하고 수정한 값하고 동일해지니까
			session.invalidate();
			mav.setViewName("alert");
			mav.addObject("msg",  "회원탈퇴 성공");
			mav.addObject("url", "login");
		}
		else {
			mav.setViewName("alert");
			mav.addObject("msg", "회원탈퇴 실패");
			mav.addObject("url", "memberInfo");
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
