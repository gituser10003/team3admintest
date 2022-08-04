package com.controller.sawon;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.SawonDTO;
import com.service.SawonService;

@WebServlet("/SawonAddServlet")

public class SawonAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		String username = request.getParameter("username");
		String phonenumber1 = request.getParameter("phonenumber1");
		String phonenumber2 = request.getParameter("phonenumber2");
		String phonenumber3 = request.getParameter("phonenumber3");
		String birthday1 = request.getParameter("birthday1");
		String birthday2 = request.getParameter("birthday2");
		String birthday3 = request.getParameter("birthday3");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String sawongrade = request.getParameter("sawongrade");
		
	SawonDTO  dto =
			new SawonDTO(userid, passwd, username, phonenumber1, phonenumber2, phonenumber3,
				birthday1, birthday2, birthday3, email1, email2, sawongrade);
	
	SawonService service = new SawonService();
	int n = service.sawonAdd(dto);
	
	HttpSession session = request.getSession();
	session.setAttribute("sawonAdd", "회원가입성공");
	session.setMaxInactiveInterval(5);
	response.sendRedirect("main.jsp");
	
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
