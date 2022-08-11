package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.MemberDAO;
import com.dto.MemberDTO;
import com.dto.MemberPageDTO;

public class MemberService {

	public List<MemberDTO> select() {
		MemberDAO dao = new MemberDAO();
		SqlSession session = MySqlSessionFactory.getSession();
		List<MemberDTO> list = null;
		try {
			list = dao.select(session);
		} finally {
			session.close();
		}
		return list;
	}

	public MemberDTO MemberRetrieve(String memno) {
		SqlSession session = MySqlSessionFactory.getSession();
		MemberDTO dto = null;
		try {
			MemberDAO dao = new MemberDAO();
			dto = dao.MemberRetrieve(session, memno);
			session.commit();
		} finally {
			session.close();
		}
		return dto;
	}

	public int memberUpdate(HashMap<String, String> map) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			MemberDAO dao = new MemberDAO();
			n = dao.memberUpdate(session, map);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}

	public int memberDel(String memno) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			MemberDAO dao = new MemberDAO();
			n = dao.memberDel(session, memno);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}

	public MemberPageDTO select(String searchName, String searchValue, int curPage) {
		HashMap<String, String> map = new HashMap<>();
		map.put("searchName", searchName);
		map.put("searchValue", searchValue);
		
		MemberDAO dao = new MemberDAO();
		SqlSession session = MySqlSessionFactory.getSession();
		MemberPageDTO mDTO = null;
		try {
			mDTO = dao.select(session,map, curPage);
//		} catch (Exception e) {
//			e.printStackTrace();
		}finally {
			session.close();
		}
		return mDTO;
	}



}
