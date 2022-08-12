package com.service;

import java.util.HashMap;




import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.ProductDAO;
import com.dto.ProductDTO;
import com.dto.ProductPageDTO;

public class ProductService {
	
	public ProductPageDTO select(String searchName, String searchValue, int curPage) {
		HashMap<String, String> map = new HashMap<>();
		map.put("searchName", searchName);
		map.put("searchValue", searchValue);
		
		ProductDAO dao = new   ProductDAO();
		 SqlSession session = MySqlSessionFactory.getSession();
		 ProductPageDTO pDTO = null;
		 try {
			 pDTO = dao.select(session,map, curPage);
	    	  
//	      }catch(Exception e) {
//	    	  e.printStackTrace();
	      }finally {
			session.close();
	      }
	      return pDTO;
		}//end select

	public ProductDTO ProductRetrieve(String pdno) {
		SqlSession session = MySqlSessionFactory.getSession();
		ProductDTO dto = null;
        try {
            ProductDAO dao = new ProductDAO();
            dto = dao.ProductRetrieve(session, pdno);
            session.commit();
        } finally {
            session.close();
        }
        return dto;
	}

	public int ProductUpdate(HashMap<String, Object> map) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			ProductDAO dao = new ProductDAO();
			n = dao.ProductUpdate(session, map);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}

	public int ProductAdd(ProductDTO dto) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			ProductDAO dao = new ProductDAO();
			n = dao.ProductAdd(session, dto);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}//end sawonAdd

	public int ProductDel(String pdno) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			ProductDAO dao = new ProductDAO();
			n = dao.ProductDel(session, pdno);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}
	
}
