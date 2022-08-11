package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.MemberDTO;
import com.dto.MemberPageDTO;

public class MemberDAO {

	public List<MemberDTO> select(SqlSession session) {
		List<MemberDTO> list = session.selectList("MemberMapper.select");
		return list;
	}

	public MemberDTO MemberRetrieve(SqlSession session, String memno) {
		MemberDTO n = session.selectOne("MemberMapper.MemberRetrieve", memno);
		return n;
	}

	public int memberUpdate(SqlSession session, HashMap<String, String> map) {
		int n = session.update("MemberMapper.memberUpdate", map);
		return n;
	}

	public int memberDel(SqlSession session, String memno) {
		int n = session.delete("MemberMapper.memberDel",memno);
		return n;
	}

	public MemberPageDTO select(SqlSession session, HashMap<String, String> map, int curPage) {
		MemberPageDTO mDTO = new MemberPageDTO();
		int perPage = mDTO.getPerPage();
		int offset = (curPage - 1) * perPage;
		
		List<MemberDTO> list = session.selectList("MemberMapper.selectPage", map, new RowBounds(offset, perPage));
		//레코드 시작 번호, 읽어올 갯수 
		
		mDTO.setCurPage(curPage);//현재 페이지번호
		mDTO.setList(list);
		mDTO.setTotalCount(totalCount(session,map));
		return mDTO;
	}
	
	public int totalCount(SqlSession session,HashMap<String, String> map) {
		return session.selectOne("MemberMapper.totalCount",map);
	}

}
