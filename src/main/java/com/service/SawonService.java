package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.SawonDAO;
import com.dto.SawonDTO;

public class SawonService {

	public int sawonAdd(SawonDTO dto) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			SawonDAO dao = new SawonDAO();
			n = dao.sawonAdd(session, dto);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}//end sawonAdd
	
	
	
	public int idCheck(String userid) {
		SqlSession session = MySqlSessionFactory.getSession();
		int count = 0;
		try {
			SawonDAO dao = new SawonDAO();
			count = dao.idCheck(session, userid);
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return count;
	}//end idCheck



	public SawonDTO login(HashMap<String, String> map) {
		SqlSession session = MySqlSessionFactory.getSession();
		SawonDTO dto = null;
		try {
			SawonDAO dao = new SawonDAO();
			dto = dao.login(session,map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return dto;
	}//end login



	public List<SawonDTO> select() {
		SawonDAO dao = new   SawonDAO();
		 SqlSession session = MySqlSessionFactory.getSession();
		 List<SawonDTO> list = null; 
		 try {
	      list = dao.select(session);
	      }finally {
			session.close();
	      }
	      return list;
		}

	public SawonDTO SawonRetrieve(String username) {
		SqlSession session = MySqlSessionFactory.getSession();
        SawonDTO dto = null;
        try {
            SawonDAO dao = new SawonDAO();
            dto = dao.SawonRetrieve(session, username);
            session.commit();
        } finally {
            session.close();
        }
        return dto;
	}
	
	public int SawonDel(String userid) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			SawonDAO dao = new SawonDAO();
			n = dao.SawonDel(session, userid);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}// end sawondel
}//end class
