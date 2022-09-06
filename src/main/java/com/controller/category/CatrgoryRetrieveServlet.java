package com.controller.category;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.CategoryDTO;
import com.service.CategoryService;

@WebServlet("/CatrgoryRetrieveServlet")
public class CatrgoryRetrieveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String ctno = request.getParameter("ctno");
		
		CategoryDTO dto = null;
		
		CategoryService service = new CategoryService();
		
		dto = service.CategoryRetrieve(ctno);
		request.setAttribute("dto", dto);
		
		RequestDispatcher dis = request.getRequestDispatcher("category/categoryedit.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
