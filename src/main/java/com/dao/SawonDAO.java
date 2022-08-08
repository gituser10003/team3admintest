package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.SawonDTO;
import com.dto.SawonPageDTO;

public class SawonDAO {
	
	public int sawonAdd(SqlSession session, SawonDTO dto) {
		int n = session.insert("SawonMapper.sawonAdd", dto);
		return n;
	}

	public int idCheck(SqlSession session, String userid) {
		int count = session.selectOne("SawonMapper.idCheck",userid);
		return count;
	}

	public SawonDTO login(SqlSession session, HashMap<String, String> map) {
		SawonDTO n = session.selectOne("SawonMapper.login",map);
		return n;
	}

	public List<SawonDTO> select(SqlSession session) {
		List<SawonDTO> list =  session.selectList("SawonMapper.selectAll");
		return list;
	}

	public SawonDTO SawonRetrieve(SqlSession session, String userid) {
		SawonDTO n = session.selectOne("SawonMapper.SawonRetrieve", userid);
        return n;
	}
	
	public int SawonDel(SqlSession session, String userid) {
		int n = session.delete("SawonMapper.SawonDel", userid);
		return n;
	}

	public int sawonUpdate(SqlSession session, SawonDTO dto) {
		int n = session.update("SawonMapper.sawonUpdate", dto);
		return n;
	}

	public SawonPageDTO select(SqlSession session, HashMap<String, String> map, int curPage) {
		SawonPageDTO pDTO = new SawonPageDTO();
		int perPage = pDTO.getPerPage();   //한페이지 2개씩 
		int offset = (curPage - 1) * perPage;
		
		List<SawonDTO> list =  session.selectList("SawonMapper.selectPage" , map , new RowBounds(offset, perPage));
		//레코드 시작 번호, 읽어올 갯수 
		
		pDTO.setCurPage(curPage);//현재 페이지번호
		pDTO.setList(list);//페이지 에 해당 데이터
		pDTO.setTotalCount(totalCount(session,map));//전체 레코드 갯수 저장 
		
		return pDTO;
	
	}
	public int totalCount(SqlSession session,HashMap<String, String> map) {
		return session.selectOne("SawonMapper.totalCount",map);
	}

}
