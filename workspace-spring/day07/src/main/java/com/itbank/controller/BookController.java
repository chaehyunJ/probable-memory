package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	public ModelAndView book(@PathVariable String order) {
		ModelAndView mav = new ModelAndView("book");
		
		List<BookDTO> list = bs.selectOrder(order);
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	
	
}
