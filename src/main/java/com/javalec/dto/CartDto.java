package com.javalec.dto;
/* ----------------------------------------
 *  Description : MenuDto
 *  Date        : 2024.02.15(Thr) ver1.0 : 파일생성.
 *  Author      : sujin
 * ---------------------------------------- */
public class CartDto {
	// Field
	int cseq;
	String cmid; 
	int cmncode; 
	
	String mnctg;
	String mnname;
	String mnimg;
	int mnprice;
	
	int clength; 
	String cbread; 
	String ctoast; 
	String ccheese; 
	String cvegetables;
	String csauce; 
	int cprice;
	int cqty;
	
	// Constructor
	public CartDto() {
		// TODO Auto-generated constructor stub
	}
	
	// 데이터 입력을 위한 생성자.
	public CartDto(String cmid, int cmncode, int clength, String cbread, String ctoast, String ccheese,
			String cvegetables, String csauce, int cprice, int cqty) {
		super();
		this.cmid = cmid;
		this.cmncode = cmncode;
		this.clength = clength;
		this.cbread = cbread;
		this.ctoast = ctoast;
		this.ccheese = ccheese;
		this.cvegetables = cvegetables;
		this.csauce = csauce;
		this.cprice = cprice;
		this.cqty = cqty;
	}

	// 데이터를 가져오기 위한 생성자.
	public CartDto(int cseq, String cmid, int cmncode, String mnctg, String mnname, String mnimg, int mnprice,
			int clength, String cbread, String ctoast, String ccheese, String cvegetables, String csauce, int cprice,
			int cqty) {
		super();
		this.cseq = cseq;
		this.cmid = cmid;
		this.cmncode = cmncode;
		this.mnctg = mnctg;
		this.mnname = mnname;
		this.mnimg = mnimg;
		this.mnprice = mnprice;
		this.clength = clength;
		this.cbread = cbread;
		this.ctoast = ctoast;
		this.ccheese = ccheese;
		this.cvegetables = cvegetables;
		this.csauce = csauce;
		this.cprice = cprice;
		this.cqty = cqty;
	}

	public int getCseq() {
		return cseq;
	}

	public void setCseq(int cseq) {
		this.cseq = cseq;
	}

	public String getCmid() {
		return cmid;
	}

	public void setCmid(String cmid) {
		this.cmid = cmid;
	}

	public int getCmncode() {
		return cmncode;
	}

	public void setCmncode(int cmncode) {
		this.cmncode = cmncode;
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

	public String getMnimg() {
		return mnimg;
	}

	public void setMnimg(String mnimg) {
		this.mnimg = mnimg;
	}

	public int getMnprice() {
		return mnprice;
	}

	public void setMnprice(int mnprice) {
		this.mnprice = mnprice;
	}

	public int getClength() {
		return clength;
	}

	public void setClength(int clength) {
		this.clength = clength;
	}

	public String getCbread() {
		return cbread;
	}

	public void setCbread(String cbread) {
		this.cbread = cbread;
	}

	public String getCtoast() {
		return ctoast;
	}

	public void setCtoast(String ctoast) {
		this.ctoast = ctoast;
	}

	public String getCcheese() {
		return ccheese;
	}

	public void setCcheese(String ccheese) {
		this.ccheese = ccheese;
	}

	public String getCvegetables() {
		return cvegetables;
	}

	public void setCvegetables(String cvegetables) {
		this.cvegetables = cvegetables;
	}

	public String getCsauce() {
		return csauce;
	}

	public void setCsauce(String csauce) {
		this.csauce = csauce;
	}
	

	public int getCprice() {
		return cprice;
	}

	public void setCprice(int cprice) {
		this.cprice = cprice;
	}

	public int getCqty() {
		return cqty;
	}

	public void setCqty(int cqty) {
		this.cqty = cqty;
	}
	
	

	
}
