package com.itbank.member;

import java.util.HashMap;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.itbank.admin.AdminDTO;

@Repository
public interface MemberDAO {

	@Select("select * from user_table where userid = #{ userid } and userpw = #{ userpw }")
	MemberDTO login(MemberDTO dto);

	@Select("select * from user_table where userid = #{ userid }")
	MemberDTO selectMember(String userid);

	@Select("select * from user_table where email = #{ email}")
	MemberDTO selectMemberFindId(String email);
	
	int join(MemberDTO dto);

	@Update("update user_table set  "
			+ "userpw=#{userpw},"
			+ "username=#{username},"
			+ "gender=#{gender},"
			+ "phone=#{phone},"
			+ "email=#{email},"
			+ "address=#{address}"
			+ "where userid = #{ userid }")
	int update(MemberDTO dto);

	@Select("select * from user_table where userpw = #{pw1}")
	MemberDTO chkPw(String pw1);


	@Update("update user_table set userpw = #{ userpw } where email = #{ email }")
	int updateFindPw(HashMap<String, String> map);

	@Select("select * from user_table where email = #{ email}")
	MemberDTO mailChk(String email);
	
}
