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

/**
 * Servlet implementation class SawonDelServlet
 */
@WebServlet("/SawonDelServlet")
public class SawonDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SawonDelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
	      SawonDTO dto = (SawonDTO)session.getAttribute("login");
		 String nextPage = null;
	      if(dto!=null) {
	       String userid = request.getParameter("userid");
	       SawonService service = new SawonService();
	       int n = service.SawonDel(userid);
	       System.out.println("사원 삭제 완료"+n);
			nextPage = "SawonListServlet";
	      }else {
			  nextPage = "Page2.jsp";
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
