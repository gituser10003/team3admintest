package com.service;

import java.util.HashMap;
import java.util.List;

import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.CategoryDAO;
import com.dto.CategoryDTO;
import com.dto.CategoryPageDTO;

public class CategoryService {

	public List<CategoryDTO> select() {
		CategoryDAO dao = new CategoryDAO();
		SqlSession session = MySqlSessionFactory.getSession();
		List<CategoryDTO> list = null;
		try {
			list = dao.select(session);
		} finally {
			session.close();
		}
		return list;
	}

	public int categoryAdd(CategoryDTO dto) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			CategoryDAO dao = new CategoryDAO();
			n = dao.categoryAdd(session,dto);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}

	public CategoryDTO CategoryRetrieve(String ctno) {
		SqlSession session = MySqlSessionFactory.getSession();
		CategoryDTO dto = null;
		try {
			CategoryDAO dao = new CategoryDAO();
			dto = dao.CategoryRetrieve(session, ctno);
			session.commit();
		} finally {
			session.close();
		}
		return dto;
	}

	public int categoryUpdate(HashMap<String, Object> map) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			CategoryDAO dao = new CategoryDAO();
			n = dao.categoryUpdate(session, map);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}

	public int categoryDel(String ctno) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			CategoryDAO dao = new CategoryDAO();
			n = dao.categoryDel(session, ctno);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}

	public CategoryPageDTO select(String searchName, String searchValue, int curPage) {
		HashMap<String, String> map = new HashMap<>();
		map.put("searchName", searchName);
		map.put("searchValue", searchValue);
		
		CategoryDAO dao = new CategoryDAO();
		SqlSession session = MySqlSessionFactory.getSession();
		CategoryPageDTO cDTO = null;
		try {
			cDTO = dao.select(session, map, curPage);
//		} catch (Exception e) {
//			e.printStackTrace();
		}finally {
			session.close();
		}
		return cDTO;
	}
	
	

}
