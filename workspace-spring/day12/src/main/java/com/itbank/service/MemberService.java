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
		
		return dao.selectMember(userid);
	}

	public List<MemberDTO> getMemberList() {
		
		return dao.selectMemberList();
	}

	public List<MemberDTO> getSearchMember(String username) {
		
		return dao.searchMember(username);
	}
}
