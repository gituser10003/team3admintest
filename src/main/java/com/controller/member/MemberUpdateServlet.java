package com.controller.member;

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
import com.service.MemberService;

@WebServlet("/MemberUpdateServlet")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		SawonDTO dto = (SawonDTO)session.getAttribute("login");
		String nextPage=null;
		if (dto!=null) {
			String memno = request.getParameter("memno");
			String memphone1 = request.getParameter("memphone1");
			String memphone2 = request.getParameter("memphone2");
			String memphone3 = request.getParameter("memphone3");
			String mempasswd = request.getParameter("mempasswd");
			String mempoint = request.getParameter("mempoint");
			
			HashMap<String, String> map = new HashMap<>();
			map.put("memno", memno);
			map.put("memphone1", memphone1);
			map.put("memphone2", memphone2);
			map.put("memphone3", memphone3);
			map.put("mempasswd", mempasswd);
			map.put("mempoint", mempoint);
			
			MemberService service = new MemberService();
			int num = service.memberUpdate(map);
			nextPage = "MemberListServlet";
		}else {
			nextPage="LoginUIServlet";
			request.setAttribute("mesg", "로그인이 필요한 작업입니다.");
		}
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
		
	}//end doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
