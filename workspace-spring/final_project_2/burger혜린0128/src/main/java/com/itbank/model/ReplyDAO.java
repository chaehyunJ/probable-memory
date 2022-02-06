package com.itbank.model;

import org.apache.ibatis.annotations.Insert;

public interface ReplyDAO {

	@Insert("insert into reply_table values (reply_seq.nextval, #{ board_idx }, #{ writer }, #{ content }, sysdate)")
	int insert(ReplyDTO dto);

}
