package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.member.MemberDAO;
import com.itbank.member.MemberDTO;

@Service
public class MemberService {

	@Autowired private MemberDAO dao;
	
	public List<MemberDTO> selectList() {
		List<MemberDTO> list = dao.selectList();
		
		for(MemberDTO dto : list) {
			String pw = dto.getUserpw();
			String pw1 = pw.charAt(0) + "";
			for(int i = 0; i < pw.length()-1; i++) {
				pw1 += "*";
			}
			dto.setUserpw(pw1);
		}
		
		return list;
	}

	public MemberDTO selectMember(MemberDTO dto) {
		MemberDTO login = dao.selectMember(dto);
		return login;
	}



}
