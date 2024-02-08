package com.javalec.dto;

public class BoardDTO {
	
	int bseq;
	String bnid;
	String title;
	String bcontent;
	String bdate;
	String bavailable;
	
	public int getBseq() {
		return bseq;
	}
	public void setBseq(int bseq) {
		this.bseq = bseq;
	}
	public String getBnid() {
		return bnid;
	}
	public void setBnid(String bnid) {
		this.bnid = bnid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public String getBavailable() {
		return bavailable;
	}
	public void setBavailable(String bavailable) {
		this.bavailable = bavailable;
	}
	
	

}
