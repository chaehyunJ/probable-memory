package com.itbank.model;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderListDAO {

	@Select("select * from orderlist_table where "
			+ "orderdate=(select max(orderdate) from orderlist_table) "
			+ "and userid = #{ userid }")
	OrderListDTO seletOrderList(String userid);

}
