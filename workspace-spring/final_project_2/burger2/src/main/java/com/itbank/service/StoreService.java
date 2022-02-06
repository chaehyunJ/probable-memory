package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.StoreInfoDAO;
import com.itbank.model.StoreInfoDTO;

@Service
public class StoreService {

	@Autowired private StoreInfoDAO dao;
	
	public List<StoreInfoDTO> getStore(String info) {
		return dao.selectStore(info);
	}

}
