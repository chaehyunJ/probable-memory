package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.menu.MenuDAO;

@Service
public class MenuService {
	
	@Autowired private MenuDAO mdao;

	public List<HashMap<String, Object>> getMenuList(String table) {
		return mdao.selectMenuList(table);
	}

	public List<HashMap<String, Object>> getTopList(String table) {
		return mdao.selectTopList(table);
	}

	public List<HashMap<String, Object>> getDetailList(String table, int seq) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("table", table);
		map.put("seq",seq);
		return mdao.selectDtailList(map);
	}

}
