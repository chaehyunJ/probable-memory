package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.promotion.PromDTO;
import com.itbank.service.MenuService;
import com.itbank.service.PromService;

@RestController
public class AjaxController {

	@Autowired private PromService ps;
	@Autowired private MenuService ms;
	
	@GetMapping("/ajaxPromotion")
	public List<PromDTO> promList(){
		return ps.getList();
	}
	
	@GetMapping("/ajaxMenu/{table}")
	public HashMap<String, Object> getMenuList(@PathVariable String table){
		HashMap<String, Object> list = new HashMap<String, Object>();
		List<HashMap<String, Object>> tlist = ms.getTopList(table);
		List<HashMap<String, Object>> mlist = ms.getMenuList(table);
		list.put("tlist",tlist);
		list.put("mlist",mlist);
		return list;
	}
	
	@GetMapping("/ajaxMenu/{table}/{seq}")
	public List<HashMap<String, Object>> getDetailList(@PathVariable String table, @PathVariable int seq){
		return ms.getDetailList(table.toUpperCase()+"_", seq);
	}
}
