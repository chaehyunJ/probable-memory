package com.itbank.service;

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

	public List<BookDTO> selectOrder(String order) {
		List<BookDTO> list = dao.selectOrder(order);
		
		return list;
	}


}
