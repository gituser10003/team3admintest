package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.CategoryDTO;
import com.dto.CategoryPageDTO;

public class CategoryDAO {

	public List<CategoryDTO> select(SqlSession session) {
		List<CategoryDTO> list = session.selectList("CategoryMapper.selectAll");
		return list;
	}

	public int categoryAdd(SqlSession session, CategoryDTO dto) {
		int n = session.insert("CategoryMapper.categoryAdd", dto);
		return n;
	}

	public CategoryDTO CategoryRetrieve(SqlSession session, String ctno) {
		CategoryDTO n = session.selectOne("CategoryMapper.CategoryRetrieve", ctno);
		return n;
	}

	public int categoryUpdate(SqlSession session, HashMap<String, Object> map) {
		int n = session.update("CategoryMapper.categoryUpdate", map);
		return n;
	}

	public int categoryDel(SqlSession session, String ctno) {
		int n = session.delete("CategoryMapper.categoryDel", ctno);
		return n;
	}

	public CategoryPageDTO select(SqlSession session, HashMap<String, String> map, int curPage) {
		CategoryPageDTO cDTO = new CategoryPageDTO();
		int perPage = cDTO.getPerPage();
		int offset = (curPage - 1) * perPage;
		
		List<CategoryDTO> list = session.selectList("CategoryMapper.selectPage", map, new RowBounds(offset, perPage));
		//레코드 시작 번호, 읽어올 갯수 
		
		cDTO.setCurPage(curPage);//현재 페이지번호
		cDTO.setList(list);
		cDTO.setTotalCount(totalCount(session,map));
		return cDTO;
	}
	public int totalCount(SqlSession session,HashMap<String, String> map) {
		return session.selectOne("CategoryMapper.totalCount",map);
	}

}
