package com.itbank.member;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberDAO {

	
	@Select("select * from member where userid = #{userid}")
	MemberDTO selectMember(String userid);

	@Select("select * from member order by userid")
	List<MemberDTO> selectMemberList();

//	@Select("select * from member where username like '%${username}%' order by username ")
	List<MemberDTO> searchMember(String username);

}
