package com.itbank.member;

import java.sql.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberTestDAO {

	@Autowired private SqlSessionTemplate sst;
	
	// DB의 버전 정보를 String으로 반환하는 함수를 작성
	
	public String selectVersion() {
		String statement = "test1";					// test1 이라는 id의 mapper 코드를 호출
		String test=  sst.selectOne(statement);		// 지정한 sql로 하나의 문자열을 반환하겠다
		return test;								// DB에서 받은 내용을 Service로 반환
	}
	
	public Date selectSysdate() {
		String statement = "now";
		return sst.selectOne(statement);
	}


}
