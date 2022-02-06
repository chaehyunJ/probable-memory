package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.member.MemberDAO;
import com.itbank.member.MemberDTO;

@Service
public class MemberService {

	@Autowired private MemberDAO dao;
	
	public MemberDTO getMember(String userid) {
		return dao.getMember(userid);
	}

	public List<MemberDTO> getMeberList() {
		return dao.memberList();
	}

	public List<MemberDTO> getSearchMember(String username) {
		return dao.searchMember(username);
	}

}
