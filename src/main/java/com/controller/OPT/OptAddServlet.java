package com.controller.OPT;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.OptDTO;
import com.dto.SawonDTO;
import com.service.OptService;

/**
 * Servlet implementation class OptAddServlet
 */
@WebServlet("/OptAddServlet")
public class OptAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OptAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
	      SawonDTO sdto = (SawonDTO)session.getAttribute("login");
		 String nextPage = null;
	      if(sdto!=null) {//회원인경우 
		String optnm=request.getParameter("optnm");
		String optprice=request.getParameter("optprice");
		String ctno=request.getParameter("ctno");
		OptDTO dto=new OptDTO();
		System.out.println(optnm);
		System.out.println(optprice);
		System.out.println(ctno);
		dto.setOptnm(optnm);
		dto.setOptprice(Integer.parseInt(optprice));
		dto.setCtno(Integer.parseInt(ctno));
	
		OptService service=new OptService();
		int n=service.OptAdd(dto);
		
		nextPage = "OptListServlet";
		session.setAttribute("OptAdd", "상품기입성공");
		session.setMaxInactiveInterval(5);
		/* response.sendRedirect("ProductListServlet"); */

      }else {
		  nextPage = "LoginUIServlet";
		  session.setAttribute("mesg", "로그인이 필요한 작업입니다.");
	  }
     
    response.sendRedirect(nextPage);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
