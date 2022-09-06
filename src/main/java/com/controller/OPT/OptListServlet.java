package com.controller.OPT;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.OptPageDTO;
import com.service.OptService;

/**
 * Servlet implementation class OptListServlet
 */
@WebServlet("/OptListServlet")
public class OptListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OptListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String curPage = request.getParameter("curPage");//현재페이지 
		if(curPage == null) curPage = "1";//시작시 현재페이지 1 
		
		String searchName = request.getParameter("searchName");
		String searchValue = request.getParameter("searchValue");
		System.out.println("옵션리스트 불러옴"+searchName+"\t"+searchValue);
		OptService service = new OptService();
		OptPageDTO oDTO = service.select(searchName, searchValue, Integer.parseInt(curPage));
		
		request.setAttribute("oDTO", oDTO);
		request.setAttribute("searchName", searchName);
		request.setAttribute("searchValue", searchValue);
		//forward
		RequestDispatcher dis = request.getRequestDispatcher("OPT/OptList.jsp");
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
