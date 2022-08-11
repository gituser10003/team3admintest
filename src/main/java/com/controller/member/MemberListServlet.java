package com.controller.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.MemberDTO;
import com.dto.MemberPageDTO;
import com.service.MemberService;

@WebServlet("/MemberListServlet")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String curPage = request.getParameter("curPage");
		if (curPage == null) curPage = "1"; 

		String searchName = request.getParameter("searchName");
		String searchValue = request.getParameter("searchValue");
		System.out.println(searchName+"\t"+searchValue);
		MemberService service = new MemberService();
		MemberPageDTO mDTO = service.select(searchName, searchValue, Integer.parseInt(curPage));
		request.setAttribute("mDTO", mDTO);
		request.setAttribute("searchName", searchName);
		request.setAttribute("searchValue", searchValue);
		//forward
		RequestDispatcher dis = request.getRequestDispatcher("member/memberlist.jsp");
		dis.forward(request, response);
		
//		List<MemberDTO> list = service.select();
//		request.setAttribute("list", list);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
