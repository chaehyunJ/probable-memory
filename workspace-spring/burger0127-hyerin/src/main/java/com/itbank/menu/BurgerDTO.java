package com.itbank.menu;

//BURGER_SEQ				NOT NULL NUMBER         
//BURGER_DESCRIPTION        NOT NULL VARCHAR2(3000) 
//BURGER_SET_DESCRIPTION			 VARCHAR2(3000) 
//BURGER_NAME               NOT NULL VARCHAR2(1000) 
//BURGER_SET_NAME                    VARCHAR2(1000) 
//BURGER_IMG               	NOT NULL VARCHAR2(1000) 
//BURGER_SET_IMG                     VARCHAR2(1000) 
//BURGER_PRICE              NOT NULL NUMBER         
//BURGER_SET_PRICE                   NUMBER         
//MCLUNCH_PRICE                      NUMBER         
//SALES_TIME                         VARCHAR2(500)  
//WEIGHT_G                    		 NUMBER         
//KCAL                         		 NUMBER         
//SET_KCAL                     		 NUMBER         
//SUGAR                        		 NUMBER         
//NUTRIENT_STANDARDS_SUGAR           NUMBER         
//PROTEIN                      		 NUMBER         
//NUTRIENT_STANDARDS_PROTEIN         NUMBER         
//FAT                          		 NUMBER         
//NUTRIENT_STANDARDS_FAT             NUMBER         
//NATRIUM                      		 NUMBER         
//NUTRIENT_STANDARDS_NATRIUM         NUMBER         
//ALLERGY_INFO              NOT NULL VARCHAR2(3000)

public class BurgerDTO {

	private int burger_seq, burger_price, burger_set_price, mclunch_price, weight_g,
				kcal, set_kcal, sugar, nutrient_standards_sugar,
				fat, nutrient_standards_fat, natrium, nutrient_standards_natrium;
	
	private String burger_description, burger_set_description, burger_name, burger_set_name,
					burger_img, burger_set_img;

	public int getBurger_seq() {
		return burger_seq;
	}

	public int getBurger_price() {
		return burger_price;
	}

	public int getBurger_set_price() {
		return burger_set_price;
	}

	public int getMclunch_price() {
		return mclunch_price;
	}

	public int getweight_g() {
		return weight_g;
	}

	public int getkcal() {
		return kcal;
	}

	public int getset_kcal() {
		return set_kcal;
	}

	public int getsugar() {
		return sugar;
	}

	public int getNutrient_standards_sugar() {
		return nutrient_standards_sugar;
	}

	public int getfat() {
		return fat;
	}

	public int getNutrient_standards_fat() {
		return nutrient_standards_fat;
	}

	public int getnatrium() {
		return natrium;
	}

	public int getNutrient_standards_natrium() {
		return nutrient_standards_natrium;
	}

	public String getBurger_description() {
		return burger_description;
	}

	public String getBurger_set_description() {
		return burger_set_description;
	}

	public String getBurger_name() {
		return burger_name;
	}

	public String getBurger_set_name() {
		return burger_set_name;
	}

	public String getBurger_img() {
		return burger_img;
	}

	public String getBurger_set_img() {
		return burger_set_img;
	}

	public void setBurger_seq(int burger_seq) {
		this.burger_seq = burger_seq;
	}

	public void setBurger_price(int burger_price) {
		this.burger_price = burger_price;
	}

	public void setBurger_set_price(int burger_set_price) {
		this.burger_set_price = burger_set_price;
	}

	public void setMclunch_price(int mclunch_price) {
		this.mclunch_price = mclunch_price;
	}

	public void setweight_g(int weight_g) {
		this.weight_g = weight_g;
	}

	public void setkcal(int kcal) {
		this.kcal = kcal;
	}

	public void setset_kcal(int set_kcal) {
		this.set_kcal = set_kcal;
	}

	public void setsugar(int sugar) {
		this.sugar = sugar;
	}

	public void setNutrient_standards_sugar(int nutrient_standards_sugar) {
		this.nutrient_standards_sugar = nutrient_standards_sugar;
	}

	public void setfat(int fat) {
		this.fat = fat;
	}

	public void setNutrient_standards_fat(int nutrient_standards_fat) {
		this.nutrient_standards_fat = nutrient_standards_fat;
	}

	public void setnatrium(int natrium) {
		this.natrium = natrium;
	}

	public void setNutrient_standards_natrium(int nutrient_standards_natrium) {
		this.nutrient_standards_natrium = nutrient_standards_natrium;
	}

	public void setBurger_description(String burger_description) {
		this.burger_description = burger_description;
	}

	public void setBurger_set_description(String burger_set_description) {
		this.burger_set_description = burger_set_description;
	}

	public void setBurger_name(String burger_name) {
		this.burger_name = burger_name;
	}

	public void setBurger_set_name(String burger_set_name) {
		this.burger_set_name = burger_set_name;
	}

	public void setBurger_img(String burger_img) {
		this.burger_img = burger_img;
	}

	public void setBurger_set_img(String burger_set_img) {
		this.burger_set_img = burger_set_img;
	}
	
}
