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
import com.dto.SawonPageDTO;
import com.service.SawonService;


@WebServlet("/SawonListServlet")
public class SawonListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   public SawonListServlet() {
	        super();
	        // TODO Auto-generated constructor stub
	    }
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String curPage = request.getParameter("curPage");//현재페이지 
		if(curPage == null) curPage = "1";//시작시 현재페이지 1 
		
		String searchName = request.getParameter("searchName");
		String searchValue = request.getParameter("searchValue");
		System.out.println("사원 리스트 불러옴"+searchName+"\t"+searchValue);
		SawonService service = new SawonService();
		SawonPageDTO pDTO = service.select(searchName, searchValue, Integer.parseInt(curPage));
		
		request.setAttribute("pDTO", pDTO);
		request.setAttribute("searchName", searchName);
		request.setAttribute("searchValue", searchValue);
		//forward
		RequestDispatcher dis = request.getRequestDispatcher("sawonlist/Page4.jsp");
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
