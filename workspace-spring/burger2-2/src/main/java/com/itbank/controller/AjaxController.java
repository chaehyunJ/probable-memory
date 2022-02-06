package com.itbank.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.component.Hash;
import com.itbank.member.MemberDTO;
import com.itbank.model.BurgerDTO;
import com.itbank.model.DrinkDTO;
import com.itbank.model.McMorningDTO;
import com.itbank.model.McafeDTO;
import com.itbank.model.SideDTO;
import com.itbank.promotion.PromDTO;
import com.itbank.service.ImageService;
import com.itbank.service.MailService;
import com.itbank.service.MemberService;
import com.itbank.service.MenuService;

@RestController
public class AjaxController {

	@Autowired private MenuService ms;
	@Autowired private MemberService memberService;
	@Autowired private Hash hash;
	@Autowired private MailService mailService;
	@Autowired private ImageService is;
	
	@GetMapping("/ajaxPromotion")
	public List<PromDTO> promList(){
		return ms.getList();
	}
	
	@GetMapping("/ajaxBurger/{table}")
	public List<HashMap<String, Object>> burgerList(@PathVariable String table){
		return ms.getburgerList(table);
	}
	
	@GetMapping("/ajaxBurgerList")
	public List<HashMap<String, Object>> burList(){
		return ms.burList();
	}
	
	@GetMapping("/ajaxIdChk/{userid}")
	public HashMap<String, String> idCheck(@PathVariable String userid){
		HashMap<String, String> map = new HashMap<String, String>();
		
		MemberDTO dto = memberService.getMember(userid);
		
		map.put("msg", dto == null ? "사용가능한 ID입니다" : "이미 사용중인 ID입니다");
		map.put("color", dto == null ? "blue" : "red");
		map.put("focus", dto == null ? "userpw" : "userid");
		
		return map;
	}
	
	@GetMapping("/mac")
	public List<McMorningDTO> mac() {
		return is.getmacList();
	}
	@GetMapping("/macSet")
	public List<McMorningDTO> macSet() {
		return is.getmacSetList();
	}
	
	@GetMapping("/burger")
	public List<BurgerDTO> burger() {
		return is.getburgerList();
	}
	
	@GetMapping("/burgerSet")
	public List<BurgerDTO> burgerSet() {
		return is.getburgerSetList();
	}
	
	@GetMapping("/side")
	public List<SideDTO> side() {
		return is.getsideList();
	}
	
	@GetMapping("/drink")
	public List<DrinkDTO> drink() {
		return is.getdrinkList();
	}
	
	@GetMapping("/dessert")
	public List<DrinkDTO> dessert() {
		return is.getdessertList();
	}
	
	@GetMapping("/mcafe")
	public List<McafeDTO> mcafe() {
		return is.getmcafeList();
	}
	
	
	@GetMapping("/mailto/{email}/")
	public HashMap<String, String> mailto(@PathVariable String email, HttpSession session) throws IOException{
		System.out.println("인증번호 받은 이메일 : " +  email);
		
		String authNumber = mailService.getAuthNumber();
		System.out.println("인증 번호 : " + authNumber);
		
		String hashNumber = hash.getHash(authNumber);
		System.out.println("인증 해시값 : " + hashNumber);
		
		// 세션은 클라이언트당 한개의 객체가 생성되니까 세션에 저장해두면 다른 클라이언트와 섞일 일이 없다
		session.setAttribute("hashNumber", hashNumber);
		
		
		String account = null;
		
		String filePath = session.getServletContext().getRealPath("/WEB-INF/data/account.dat");
		File f = new File(filePath);
		
		if(f.exists() == false) {
			System.out.println("메일 전송에 필요한 계정 정보가 없습니다");
			return null;
		}
		
		Scanner sc = new Scanner(f);
		
		while(sc.hasNext()) {
			account = sc.nextLine();
		}
		sc.close();
		// controller에서는 정보를 모으는 역할
		
		// 메일 보내는건 service에서 처리
		
		// result가 인증번호
		String result = mailService.sendMail(email, authNumber, account);
		
		HashMap<String, String> ret = new HashMap<String, String>();
		
		if(result.equals(authNumber)) {
			ret.put("status", "OK");
			ret.put("message", "인증번호가 발송되었습니다");
		}
		else {
			ret.put("status","FAIL");
			ret.put("message","인증번호가 발송되지 않았습니다 ");
		}
		return ret;
	}
	
	
	@GetMapping("/ajaxAuth/{userNumber}")
	public HashMap<String, String> getAuthResult(@PathVariable String userNumber, HttpSession session){
		
//		String userNumber1 = String.valueOf(userNumber);
		String sessionHash = (String)session.getAttribute("hashNumber");
		String userHash = hash.getHash(userNumber);
		
		// 이렇게 hash 값으로 입력값과 인증번호를 비교한다
		boolean flag = userHash.equals(sessionHash);
		
		System.out.println(sessionHash);
		System.out.println(userHash);
		System.out.println(flag);
		
		HashMap<String, String> ret = new HashMap<String, String>();
		ret.put("status", flag ? "OK" : "Fail");
		ret.put("message", flag ? "인증이 완료되었습니다" : "인증번호를 다시 확인해주세요");
		
		return ret;
	}
	
	
	
}
