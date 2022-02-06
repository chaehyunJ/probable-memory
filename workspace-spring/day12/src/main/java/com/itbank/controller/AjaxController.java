package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itbank.member.MemberDTO;
import com.itbank.service.MemberService;

//@Controller
@RestController		// ajax 요청을 전문적으로 처리하느 컨트롤러
					// 하위 모든 메서드는 @ResponseBody를 명시하지 않아도 처리하게 된다
					// rest가 말하는 것은 주소를 간결하게 해서 HTTP요청으로 보내준다
					// 어노테이션이 만들어진 것은 많이 사용한다는 뜻

public class AjaxController {

	@Autowired private MemberService ms;
	
	@GetMapping("/ajax1")
//	@ResponseBody				//	 반환하는 데이터 그대로 응답으로 보내주기
	public String ajax1() {
		return "hello";
	}
	
	@GetMapping("/ajax2")
//	@ResponseBody
	public int ajax2(String ch) {
		int code = 0;
		code = (int)ch.charAt(0);
		return code;
	}
	
	// 인코딩 깨지는거 방지하는 것
	@GetMapping(value="/ajax3", produces="application/json; charset=utf-8")
//	@ResponseBody
	public String ajax3(String userid) throws JsonProcessingException {

		MemberDTO dto = ms.getMember(userid);
		
		// 자바 <-> 자바스크립트 객체 변환기
		// 언어를 변환하기
		ObjectMapper om = new ObjectMapper();
		
		// 객체의 값의 문자열방식으로
		String json = om.writeValueAsString(dto);
		return json;
	}
	
	@GetMapping("/ajax4")
//	@ResponseBody
	public List<MemberDTO> ajax4(){
		
		return ms.getMemberList();
	}
	
	@GetMapping(value="/ajax5", produces="application/json; charset=utf-8")
//	@ResponseBody
	public List<MemberDTO> ajax5(String username){
		
		List<MemberDTO> list = ms.getSearchMember(username);
		
		return list;
	}
	
	@GetMapping(value="/ajaxQuiz2", produces="application/json; charset=utf-8")
	public String ajaxQuiz2(String userid) throws JsonProcessingException {
		MemberDTO dto = ms.getMember(userid);
		
		ObjectMapper om = new ObjectMapper();
		
		String json = om.writeValueAsString(dto);
		
		return json;
	}
	
	
}
