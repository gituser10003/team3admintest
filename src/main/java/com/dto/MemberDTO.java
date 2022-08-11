package com.dto;

public class MemberDTO {

	private String memno;
	private String memphone1;
	private String memphone2;
	private String memphone3;
	private String mempasswd;
	private String mempoint;
	
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(String memno, String memphone1, String memphone2, String memphone3, String mempasswd,
			String mempoint) {
		super();
		this.memno = memno;
		this.memphone1 = memphone1;
		this.memphone2 = memphone2;
		this.memphone3 = memphone3;
		this.mempasswd = mempasswd;
		this.mempoint = mempoint;
	}

	public String getMemno() {
		return memno;
	}

	public void setMemno(String memno) {
		this.memno = memno;
	}

	public String getMemphone1() {
		return memphone1;
	}

	public void setMemphone1(String memphone1) {
		this.memphone1 = memphone1;
	}

	public String getMemphone2() {
		return memphone2;
	}

	public void setMemphone2(String memphone2) {
		this.memphone2 = memphone2;
	}

	public String getMemphone3() {
		return memphone3;
	}

	public void setMemphone3(String memphone3) {
		this.memphone3 = memphone3;
	}

	public String getMempasswd() {
		return mempasswd;
	}

	public void setMempasswd(String mempasswd) {
		this.mempasswd = mempasswd;
	}

	public String getMempoint() {
		return mempoint;
	}

	public void setMempoint(String mempoint) {
		this.mempoint = mempoint;
	}

	@Override
	public String toString() {
		return "MemberDTO [memno=" + memno + ", memphone1=" + memphone1 + ", memphone2=" + memphone2 + ", memphone3="
				+ memphone3 + ", mempasswd=" + mempasswd + ", mempoint=" + mempoint + "]";
	}
	
	
	
}
