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
	//spec
	double mngram, mnkcal, mnprotein, mnfat, mnsugar, mnnatrum;  	
	
	// Constructor
	public MenuDto() {
		// TODO Auto-generated constructor stub
	}
	// 메뉴.
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
	// 메뉴와 영양정보
	public MenuDto(int mncode, String mnctg, String mnname, String mnengname, String mninfo, String mnimg, int mnprice,
			double mngram, double mnkcal, double mnprotein, double mnfat, double mnsugar, double mnnatrum) {
		super();
		this.mncode = mncode;
		this.mnctg = mnctg;
		this.mnname = mnname;
		this.mnengname = mnengname;
		this.mninfo = mninfo;
		this.mnimg = mnimg;
		this.mnprice = mnprice;
		this.mngram = mngram;
		this.mnkcal = mnkcal;
		this.mnprotein = mnprotein;
		this.mnfat = mnfat;
		this.mnsugar = mnsugar;
		this.mnnatrum = mnnatrum;
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

	public double getMngram() {
		return mngram;
	}

	public void setMngram(double mngram) {
		this.mngram = mngram;
	}

	public double getMnkcal() {
		return mnkcal;
	}

	public void setMnkcal(double mnkcal) {
		this.mnkcal = mnkcal;
	}

	public double getMnprotein() {
		return mnprotein;
	}

	public void setMnprotein(double mnprotein) {
		this.mnprotein = mnprotein;
	}

	public double getMnfat() {
		return mnfat;
	}

	public void setMnfat(double mnfat) {
		this.mnfat = mnfat;
	}

	public double getMnsugar() {
		return mnsugar;
	}

	public void setMnsugar(double mnsugar) {
		this.mnsugar = mnsugar;
	}

	public double getMnnatrum() {
		return mnnatrum;
	}

	public void setMnnatrum(double mnnatrum) {
		this.mnnatrum = mnnatrum;
	}
	
}
