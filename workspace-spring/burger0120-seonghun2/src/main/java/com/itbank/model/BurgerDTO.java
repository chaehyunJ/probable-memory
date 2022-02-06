package com.itbank.model;

//BURGER_SEQ                 NOT NULL NUMBER         
//BURGER_DESCRIPTION         NOT NULL VARCHAR2(3000) 
//BURGER_SET_DESCRIPTION              VARCHAR2(3000) 
//BURGER_NAME                NOT NULL VARCHAR2(1000) 
//BURGER_SET_NAME                     VARCHAR2(1000) 
//BURGER_IMAGE               NOT NULL VARCHAR2(1000) 
//BURGER_SET_IMAGE                    VARCHAR2(1000) 
//BURGER_PRICE               NOT NULL NUMBER         
//BURGER_SET_PRICE                    NUMBER         
//MCLUNCH_PRICE                       NUMBER         
//SALES_TIME                          VARCHAR2(500)  
//BURGER_WEIGHT_G                     NUMBER         
//BURGER_KCAL                         NUMBER         
//BURGER_SET_KCAL                     NUMBER         
//BURGER_SUGAR                        NUMBER         
//NUTRIENT_STANDARDS_SUGAR            NUMBER         
//BURGER_PROTEIN                      NUMBER         
//NUTRIENT_STANDARDS_PROTEIN          NUMBER         
//BURGER_FAT                          NUMBER         
//NUTRIENT_STANDARDS_FAT              NUMBER         
//BURGER_NATRIUM                      NUMBER         
//NUTRIENT_STANDARDS_NATRIUM          NUMBER         
//ALLERGY_INFO               NOT NULL VARCHAR2(3000)

public class BurgerDTO {

	private int burger_seq, burger_price, burger_set_price, mclunch_price, burger_weight_g,
				burger_kcal, burger_set_kcal, burger_sugar, nutrient_standards_sugar,
				burger_fat, nutrient_standards_fat, burger_natrium, nutrient_standards_natrium;
	
	private String burger_description, burger_set_description, burger_name, burger_set_name,
					burger_image, burger_set_image;

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

	public int getBurger_weight_g() {
		return burger_weight_g;
	}

	public int getBurger_kcal() {
		return burger_kcal;
	}

	public int getBurger_set_kcal() {
		return burger_set_kcal;
	}

	public int getBurger_sugar() {
		return burger_sugar;
	}

	public int getNutrient_standards_sugar() {
		return nutrient_standards_sugar;
	}

	public int getBurger_fat() {
		return burger_fat;
	}

	public int getNutrient_standards_fat() {
		return nutrient_standards_fat;
	}

	public int getBurger_natrium() {
		return burger_natrium;
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

	public String getBurger_image() {
		return burger_image;
	}

	public String getBurger_set_image() {
		return burger_set_image;
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

	public void setBurger_weight_g(int burger_weight_g) {
		this.burger_weight_g = burger_weight_g;
	}

	public void setBurger_kcal(int burger_kcal) {
		this.burger_kcal = burger_kcal;
	}

	public void setBurger_set_kcal(int burger_set_kcal) {
		this.burger_set_kcal = burger_set_kcal;
	}

	public void setBurger_sugar(int burger_sugar) {
		this.burger_sugar = burger_sugar;
	}

	public void setNutrient_standards_sugar(int nutrient_standards_sugar) {
		this.nutrient_standards_sugar = nutrient_standards_sugar;
	}

	public void setBurger_fat(int burger_fat) {
		this.burger_fat = burger_fat;
	}

	public void setNutrient_standards_fat(int nutrient_standards_fat) {
		this.nutrient_standards_fat = nutrient_standards_fat;
	}

	public void setBurger_natrium(int burger_natrium) {
		this.burger_natrium = burger_natrium;
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

	public void setBurger_image(String burger_image) {
		this.burger_image = burger_image;
	}

	public void setBurger_set_image(String burger_set_image) {
		this.burger_set_image = burger_set_image;
	}
	
}
