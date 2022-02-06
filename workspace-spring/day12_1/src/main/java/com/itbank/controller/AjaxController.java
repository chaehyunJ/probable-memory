package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itbank.member.MemberDTO;
import com.itbank.service.MemberService;

@Controller
public class AjaxController {

	@Autowired private MemberService ms;
	
	@GetMapping("/ajax1")
	@ResponseBody
	public String ajax() {
		return "hello";
	}
	
	@GetMapping("/ajax2")
	@ResponseBody
	public int ajax(String ch1){
		int code = (int)ch1.charAt(0);
		return code;
	}
	
	@GetMapping(value="/ajax3", produces="application/json; charset=utf-8")
	@ResponseBody
	public String ajax2(String userid) throws JsonProcessingException {
		MemberDTO dto = ms.getMember(userid);
		
		ObjectMapper om = new ObjectMapper();
		
		String json = om.writeValueAsString(dto);
		
		return json;
	}
	
	@GetMapping("/ajax4")
	@ResponseBody
	public List<MemberDTO> ajax4(){
		return ms.getMeberList(); 
	}
	
	@GetMapping(value="/ajax5", produces="application/json; charset=utf-8")
	@ResponseBody
	public List<MemberDTO> ajax5(String username){
		List<MemberDTO> list = ms.getSearchMember(username);
		return list;
	}
	
	
}
