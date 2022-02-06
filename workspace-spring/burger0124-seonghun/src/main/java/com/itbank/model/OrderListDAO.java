package com.itbank.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderListDAO {

	@Select("select * from orderlist_table where "
			+ "orderdate=(select max(orderdate) from orderlist_table) "
			+ "and userid = #{ userid }")
	OrderListDTO seletOrderList(String userid);

	@Insert("insert into orderlist_table (menus, price, paystatus, orderstatus, total, count,userid,orderaddress,phone) "
			+ "values(#{menus}, #{price}, #{paystatus}, #{orderstatus}, #{total}, #{count},#{userid},#{orderaddress},#{phone})")
	int payment(HashMap<String, String> map);

	@Select("select * from orderlist_table where userid = #{ userid } order by orderseq desc")
	List<OrderListDTO> selectList(String userid);

}
