package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.book.BookDTO;
import com.itbank.service.BookService;

@Controller
public class BookController {

	@Autowired private BookService bs;
	
	@GetMapping("/book")
	public ModelAndView book() {
		ModelAndView mav = new ModelAndView();
		
		List<BookDTO> list = bs.selectList();
		
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	@GetMapping("/book/{order}")
	public ModelAndView book(@RequestParam HashMap<String, String> param,  @PathVariable String order) {
		// 두개이상의 파라미터를 받아야 하지만 정해진 DTO는 없고 처리를 해야할 떄 HashMap을 사용해서 파라미터를 한번에 받을 수 있다
		// order 같이 다른 값이 들어와도 map에 추가시켜서 보낼 수 있다
		// HashMap을 이용하여 parameter를 받을 떄는 어노테이션 @RequestParam을 생략하면 안된다
		
		ModelAndView mav = new ModelAndView("book");
		
		System.out.println("map : " + param);
		
		param.put("order", order);
		
		List<BookDTO> list = bs.selectOrder(param);
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	@GetMapping("/deleteBook/{idx}")
	public ModelAndView delete(@PathVariable int idx) {
		ModelAndView mav = new ModelAndView();
		int row = bs.delete(idx);
		if(row == 1) {
			mav.setViewName("alert");
			mav.addObject("msg", "삭제 성공");
			mav.addObject("url", "book");
		}
		else {
			mav.setViewName("alert");
			mav.addObject("msg", "삭제 실패");
		}
		return mav;
	}
	
	@GetMapping("/modifyBook/{idx}")
	public ModelAndView modify(@PathVariable int idx) {

		ModelAndView mav = new ModelAndView("modifyBook");
		BookDTO dto = bs.select(idx);
		mav.addObject("dto", dto);
		
		return mav;
	}
	
	@PostMapping("/modifyBook/{idx}")
	public ModelAndView modify(BookDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		int row = bs.modify(dto);
		if(row == 1) {
			mav.setViewName("alert");
			mav.addObject("msg", "수정 성공");
			mav.addObject("url", "book");
		}
		else {
			mav.setViewName("alert");
			mav.addObject("msg", "수정 실패");
		}
		return mav;
	}
	
	@GetMapping("/addBook")
	public void addBook() {
		System.out.println("2) 컨트롤러");
	}
	
	@PostMapping("/addBook")
	public ModelAndView addBook(BookDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		int row = bs.addBook(dto);
		
		if(row == 1) {
			mav.setViewName("alert");
			mav.addObject("msg", "추가 성공");
			mav.addObject("url", "book");
		}
		else {
			mav.setViewName("alert");
			mav.addObject("msg", "추가 실패");
		}
		return mav;
	}
	
	
}
