package com.itbank.mcdelivery;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface McDAO {

	@Select("select * from mcdelivery order by idx")
	List<McDTO> list();

}
