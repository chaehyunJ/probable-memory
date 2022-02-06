package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.mcdelivery.McDTO;
import com.itbank.service.McService;

@RestController
public class AjaxController {

	@Autowired private McService ms;
	
	@GetMapping("/getData")
	public List<McDTO> getData(){
		return ms.getList();
	}
}
