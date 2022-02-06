package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.mcdelivery.McDAO;
import com.itbank.mcdelivery.McDTO;


@Service
public class McService {

	@Autowired private McDAO dao;
	
	public List<McDTO> getList() {
		
		return dao.list();
	}

}
