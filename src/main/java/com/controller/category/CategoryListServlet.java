package com.controller.category;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.CategoryDTO;
import com.dto.CategoryPageDTO;
import com.service.CategoryService;

@WebServlet("/CategoryListServlet")
public class CategoryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String curPage = request.getParameter("curPage");
		if (curPage == null) curPage = "1"; 

		String searchName = request.getParameter("searchName");
		String searchValue = request.getParameter("searchValue");
		System.out.println("카테고리 리스트 불러옴"+searchName+"\t"+searchValue);
		CategoryService service = new CategoryService();
		CategoryPageDTO cDTO = service.select(searchName, searchValue, Integer.parseInt(curPage));
		request.setAttribute("cDTO", cDTO);
		request.setAttribute("searchName", searchName);
		request.setAttribute("searchValue", searchValue);
		//forward
		RequestDispatcher dis = request.getRequestDispatcher("category/categorylist.jsp");
		dis.forward(request, response);
    
//	List<CategoryDTO> list = service.select();
//	request.setAttribute("list", list);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
