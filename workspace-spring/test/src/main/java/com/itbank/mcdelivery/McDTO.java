package com.itbank.mcdelivery;

//
//idx     number              default MC_SEQ.nextval primary key,
//name    varchar2(1000)       not null,
//price   number              not null,
//kcal    number              not null,
//img     varchar2(3000)      not null
public class McDTO {

	private int idx, price, kcal;
	private String name, img;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getKcal() {
		return kcal;
	}
	public void setKcal(int kcal) {
		this.kcal = kcal;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	
}
