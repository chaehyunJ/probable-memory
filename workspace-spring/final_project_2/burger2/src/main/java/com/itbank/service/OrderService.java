package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.OrderListDAO;
import com.itbank.model.OrderListDTO;

@Service
public class OrderService {

	@Autowired private OrderListDAO dao;
	
	public OrderListDTO orderlistPage(String userid) {
		return dao.seletOrderList(userid);
	}

}
