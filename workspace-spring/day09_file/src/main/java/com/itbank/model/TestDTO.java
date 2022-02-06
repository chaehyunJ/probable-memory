package com.itbank.model;

import org.springframework.web.multipart.MultipartFile;

public class TestDTO {

	
	private String name;				// input name="name"
	private int age;					// input name="age"
	private MultipartFile uploadFile;	// input name="uploadFile"
	private String fileName;			// getName() 함수가 파일의 이름을 반환하도록 설정
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return String.format("%s %s %s %s", name, age, uploadFile, fileName);
	}
}
