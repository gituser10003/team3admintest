package com.controller.category;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.SawonDTO;
import com.service.CategoryService;

@WebServlet("/CategoryDelServlet")
public class CategoryDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		SawonDTO dto = (SawonDTO)session.getAttribute("login");
		String nextPage = null;
		if (dto!=null) {
			String ctno = request.getParameter("ctno");
			
			CategoryService service = new CategoryService();
			int n = service.categoryDel(ctno);
			System.out.println("카테고리 삭제 완료"+n);
			nextPage = "CategoryListServlet";
		}else {
			nextPage = "Page2.jsp";
			session.setAttribute("mesg", "로그인이 필요한 작업입니다.");
		}
		response.sendRedirect(nextPage);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
