package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.NoticeDAO;
import com.itbank.model.NoticeDTO;
import com.itbank.model.QnaBoardDAO;
import com.itbank.model.QnaBoardDTO;
import com.itbank.model.ReplyDAO;
import com.itbank.model.ReplyDTO;

@Service
public class BoardService {

	@Autowired private NoticeDAO dao;
	@Autowired private QnaBoardDAO qdao;
	@Autowired private ReplyDAO rdao;
	
	
	public List<HashMap<String, Object>> getNotice(int offset) {
		return dao.selectNotice(offset);
	}

	public NoticeDTO getNews(int seq) {
		
		return dao.selectNews(seq);
	}

//	public int cntUpdate(int seq) {
//		return dao.cntUpdate(seq);
//	}

	public int cntUpdate(HashMap<String, Object> map) {
		return dao.cntUpdate(map);
	}

	public int qnaInsert(QnaBoardDTO dto) {
		return qdao.qnaInsert(dto);
	}

	public List<QnaBoardDTO> qnaList() {
		return qdao.qnaList();
	}

	// 미답변 QnA 가져오기
	public List<QnaBoardDTO> qnaCheck() {
		return qdao.qnaCheck();
	}

	public int replyInsert(ReplyDTO dto) {
		return rdao.insert(dto);
	}

	public int qnaResult(int seq) {
		return qdao.resultUpdate(seq);
	}

	public int qnaCount(String result) {
		
		return qdao.qnaCount(result);
	}

	public List<QnaBoardDTO> qnaList2(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return qdao.qnaList2(map);
	}

	

}
