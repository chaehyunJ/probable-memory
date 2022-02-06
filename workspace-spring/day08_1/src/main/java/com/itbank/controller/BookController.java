package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

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
	public ModelAndView book(@RequestParam HashMap<String, String> map, @PathVariable String order) {
		ModelAndView mav = new ModelAndView("book");
		
		System.out.println("map : " + map);
		map.put("order", order);
		
		List<BookDTO> list = bs.selectOrder(map);
		
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
		BookDTO dto = bs.selectOne(idx);
		
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
}
