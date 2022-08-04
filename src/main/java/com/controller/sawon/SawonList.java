package com.controller.sawon;

import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.SawonDTO;
import com.service.SawonService;


@WebServlet("/SawonList")
public class SawonList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   public SawonList() {
	        super();
	        // TODO Auto-generated constructor stub
	    }
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SawonService service=new SawonService();
		List<SawonDTO> list=service.select();
		request.setAttribute("list", list);
		RequestDispatcher dis = request.getRequestDispatcher("sawonlist/Page4.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
