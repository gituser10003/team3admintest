package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.OptDTO;
import com.dto.OptPageDTO;

public class OptDAO {

	public OptPageDTO select(SqlSession session, HashMap<String, String> map, int curPage) {
		OptPageDTO oDTO = new OptPageDTO();
		int perPage = oDTO.getPerPage();   //한페이지 2개씩 
		int offset = (curPage - 1) * perPage;
		
		List<OptDTO> list =  session.selectList("OptMapper.selectPage" , map , new RowBounds(offset, perPage));
		//레코드 시작 번호, 읽어올 갯수 
		
		oDTO.setCurPage(curPage);//현재 페이지번호
		oDTO.setList(list);//페이지 에 해당 데이터
		oDTO.setTotalCount(totalCount(session,map));//전체 레코드 갯수 저장 
		
		return oDTO;
	}
	public int totalCount(SqlSession session,HashMap<String, String> map) {
		return session.selectOne("OptMapper.totalCount",map);
	}
	public OptDTO OptRetrieve(SqlSession session, String optno) {
		OptDTO n = session.selectOne("OptMapper.OptRetrieve", optno);
        return n;
	}
	public int OptAdd(SqlSession session, OptDTO dto) {
		int n = session.insert("OptMapper.OptAdd", dto);
		return n;
	}
	public int OptUpdate(SqlSession session, HashMap<String, Object> map) {
		int n = session.update("OptMapper.OptUpdate", map);
		return n;
	}
	public int OptDel(SqlSession session, String optno) {
		int n = session.delete("OptMapper.OptDel",optno);
		return n;
	}

}
