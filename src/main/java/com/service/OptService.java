package com.service;

import java.util.HashMap;




import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.OptDAO;
import com.dto.OptDTO;
import com.dto.OptPageDTO;

public class OptService {

	public OptPageDTO select(String searchName, String searchValue, int curPage) {
		HashMap<String, String> map = new HashMap<>();
		map.put("searchName", searchName);
		map.put("searchValue", searchValue);
		
		OptDAO dao = new   OptDAO();
		 SqlSession session = MySqlSessionFactory.getSession();
		 OptPageDTO oDTO = null;
		 try {
			 oDTO = dao.select(session,map, curPage);
	    	  
//	      }catch(Exception e) {
//	    	  e.printStackTrace();
	      }finally {
			session.close();
	      }
	      return oDTO;
		}//end select

	public OptDTO OptRetrieve(String optno) {
		SqlSession session = MySqlSessionFactory.getSession();
		OptDTO dto = null;
        try {
            OptDAO dao = new OptDAO();
            dto = dao.OptRetrieve(session, optno);
            session.commit();
        } finally {
            session.close();
        }
        return dto;
	}

	public int OptAdd(OptDTO dto) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			OptDAO dao = new OptDAO();
			n = dao.OptAdd(session, dto);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}//end 

	public int OptUpdate(HashMap<String, Object> map) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			OptDAO dao = new OptDAO();
			n = dao.OptUpdate(session, map);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}

	public int OptDel(String optno) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			OptDAO dao = new OptDAO();
			n = dao.OptDel(session, optno);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}

}
