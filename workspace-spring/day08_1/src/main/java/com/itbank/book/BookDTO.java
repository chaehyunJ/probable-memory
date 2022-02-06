package com.itbank.book;

//IDX         NOT NULL NUMBER         
//NAME        NOT NULL VARCHAR2(200)  
//AUTHOR      NOT NULL VARCHAR2(50)   
//PUBLISHER   NOT NULL VARCHAR2(50)   
//PUBLISHDATE NOT NULL DATE           
//PRICE       NOT NULL NUMBER         
//DESCRIPTION NOT NULL VARCHAR2(2000) 

public class BookDTO {

	
	private int idx;
	private String name;
	private String author;
	private String publisher;
	private String publishDate;
	private	int price;
	private String description;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}
