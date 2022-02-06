package com.itbank.controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.component.Hash;
import com.itbank.member.MemberDTO;
import com.itbank.model.OrderListDTO;
import com.itbank.service.MemberService;
import com.itbank.service.OrderService;

@Controller
public class MyPageController {

	@Autowired private OrderService os;
	@Autowired private MemberService ms;
	@Autowired private Hash hash;
	
	@GetMapping("/myPage")
	   public ModelAndView myPage(HttpSession session) {
			ModelAndView mav = new ModelAndView();  
			String userid = ((MemberDTO)session.getAttribute("login")).getUserid();
			
			System.out.println(userid);
	      
			OrderListDTO orderList = os.orderlistPage(userid);
			
//			System.out.println(orderList.getOrderSeq());
			
			if(orderList != null) {
				mav.addObject("orderList", orderList);	
			}
	      return mav;
	   }
	@GetMapping("/myPage_order")
	public String myPage_order() {
		return "myPage_order";
	}
	
	@GetMapping("/history")
	public String history() {
		return "history";
	}
	
	@GetMapping("/memberInfo")
	public String memberInfo() {
		return "memberInfo";
	}
	
	@GetMapping("/chkPw")
	public String chkPw() {
		return "chkPw";
	}
	
	@PostMapping("/chkPw")
	public ModelAndView chkPw(@RequestParam String userpw, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		MemberDTO member = (MemberDTO)session.getAttribute("login");
		
		String member1 = member.getUserpw();
		String pw1 = hash.getHash(userpw);
		
	
		MemberDTO chkPw = ms.chkMember(pw1);
		
		String chkPw1 = chkPw.getUserpw();
		
		if(member1.equals(chkPw1)) {
			mav.setViewName("redirect:update");		
		}
		else {
			mav.setViewName("alert");
			mav.addObject("msg", "비밀번호가 일치하지 않습니다");
			mav.addObject("url", "chkPw");
		}
		return mav;
	}
}

