package com.itbank.service;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.NoticeDAO;
import com.itbank.model.NoticeDTO;

@Service
public class FileService {
	
	@Autowired private NoticeDAO dao;

	private String uploadPath = "C://upload";  
	private File dir;
	
	public FileService() {
		dir = new File(uploadPath);
		if(dir.exists() == false) {
			System.out.println("폴더가 없어서 새로 생성함");
			dir.mkdirs();
		}
	}
	
	public int upload(NoticeDTO dto) throws IllegalStateException, IOException {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		String fileName = dto.getUploadFile().getOriginalFilename();
		fileName = today + "_" + fileName;
		
		File dest = new File(dir, fileName);
		dto.getUploadFile().transferTo(dest);
		
		dto.setFileName(fileName);
		
		return dao.insert(dto);
	}
}













