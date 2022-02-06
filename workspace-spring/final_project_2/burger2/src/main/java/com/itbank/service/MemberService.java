package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.member.MemberDAO;
import com.itbank.member.MemberDTO;

@Service
public class MemberService {
	
	@Autowired private MemberDAO dao;
	
	public String getAgreement(String path) throws IOException {
		String agreement = "";
		File f = new File(path);
		
		if(f.exists() == false) {
			System.out.println("파일이 없습니다");
			return null;
		}
		Scanner sc = new Scanner(f);
		
		while(sc.hasNextLine()) {
			agreement += sc.nextLine() + "\n";
		}
		sc.close();
		return agreement;
	}

	// 로그인
	public MemberDTO login(MemberDTO dto) {
		MemberDTO login = dao.login(dto);
		return login;
	}

	// 회원가입
	public int join(MemberDTO dto) {
		int row = dao.join(dto);
		return row;
	}

	// id확인
	public MemberDTO getMember(String userid) {
		return dao.selectMember(userid);
	}
	
	// id찾기
	public MemberDTO getMemberFindId(String email) {
		return dao.selectMemberFindId(email);
	}
	
	// 회원정보수정
	public int update(MemberDTO dto) {
		return dao.update(dto);
	}

	// 회원정보 불러오기
	public MemberDTO updatePage(String userid) {
		return dao.selectMember(userid);
	}
	
	// 비밀번호찾기
	public int updateFindPw(HashMap<String, String> map) {
		return dao.updateFindPw(map);
	}
}
