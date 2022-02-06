package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.member.MemberDAO;
import com.itbank.member.MemberDTO;
import com.itbank.model.BurgerDAO;
import com.itbank.model.BurgerDTO;
import com.itbank.promotion.PromDAO;
import com.itbank.promotion.PromDTO;

@Service
public class MenuService {

	@Autowired private PromDAO pdao;
	@Autowired private BurgerDAO bgdao;
	
	
	
	public List<PromDTO> getList() {
		return pdao.list();
	}

	public List<HashMap<String, Object>> getburgerList(String table) {
		return bgdao.list(table);
	}

	public List<HashMap<String, Object>> burList() {
		return bgdao.getList();
	}

	public int countList() {
		return bgdao.countList();
	}

	

}
