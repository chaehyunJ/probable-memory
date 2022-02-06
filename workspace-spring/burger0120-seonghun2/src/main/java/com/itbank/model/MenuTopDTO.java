package com.itbank.model;

//menutop_seq			        number		    default menutop_seq.nextval primary key,
//burger_table_description	varchar2(1000)	not null,
//burger_background		    varchar2(1000)	not null,
//mcmorning_table_description	varchar2(1000)	not null,
//mcmorning_background		varchar2(1000)	not null,
//side_table_description		varchar2(1000)	not null,
//side_background			    varchar2(1000)	not null,
//drink_table_description		varchar2(1000)	not null,
//drink_background		    varchar2(1000)	not null,
//dessert_table_description	varchar2(1000)	not null,
//dessert_background		    varchar2(1000)	not null,
//mccafe_table_description	varchar2(1000)	not null,
//mccafe_background		    varchar2(1000)	not null

public class MenuTopDTO {

	private String burger_table_description, burger_background,
					mcmorning_table_description, mcmorning_background,
					side_table_description, side_background,
					drink_table_description, drink_background,
					dessert_table_description, dessert_background,
					mccafe_table_description, mccafe_background;

	public String getBurger_table_description() {
		return burger_table_description;
	}

	public void setBurger_table_description(String burger_table_description) {
		this.burger_table_description = burger_table_description;
	}

	public String getBurger_background() {
		return burger_background;
	}

	public void setBurger_background(String burger_background) {
		this.burger_background = burger_background;
	}

	public String getMcmorning_table_description() {
		return mcmorning_table_description;
	}

	public void setMcmorning_table_description(String mcmorning_table_description) {
		this.mcmorning_table_description = mcmorning_table_description;
	}

	public String getMcmorning_background() {
		return mcmorning_background;
	}

	public void setMcmorning_background(String mcmorning_background) {
		this.mcmorning_background = mcmorning_background;
	}

	public String getSide_table_description() {
		return side_table_description;
	}

	public void setSide_table_description(String side_table_description) {
		this.side_table_description = side_table_description;
	}

	public String getSide_background() {
		return side_background;
	}

	public void setSide_background(String side_background) {
		this.side_background = side_background;
	}

	public String getDrink_table_description() {
		return drink_table_description;
	}

	public void setDrink_table_description(String drink_table_description) {
		this.drink_table_description = drink_table_description;
	}

	public String getDrink_background() {
		return drink_background;
	}

	public void setDrink_background(String drink_background) {
		this.drink_background = drink_background;
	}

	public String getDessert_table_description() {
		return dessert_table_description;
	}

	public void setDessert_table_description(String dessert_table_description) {
		this.dessert_table_description = dessert_table_description;
	}

	public String getDessert_background() {
		return dessert_background;
	}

	public void setDessert_background(String dessert_background) {
		this.dessert_background = dessert_background;
	}

	public String getMccafe_table_description() {
		return mccafe_table_description;
	}

	public void setMccafe_table_description(String mccafe_table_description) {
		this.mccafe_table_description = mccafe_table_description;
	}

	public String getMccafe_background() {
		return mccafe_background;
	}

	public void setMccafe_background(String mccafe_background) {
		this.mccafe_background = mccafe_background;
	}
	
	
}
