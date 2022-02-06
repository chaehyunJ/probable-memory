package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.NoticeDAO;
import com.itbank.model.NoticeDTO;

@Service
public class BoardService {

	@Autowired private NoticeDAO dao;
	
	public List<HashMap<String, Object>> getNotice(int offset) {
		return dao.selectNotice(offset);
	}

	public NoticeDTO getNews(int seq) {
		
		return dao.selectNews(seq);
	}

//	public int cntUpdate(int seq) {
//		return dao.cntUpdate(seq);
//	}

	public int cntUpdate(HashMap<String, Object> map) {
		return dao.cntUpdate(map);
	}

	

}
