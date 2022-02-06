package com.itbank.member;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface MemberDAO {

	
	@Select("select * from member where userid = #{userid}")
	MemberDTO getMember(String userid);

	@Select("select * from member order by userid")
	List<MemberDTO> memberList();

	@Select("select * from member where username like '%${username}%'")
	List<MemberDTO> searchMember(String username);

}
