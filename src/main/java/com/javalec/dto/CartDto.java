package com.javalec.dto;
/* ----------------------------------------
 *  Description : MenuDto
 *  Date        : 2024.02.15(Thr) ver1.0 : 파일생성.
 *  Author      : sujin
 * ---------------------------------------- */
public class CartDto {
	// Field
	String omid; 
	int omncode; 
	int olength; 
	String obread; 
	String otoast; 
	String ocheese; 
	String ovegetables;
	String osauce; 
	int oprice;
	
	// Constructor
	public CartDto() {
		// TODO Auto-generated constructor stub
	}

	public CartDto(String omid, int omncode, int olength, String obread, String otoast, String ocheese,
			String ovegetables, String osauce, int oprice) {
		super();
		this.omid = omid;
		this.omncode = omncode;
		this.olength = olength;
		this.obread = obread;
		this.otoast = otoast;
		this.ocheese = ocheese;
		this.ovegetables = ovegetables;
		this.osauce = osauce;
		this.oprice = oprice;
	}

	// Method
	public String getOmid() {
		return omid;
	}

	public void setOmid(String omid) {
		this.omid = omid;
	}

	public int getOmncode() {
		return omncode;
	}

	public void setOmncode(int omncode) {
		this.omncode = omncode;
	}

	public int getOlength() {
		return olength;
	}

	public void setOlength(int olength) {
		this.olength = olength;
	}

	public String getObread() {
		return obread;
	}

	public void setObread(String obread) {
		this.obread = obread;
	}

	public String getOtoast() {
		return otoast;
	}

	public void setOtoast(String otoast) {
		this.otoast = otoast;
	}

	public String getOcheese() {
		return ocheese;
	}

	public void setOcheese(String ocheese) {
		this.ocheese = ocheese;
	}

	public String getOvegetables() {
		return ovegetables;
	}

	public void setOvegetables(String ovegetables) {
		this.ovegetables = ovegetables;
	}

	public String getOsauce() {
		return osauce;
	}

	public void setOsauce(String osauce) {
		this.osauce = osauce;
	}

	public int getOprice() {
		return oprice;
	}

	public void setOprice(int oprice) {
		this.oprice = oprice;
	}
	
}
