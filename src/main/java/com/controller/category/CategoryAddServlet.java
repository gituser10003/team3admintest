package com.controller.category;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.CategoryDTO;
import com.dto.SawonDTO;
import com.service.CategoryService;

import oracle.net.aso.f;

@WebServlet("/CategoryAddServlet")
public class CategoryAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		SawonDTO sdto = (SawonDTO)session.getAttribute("login");
		String nextPage = null;
		if (sdto!=null) {
			//String ctno = request.getParameter("ctno");
			String ctnm = request.getParameter("ctnm");
			
			CategoryDTO dto = new CategoryDTO();
			//dto.setCtno(Integer.parseInt(ctno));
			dto.setCtnm(ctnm);
			
			CategoryService service = new CategoryService();
			int n = service.categoryAdd(dto);
			
			nextPage = "CategoryListServlet";
			session.setAttribute("categoryAdd", "회원등록성공");
			session.setMaxInactiveInterval(5);
		}else {
			nextPage = "LoginUIServlet";
			session.setAttribute("mesg", "로그인이 필요한 작업입니다.");
		}
		response.sendRedirect(nextPage);
			
			
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
