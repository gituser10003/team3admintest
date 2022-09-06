package com.dto;

import java.util.List;

public class OptPageDTO {
	private List<OptDTO> list;   
	private int curPage;    
	private int perPage=10;  
	private int totalCount;
	public OptPageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OptPageDTO(List<OptDTO> list, int curPage, int perPage, int totalCount) {
		super();
		this.list = list;
		this.curPage = curPage;
		this.perPage = perPage;
		this.totalCount = totalCount;
	}
	@Override
	public String toString() {
		return "OptPageDTO [list=" + list + ", curPage=" + curPage + ", perPage=" + perPage + ", totalCount="
				+ totalCount + "]";
	}
	public List<OptDTO> getList() {
		return list;
	}
	public void setList(List<OptDTO> list) {
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
