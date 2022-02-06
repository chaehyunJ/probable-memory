package com.itbank.admin;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminDAO {

	@Select("select * from admin_table where adminid = #{adminid} and adminpw = #{adminpw}")
	AdminDTO loginAdmin(AdminDTO dto);
	
}
