package com.itbank.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.member.MemberDTO;
import com.itbank.model.OrderListDTO;
import com.itbank.service.OrderService;

@Controller
public class MyPageController {

	@Autowired private OrderService os;
	
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
}

