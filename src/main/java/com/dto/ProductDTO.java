package com.dto;

public class ProductDTO {
	private String pdno;
	private String pdnm;
	private int pdprice;
	private String ctno;
	private String pdfile;
	public ProductDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductDTO(String pdno, String pdnm, int pdprice, String ctno, String pdfile) {
		super();
		this.pdno = pdno;
		this.pdnm = pdnm;
		this.pdprice = pdprice;
		this.ctno = ctno;
		this.pdfile = pdfile;
	}
	public String getPdno() {
		return pdno;
	}
	public void setPdno(String pdno) {
		this.pdno = pdno;
	}
	public String getPdnm() {
		return pdnm;
	}
	public void setPdnm(String pdnm) {
		this.pdnm = pdnm;
	}
	public int getPdprice() {
		return pdprice;
	}
	public void setPdprice(int pdprice) {
		this.pdprice = pdprice;
	}
	public String getCtno() {
		return ctno;
	}
	public void setCtno(String ctno) {
		this.ctno = ctno;
	}
	public String getPdfile() {
		return pdfile;
	}
	public void setPdfile(String pdfile) {
		this.pdfile = pdfile;
	}
	@Override
	public String toString() {
		return "ProductDTO [pdno=" + pdno + ", pdnm=" + pdnm + ", pdprice=" + pdprice + ", ctno=" + ctno + ", pdfile="
				+ pdfile + "]";
	}

	
}
