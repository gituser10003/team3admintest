package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.SawonDTO;

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

	public SawonDTO SawonRetrieve(SqlSession session, String username) {
		SawonDTO n = session.selectOne("SawonMapper.SawonRetrieve", username);
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

}
