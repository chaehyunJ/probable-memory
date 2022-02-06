package com.itbank.book;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

public interface BookDAO {

	List<BookDTO> selectList();

	List<BookDTO> selectOrder(HashMap<String, String> param);

	@Delete("delete from book where idx = #{idx}")
	int delete(int idx);

	@Select("select * from book where idx = #{idx}")
	BookDTO selectOne(int idx);

	int modify(BookDTO dto);

	int add(BookDTO dto);

}
