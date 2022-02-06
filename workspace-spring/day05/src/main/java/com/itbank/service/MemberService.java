package com.itbank.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.member.MemberDAO;
import com.itbank.member.MemberDTO;
import com.itbank.member.MemberTestDAO;
import com.itbank.model.LoginDAO;

@Service
public class MemberService {

	@Autowired private MemberDAO dao;
	@Autowired private MemberTestDAO tdao;
	@Autowired private LoginDAO ldao;
	public String getTest() {
		return tdao.selectVersion();
	}

	public Date getSysdate() {
		
		return tdao.selectSysdate();
	}

	public List<MemberDTO> getList() {
		return dao.selectList();
	}

	public List<MemberDTO> selectOrderBy(String order) {
		return dao.selectList(order);
	}

	public int insert(MemberDTO dto) {
		
		return dao.insert(dto);
	}

	public MemberDTO loginTest(MemberDTO dto) {
		return ldao.login(dto);
	}
}
