package com.itbank.model;

import org.apache.ibatis.annotations.Insert;

public interface UploadDAO {

	@Insert("insert into sftp values (#{uploadFilePath})")
	int insert(SftpDTO dto);

}
