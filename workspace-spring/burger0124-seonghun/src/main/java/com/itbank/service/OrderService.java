package com.itbank.service;

import java.util.HashMap;
import java.util.List;

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
	
	public int payment(HashMap<String,String> map) {
		return dao.payment(map);
	}

	public List<OrderListDTO> selectList(String userid) {
		return dao.selectList(userid);
	}

}
