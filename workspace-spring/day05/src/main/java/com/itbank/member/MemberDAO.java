package com.itbank.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired private SqlSessionTemplate sst;

	public List<MemberDTO> selectList() {
		List<MemberDTO> list = sst.selectList("itbank");
		
//		sst.selectList(statement);
//		별도의 매개변수 전달 없이 id만으로 호출하는 방식
		
//		sst.selectList(statement, parameter);
//		parameter가 object타입이라서 dto나 HashMap타입으로 지정해서 전달하면 된다
		
//		sst.selectList(statement, parameter, rowBounds);
//		파라미터를 전달하면서 결과를 myBatis에 의해서 페이징 처리하여 가져온다
//		rowBounds가 새로 객체를 만들어서 처리해준다
		
		return list;
	}

	public List<MemberDTO> selectList(String order) {
		
//		sst.selectList(statement, parameter);
//		parameter가 object타입이라서 dto나 HashMap타입으로 지정해서 전달하면 된다
		List<MemberDTO> list = sst.selectList("selectOrder", order);
		return list;
	}

	public int insert(MemberDTO dto) {
		int row = sst.insert("insert", dto);
		return row;
	}
	
	
}
