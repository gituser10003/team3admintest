package com.dto;

public class CategoryDTO {
	
	int ctno;
	String ctnm;
	
	public CategoryDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CategoryDTO(int ctno, String ctnm) {
		super();
		this.ctno = ctno;
		this.ctnm = ctnm;
	}

	public int getCtno() {
		return ctno;
	}

	public void setCtno(int ctno) {
		this.ctno = ctno;
	}

	public String getCtnm() {
		return ctnm;
	}

	public void setCtnm(String ctnm) {
		this.ctnm = ctnm;
	}

	@Override
	public String toString() {
		return "CategoryDTO [ctno=" + ctno + ", ctnm=" + ctnm + "]";
	}

}
