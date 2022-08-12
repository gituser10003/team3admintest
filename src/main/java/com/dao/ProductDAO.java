package com.dao;

import java.util.HashMap;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.ProductDTO;
import com.dto.ProductPageDTO;

public class ProductDAO {

	public ProductPageDTO select(SqlSession session, HashMap<String, String> map, int curPage) {
		ProductPageDTO pDTO = new ProductPageDTO();
		int perPage = pDTO.getPerPage();   //한페이지 2개씩 
		int offset = (curPage - 1) * perPage;
		
		List<ProductDTO> list =  session.selectList("ProductMapper.selectPage" , map , new RowBounds(offset, perPage));
		//레코드 시작 번호, 읽어올 갯수 
		
		pDTO.setCurPage(curPage);//현재 페이지번호
		pDTO.setList(list);//페이지 에 해당 데이터
		pDTO.setTotalCount(totalCount(session,map));//전체 레코드 갯수 저장 
		
		return pDTO;
	
	}
	public int totalCount(SqlSession session,HashMap<String, String> map) {
		return session.selectOne("ProductMapper.totalCount",map);
	}
	public ProductDTO ProductRetrieve(SqlSession session, String pdno) {
		ProductDTO n = session.selectOne("ProductMapper.ProductRetrieve", pdno);
        return n;
	}
	public int ProductUpdate(SqlSession session, HashMap<String, Object> map) {
		int n = session.update("ProductMapper.ProductUpdate", map);
		return n;
	}
	public int ProductAdd(SqlSession session, ProductDTO dto) {
		int n = session.insert("ProductMapper.ProductAdd", dto);
		return n;
	}
	public int ProductDel(SqlSession session, String pdno) {
		int n = session.delete("ProductMapper.ProductDel",pdno);
		return n;
	}
	

}
