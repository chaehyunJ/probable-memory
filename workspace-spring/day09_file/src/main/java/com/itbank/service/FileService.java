package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.model.TestDAO;
import com.itbank.model.TestDTO;

@Service
public class FileService {
	
	@Autowired private TestDAO dao;
	
	private String uploadPath = "D:\\upload";
	private File dir;
	
	public FileService() {
		dir = new File(uploadPath);
		if(dir.exists() == false) {
			
			dir.mkdir();
		}
			
	}

	public boolean upload(MultipartFile file) throws IllegalStateException, IOException {
		File dest = new File(dir, file.getOriginalFilename());
		
		file.transferTo(dest);
		
		
		return dest.exists() && dest.isFile();
	}

	public int upload2(TestDTO dto) throws IllegalStateException, IOException {
		// DB에 넣어야 되니까 날짜활용
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		String fileName = dto.getUploadFile().getOriginalFilename();
//		String extName = fileName.substring(fileName.indexOf("."));
		fileName = today + "_" + fileName;
		
		File dest = new File(dir, fileName);
		dto.getUploadFile().transferTo(dest);
		
		dto.setFileName(fileName);
		
		 
		
		System.out.println("확장자 : " + fileName);
//		int row = dao.upload2(dto);
		
//		DB에 저장하는 대신 List에 저장하기 
		int row = dao.insert(dto);
		return row;
	}

	public List<TestDTO> selectList() {
		List<TestDTO> list = dao.selectList();
		return list;
	}

}
