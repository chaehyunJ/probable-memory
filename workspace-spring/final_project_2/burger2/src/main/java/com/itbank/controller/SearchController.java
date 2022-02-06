package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.service.SearchService;

@Controller
public class SearchController {

	@Autowired private SearchService ss;
	
	@GetMapping("/search")
	public ModelAndView search(@RequestParam String search, @RequestParam String type) {
		ModelAndView mav = new ModelAndView();
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		
		
		
		map.put("search", search);
		map.put("type", type);
		
		String type1 = type.toUpperCase();
		
		System.out.println(type1);
		
		String name = type.toUpperCase();
		
		System.out.println(name);
		
		List<HashMap<String, String>> list = ss.searchList(map);
		
		System.out.println(list);
		
		System.out.println(search);
		mav.addObject("list", list);
		mav.addObject("type", type1);
		mav.addObject("name", name);
		return mav;
	}
}
