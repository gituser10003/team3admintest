package com.controller.OPT;

import java.io.IOException;

import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.SawonDTO;
import com.service.OptService;

/**
 * Servlet implementation class OptUpdateServlet
 */
@WebServlet("/OptUpdateServlet")
public class OptUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OptUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		SawonDTO dto = (SawonDTO)session.getAttribute("login");
		String nextPage=null;
		if (dto!=null) {
			String optno=request.getParameter("optno");
			String optnm=request.getParameter("optnm");
			String optprice=request.getParameter("optprice");
			String ctno=request.getParameter("ctno");
			
			HashMap<String, Object> map = new HashMap<>();
			map.put("optno", Integer.parseInt(optno));
			map.put("optnm", optnm);
			map.put("optprice", Integer.parseInt(optprice));
			map.put("ctno", Integer.parseInt(ctno));
			
			OptService service = new OptService();
			int num = service.OptUpdate(map);
			nextPage = "OptListServlet";
		}else {
			nextPage="LoginUIServlet";
			request.setAttribute("mesg", "로그인이 필요한 작업입니다.");
		}
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
		
	}//end doGet

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
