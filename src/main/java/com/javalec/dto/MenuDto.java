package com.javalec.dto;

/* ----------------------------------------
 *  Description : MenuDto
 *  Date        : 2024.02.06(Tue)
 *  Author      : sujin
 * ---------------------------------------- */

public class MenuDto {
	// Field
	int mncode; 
	String mnctg;
	String mnname; 
	String mnengname; 
	String mninfo; 
	String mnimg;
	int mnprice;
	
	// Constructor
	public MenuDto() {
		// TODO Auto-generated constructor stub
	}
	
	public MenuDto(int mncode, String mnctg, String mnname, String mnengname, String mninfo, String mnimg,
			int mnprice) {
		super();
		this.mncode = mncode;
		this.mnctg = mnctg;
		this.mnname = mnname;
		this.mnengname = mnengname;
		this.mninfo = mninfo;
		this.mnimg = mnimg;
		this.mnprice = mnprice;
	}


	// Method
	public int getMncode() {
		return mncode;
	}

	public void setMncode(int mncode) {
		this.mncode = mncode;
	}

	public int getMnprice() {
		return mnprice;
	}

	public void setMnprice(int mnprice) {
		this.mnprice = mnprice;
	}

	public String getMnctg() {
		return mnctg;
	}

	public void setMnctg(String mnctg) {
		this.mnctg = mnctg;
	}

	public String getMnname() {
		return mnname;
	}

	public void setMnname(String mnname) {
		this.mnname = mnname;
	}

	public String getMnengname() {
		return mnengname;
	}

	public void setMnengname(String mnengname) {
		this.mnengname = mnengname;
	}

	public String getMninfo() {
		return mninfo;
	}

	public void setMninfo(String mninfo) {
		this.mninfo = mninfo;
	}

	public String getMnimg() {
		return mnimg;
	}

	public void setMnimg(String mnimg) {
		this.mnimg = mnimg;
	}
	
}
