package com.javalec.dto;

public class Login_Dto {

	String id;
	String pw;

	public Login_Dto() {

	}
	
	public Login_Dto(String pw) {
		this.pw = pw;
	}

	public Login_Dto(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}
}
