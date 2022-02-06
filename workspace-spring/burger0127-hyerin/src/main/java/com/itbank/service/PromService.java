package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.promotion.PromDAO;
import com.itbank.promotion.PromDTO;

@Service
public class PromService {

	@Autowired private PromDAO pdao;
	
	public List<PromDTO> getList() {
		return pdao.list();
	}

}
