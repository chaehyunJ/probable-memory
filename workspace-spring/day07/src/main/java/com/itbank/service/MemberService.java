package com.itbank.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.member.MemberDAO;
import com.itbank.member.MemberDTO;

@Service
public class MemberService {

	@Autowired private MemberDAO dao;
	
	public List<MemberDTO> getMemberList() {
		List<MemberDTO> list = dao.selectList();
		
		// 리스트 내부의 각 객체에 대해서, 비밀번호의 첫글자를 제외한 나머지를 *로 변경하여 반환
		
		for(MemberDTO dto : list) {
			
			// pw : 1234
			String pw =  dto.getUserpw();
			
			// pw1 : 1 + "";
			String pw1 = pw.charAt(0) + "";
			for(int i = 1; i < pw.length(); i++) {
				pw1 += "*";
			}
			dto.setUserpw(pw1);
			
			
			
		}
		
		return list;
	}

	public MemberDTO login(MemberDTO dto) {
		MemberDTO login = dao.selectMember(dto);
		System.out.println("비밀번호로 찾은 계정 : " + login);
		return login;
	}

	public int memberAdd(MemberDTO dto) {
		int row = dao.insert(dto);
		return row;
	}

	public MemberDTO findMemberByEmail(MemberDTO dto) {
		MemberDTO target = dao.selectMember(dto);
		System.out.println("이메일로 찾은 계정 : " + target);
		return target;
	}

	public String newPass(MemberDTO target) {
		String newPass = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 8);
		
		System.out.println("UUID : " + UUID.randomUUID());
		System.out.println("UUID.toString : " + UUID.randomUUID().toString());
		System.out.println("UUID.toString.replaceAll : " + newPass);
		
		target.setUserpw(newPass);
		
		int row = dao.update(target);
		
		if(row == 1) {
			return newPass;
		}
		else {
			return null;
		}
		
	}



}
