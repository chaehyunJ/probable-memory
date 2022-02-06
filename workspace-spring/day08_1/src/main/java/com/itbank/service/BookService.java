package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.book.BookDAO;
import com.itbank.book.BookDTO;

@Service
public class BookService {
	
	@Autowired private BookDAO dao;
	
	public List<BookDTO> selectList() {
		List<BookDTO> list = dao.selectList();
		return list;
	}

	public List<BookDTO> selectOrder(HashMap<String, String> map) {
		List<BookDTO> list = dao.selectOrder(map);
		
		return list;
	}

	public int delete(int idx) {
		int row = dao.delete(idx);
		return row;
	}

	public BookDTO selectOne(int idx) {
		BookDTO dto = dao.selectOne(idx);
		return dto;
	}

	public int modify(BookDTO dto) {
		int row = dao.modify(dto);
		return row;
	}



}
