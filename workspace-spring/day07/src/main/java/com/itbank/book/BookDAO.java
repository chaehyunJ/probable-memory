package com.itbank.book;

import java.util.List;

public interface BookDAO {

	List<BookDTO> selectList();

	List<BookDTO> selectOrder(String order);

}
