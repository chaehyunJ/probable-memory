package com.itbank.member;

//user_seq	number			    default user_seq.nextval,
//userid		varchar2(500)		primary key,
//userpw		varchar2(500)		not null,
//username	varchar2(500)		not null,
//phone		varchar2(500)		not null,
//email		varchar2(800)		not null,
//usergrade	varchar2(100)		not null,
//address 	varchar2(1000)		not null

public class MemberDTO {

	private String userid, userpw, username, phone, email, usergrade, address;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsergrade() {
		return usergrade;
	}

	public void setUsergrade(String usergrade) {
		this.usergrade = usergrade;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
