package com.javalec.dto;

public class IngredientDto {
	// Field
	int icode;
	String ictg;
	String iname;
	String iengname;
	String iinfo;
	String iimg;
	
//	double ikcal, iprotein, ifat, isugar, inatrum;
	
	// Constructor
	public IngredientDto() {
		super();
	}


	public IngredientDto(int icode, String ictg, String iname, String iengname, String iinfo, String iimg) {
		super();
		this.icode = icode;
		this.ictg = ictg;
		this.iname = iname;
		this.iengname = iengname;
		this.iinfo = iinfo;
		this.iimg = iimg;
	}
	

	//Method
	public int getIcode() {
		return icode;
	}

	public void setIcode(int icode) {
		this.icode = icode;
	}

	public String getIctg() {
		return ictg;
	}

	public void setIctg(String ictg) {
		this.ictg = ictg;
	}

	public String getIname() {
		return iname;
	}

	public void setIname(String iname) {
		this.iname = iname;
	}

	public String getIengname() {
		return iengname;
	}

	public void setIengname(String iengname) {
		this.iengname = iengname;
	}

	public String getIinfo() {
		return iinfo;
	}

	public void setIinfo(String iinfo) {
		this.iinfo = iinfo;
	}

	public String getIimg() {
		return iimg;
	}

	public void setIimg(String iimg) {
		this.iimg = iimg;
	}
	
}
