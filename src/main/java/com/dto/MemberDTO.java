package com.dto;

public class MemberDTO {
	
	String memno;
	String phone1;
	String phone2;
	String phone3;
	int mempoint;
	
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(String memno, String phone1, String phone2, String phone3, int mempoint) {
		super();
		this.memno = memno;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.mempoint = mempoint;
	}

	public String getMemno() {
		return memno;
	}

	public void setMemno(String memno) {
		this.memno = memno;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public int getMempoint() {
		return mempoint;
	}

	public void setMempoint(int mempoint) {
		this.mempoint = mempoint;
	}

	@Override
	public String toString() {
		return "MemberDTO [memno=" + memno + ", phone1=" + phone1 + ", phone2=" + phone2 + ", phone3=" + phone3
				+ ", mempoint=" + mempoint + "]";
	}
	
	
}
