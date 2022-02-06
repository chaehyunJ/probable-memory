package com.itbank.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.admin.AdminDTO;
import com.itbank.model.QnaBoardDTO;
import com.itbank.model.ReplyDTO;
import com.itbank.service.BoardService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired private BoardService bs;

	
	// admin 댓글 체크 페이지
	// 2022-01-25
	@GetMapping("/qnaCheck")
	public ModelAndView qnaCheck() {
		ModelAndView mav = new ModelAndView();
			
		List<QnaBoardDTO> list = bs.qnaCheck();
			
		System.out.println(list);
			
		mav.addObject("list", list);
			
		return mav;
	}
	
	@PostMapping("/qnaCheck")
	public ModelAndView qnaCheck(ReplyDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		int row = bs.replyInsert(dto);
		
		int seq = dto.getBoard_idx();
		
		System.out.println(row);
		
		if(row == 1) {
			int update = bs.qnaResult(seq);
//			if(update == 1) {
//				
//			}
		}
		
		if(row == 1) {
			mav.setViewName("alert");
			mav.addObject("msg", "작성 성공");
			mav.addObject("url", "admin/qnaCheck");
		}
		else {
			mav.setViewName("alert");
			mav.addObject("msg", "수정실패");
			mav.addObject("url", "admin/qnaCheck");
		}
		return mav;
	}
	
	
	@GetMapping("/adminPage")
	   public ModelAndView adminPage() {
			ModelAndView mav = new ModelAndView();
			return mav;
	   }
	
	@GetMapping("/adminInfo")
	public ModelAndView adminInfo(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		AdminDTO adminlogin = (AdminDTO)session.getAttribute("adminlogin");
		System.out.println(adminlogin);
		mav.addObject("adminlogin", adminlogin);
		
      return mav;
	}
}
