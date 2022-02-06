package com.itbank.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;


// @Repository 는 내부에서 발생하는 모든 예외를 DataExcessException 으로 처리하는 특징이 있다
@Component
public class TestDAO {

	// 스프링 빈이므로 서버가 재시작하면 내부 데이터가 초기화된다. (영속성 X)
	private ArrayList<TestDTO> list = new ArrayList<TestDTO>();

	public int insert(TestDTO dto) {
		boolean result = list.add(dto);
		System.out.println("리스트에 들어있는 객체의 수 : " + list.size());
		return result ? 1 : 0;
	}

	public List<TestDTO> selectList() {

		return list;
	} 
}
