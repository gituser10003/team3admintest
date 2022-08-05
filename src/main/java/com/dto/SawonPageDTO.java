package com.dto;

import java.util.List;

public class SawonPageDTO {
	private List<SawonDTO> list;   
	private int curPage;    
	private int perPage=10;  
	private int totalCount;
	public SawonPageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public List<SawonDTO> getList() {
		return list;
	}
	public void setList(List<SawonDTO> list) {
		this.list = list;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	} 
	
}
