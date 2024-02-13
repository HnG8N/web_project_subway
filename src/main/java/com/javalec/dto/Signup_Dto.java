package com.javalec.dto;

public class Signup_Dto {
	
	String mid;
	int count;
	String mpw;
	String mname;
	String maddress;
	String mtel;
	String mbirth;
	String memail;
	
	public Signup_Dto() {
		
	}
	
	public Signup_Dto(int count) {
		this.count = count;
	}
	
	public Signup_Dto(String mid, String mpw, String mname, String maddress, String mtel, String mbirth,String memail) {
		this.mid = mid;
		this.mpw = mpw;
		this.mname = mname;
		this.maddress = maddress;
		this.mtel = mtel;
		this.mbirth = mbirth;
		this.memail = memail;
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}
	
	

}
