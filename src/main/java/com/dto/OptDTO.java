package com.dto;

public class OptDTO {
	int optno;
	String optnm;
	int optprice;
	int ctno;
	public OptDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OptDTO(int optno, String optnm, int optprice, int ctno) {
		super();
		this.optno = optno;
		this.optnm = optnm;
		this.optprice = optprice;
		this.ctno = ctno;
	}
	@Override
	public String toString() {
		return "OptDTO [optno=" + optno + ", optnm=" + optnm + ", optprice=" + optprice + ", ctno=" + ctno + "]";
	}
	public int getOptno() {
		return optno;
	}
	public void setOptno(int optno) {
		this.optno = optno;
	}
	public String getOptnm() {
		return optnm;
	}
	public void setOptnm(String optnm) {
		this.optnm = optnm;
	}
	public int getOptprice() {
		return optprice;
	}
	public void setOptprice(int optprice) {
		this.optprice = optprice;
	}
	public int getCtno() {
		return ctno;
	}
	public void setCtno(int ctno) {
		this.ctno = ctno;
	}
	
}
