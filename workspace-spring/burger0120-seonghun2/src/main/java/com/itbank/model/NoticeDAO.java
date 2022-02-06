package com.itbank.model;

import org.apache.ibatis.annotations.Insert;

public interface NoticeDAO {
	
	@Insert("insert into notice_table (title, writer, content, fileName, cnt, flag) values ("
			+ "#{title},"
			+ "#{writer},"
			+ "#{content},"
			+ "#{fileName},"
			+ "#{cnt},"
			+ "#{flag})")
	int insert(NoticeDTO dto);
}
