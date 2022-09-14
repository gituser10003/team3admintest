package com.controller.sawon;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.SawonDTO;
import com.service.SawonService;

@WebServlet("/SawonRetrieveServlet")
public class SawonRetrieveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
        request.setCharacterEncoding("UTF-8");
		
		String userid = request.getParameter("userid");

		SawonDTO dto = null;

		SawonService service = new SawonService();

			    dto = service.SawonRetrieve(userid);
			    request.setAttribute("dto", dto);


		RequestDispatcher dis = request.getRequestDispatcher("sawonlist/sawonedit.jsp");
		dis.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
