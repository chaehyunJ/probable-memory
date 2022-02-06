package com.itbank.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface QnaBoardDAO {

	int qnaInsert(QnaBoardDTO dto);

	@Select("select * from qnaboard_table")
	List<QnaBoardDTO> qnaList();

	@Select("select * from qnaboard_table where result = 'n'")
	List<QnaBoardDTO> qnaCheck();

	@Update("update qnaboard_table set result = 'y' where qna_seq = #{ seq }")
	int resultUpdate(int seq);

	int qnaCount(String result);

	List<QnaBoardDTO> qnaList2(HashMap<String, Object> map);

}
