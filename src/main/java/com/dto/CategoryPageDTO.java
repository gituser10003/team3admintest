package com.dto;

import java.util.List;

public class CategoryPageDTO {
	private List<CategoryDTO> list;
	private int curPage;    
	private int perPage=10;  
	private int totalCount;
	
	public CategoryPageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public List<CategoryDTO> getList() {
		return list;
	}

	public void setList(List<CategoryDTO> list) {
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
