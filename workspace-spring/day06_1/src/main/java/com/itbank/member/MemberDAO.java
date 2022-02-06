package com.itbank.member;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberDAO {

	@Select("select * from member order by userid")
	List<MemberDTO> selectList();

	MemberDTO selectMember(MemberDTO dto);

}
