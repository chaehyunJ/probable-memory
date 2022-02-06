package com.itbank.menu;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface MenuDAO {
	
	@Select("select * from ${table}")
	List<HashMap<String, Object>> selectMenuList(String table);
	
	@Select("select ${table}_description, ${table}_background from menutop_table")
	List<HashMap<String, Object>> selectTopList(String table);

	@Select("select * from ${table}TABLE where ${table}SEQ = ${seq}")
	List<HashMap<String, Object>> selectDtailList(HashMap<String, Object> map);
//	@Param("table")String table, @Param("seq") int seq
}
