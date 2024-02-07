package com.javalec.dto;

public class Signup_Dto {
	
	String mid;
	int dupmid;
	String mpw;
	String mname;
	String maddress;
	String mtel;
	String mbirth;
	
	public Signup_Dto() {
		
	}
	
	public Signup_Dto(int dupmid) {
		this.dupmid = dupmid;
	}
	
	public Signup_Dto(String mid, String mpw, String mname, String maddress, String mtel, String mbirth) {
		this.mid = mid;
		this.mpw = mpw;
		this.mname = mname;
		this.maddress = maddress;
		this.mtel = mtel;
		this.mbirth = mbirth;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpw() {
		return mpw;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMaddress() {
		return maddress;
	}

	public void setMaddress(String maddress) {
		this.maddress = maddress;
	}

	public String getMtel() {
		return mtel;
	}

	public void setMtel(String mtel) {
		this.mtel = mtel;
	}

	public String getMbirth() {
		return mbirth;
	}

	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}

	public int getDupmid() {
		return dupmid;
	}

	public void setDupmid(int dupmid) {
		this.dupmid = dupmid;
	}

}
